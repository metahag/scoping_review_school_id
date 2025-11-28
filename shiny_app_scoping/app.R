library(shiny)
library(DT)
library(bslib)
library(dplyr)
library(tidyr)
library(ggplot2)
library(vroom)
library(showtext)
library(here)
library(leaflet)
library(plotly)

world_map <- map_data("world")

# Load custom font
font_add("FontAwesome", regular = here("1_data", "Font Awesome 5 Free-Solid-900.otf"))
font_add_google("Space Mono", "space_mono")
showtext_auto()

# Load dataset and set up the data
source(here("1_data","clean_dataset.R"))

# clean up country names for the app
# Lookup vector
country_lookup <- c(
  "USA" = "United States of America",
  "UK" = "United Kingdom",
  "N. Cyprus" = "Northern Cyprus",
  "South Korea" = "South Korea",
  "Czech Republic" = "Czechia",
  "Wales" = "United Kingdom",
  "Puerto Rico" = "Puerto Rico",
  
  # identities
  "Turkey" = "Turkey",
  "Taiwan" = "Taiwan",
  "Israel" = "Israel",
  "Norway" = "Norway",
  "Australia" = "Australia",
  "Canada" = "Canada",
  "Saudi Arabia" = "Saudi Arabia",
  "Spain" = "Spain",
  "Indonesia" = "Indonesia",
  "Japan" = "Japan",
  "China" = "China",
  "Italy" = "Italy",
  "Ireland" = "Ireland",
  "Greece" = "Greece",
  "New Zealand" = "New Zealand",
  "Singapore" = "Singapore",
  "Pakistan" = "Pakistan",
  "South Africa" = "South Africa",
  "Netherlands" = "Netherlands",
  "Brazil" = "Brazil",
  "Germany" = "Germany",
  "Sri Lanka" = "Sri Lanka",
  "Vietnam" = "Vietnam",
  "Sweden" = "Sweden",
  "Lebanon" = "Lebanon",
  "Nigeria" = "Nigeria",
  "Egypt" = "Egypt",
  "United Arab Emirates" = "United Arab Emirates",
  "Tunisia" = "Tunisia",
  "France" = "France",
  "Portugal" = "Portugal",
  "India" = "India",
  "Serbia" = "Serbia",
  "North Macedonia" = "North Macedonia",
  "Belgium" = "Belgium",
  "Switzerland" = "Switzerland",
  "Slovenia" = "Slovenia",
  "Romania" = "Romania",
  "Poland" = "Poland",
  "Mexico" = "Mexico",
  "Venezuela" = "Venezuela",
  "Ghana" = "Ghana",
  "Ukraine" = "Ukraine",
  "Kuwait" = "Kuwait",
  "Chile" = "Chile",
  "Thailand" = "Thailand",
  "Ecuador" = "Ecuador",
  "Kazakhstan" = "Kazakhstan",
  "Armenia" = "Armenia"
)

# Recoding function for multi-country strings
recode_multiple <- function(x) {
  if (is.na(x)) return(NA_character_)
  
  countries <- str_split(x, ",\\s*")[[1]]
  recoded <- map_chr(countries, ~ country_lookup[.x] %||% .x)
  paste(recoded, collapse = ", ")
}

# Apply to dataset
compressed_data <- compressed_data %>%
  mutate(country_clean = map_chr(country_clean, recode_multiple))

# Subset data for each section
shiny_population <- compressed_data %>% 
  select(doi, title, covidence_id, covidence_study, population_of_interest, country_clean,
         participant_id, sample_size_clean, gender_clean, school_level)

shiny_intervention <- compressed_data %>% 
  select(doi, covidence_id, intervention_theme, intervention, operationalization, rationale_clean, 
         instructor_clean, setting_institution_clean, setting_room_clean)

shiny_outcome <- compressed_data %>% 
  select(doi, covidence_id, category, instrument_standardization, outcome, operationalization_of_the_outcome, examiner_clean)

shiny_integrity <- ethics_year %>% 
  select(covidence_id, published_year, ethical_approval, consent, data_adequate, materials_adequate, prereg_adequate)

# Merge subsets
#entire dataset
shiny_complete <- compressed_data %>% 
  select(covidence_id, covidence_study, population_of_interest, country_clean,
         participant_id, sample_size_clean, gender_clean, school_grade, school_level,
         intervention_theme, intervention, operationalization, rationale_clean, 
         instructor_clean, setting_institution_clean, setting_room_clean,
         category, instrument_standardization, outcome, operationalization_of_the_outcome, examiner_clean)
shiny_complete <- left_join(shiny_complete, ethics_year, by = "covidence_id")


# Helper function to handle pipe-separated values for filtering
split_and_filter <- function(df, column, filter_value) {
  if (filter_value != "All") {
    df <- df %>%
      mutate(temp_column = strsplit(as.character(get(column)), "\\|")) %>%
      unnest(temp_column) %>%
      mutate(temp_column = trimws(tolower(temp_column))) %>%
      filter(temp_column == filter_value) %>%
      select(-temp_column)
  }
  return(df)
}

# Helper function to handle multiple levels of separation and cleanup
unique_values_recursive <- function(df, column, sep1, sep2) {
  df %>%
    separate_rows({{ column }}, sep = sep1) %>%
    separate_rows({{ column }}, sep = sep2) %>%
    mutate({{ column }} := trimws(tolower({{ column }}))) %>%
    distinct({{ column }}) %>%
    pull({{ column }})
}


########## Intervention plot #############
pub_year <- ethics_year %>% select(covidence_id, published_year)
int_themes <- clean_shiny %>% select(covidence_id, covidence_study, intervention_theme)

i_data_plot <- left_join(pub_year, int_themes, by = "covidence_id") %>% drop_na() %>% 
  group_by(covidence_study) %>% distinct() %>% separate_rows(intervention_theme)

######################################################################################################
################################################### Define UI ########################################
######################################################################################################

ui <- fluidPage(
  
  theme = bslib::bs_theme(
    bg = "#ffe5e5",
    fg =  "#640D14",
    base_font = font_google("Space Mono")
  ),
  
  # Application title
  titlePanel("School-based interventions for students with ID"),
  
  # Tabs for dataset sections
  navbarPage("Data",
             tabPanel("Overview",
                      leaflet::leafletOutput("world_map", height = "600px"),
                      plotly::plotlyOutput("intervention_years")
             ),
             tabPanel("Population",
                      selectInput("filter_country", "Country", 
                                  choices = c("All", unique_values_recursive(shiny_population, country_clean, "\\|", ",")), 
                                  selected = "All"),
                      DT::dataTableOutput("population_table")
             ),
             tabPanel("Intervention",
                      selectInput("filter_theme", "Intervention Theme", 
                                  choices = c("All", unique_values_recursive(shiny_intervention, intervention_theme, "\\|", ",")), 
                                  selected = "All"),
                      DT::dataTableOutput("intervention_table")
             ),
             tabPanel("Outcome",
                      selectInput("filter_category", "Outcome Category", 
                                  choices = c("All", unique_values_recursive(shiny_outcome, category, "\\|", ";")), 
                                  selected = "All"),
                      DT::dataTableOutput("outcome_table")
             ),
             tabPanel("Research Integrity",
                      DT::dataTableOutput("integrity_table")
             )
  ),
  
  downloadButton("download", "Download Dataset (filtered or complete) (.tsv)")
)




######################################################################################################
################################################### Define server ####################################
######################################################################################################
server <- function(input, output) {

  # Filtered datasets
  filtered_population <- reactive({
    split_and_filter(shiny_population, "country_clean", input$filter_country)
  })
  
  filtered_intervention <- reactive({
    split_and_filter(shiny_intervention, "intervention_theme", input$filter_theme)
  })
  
  filtered_outcome <- reactive({
    split_and_filter(shiny_outcome, "category", input$filter_category)
  })
  
  filtered_complete <- reactive({
    data <- shiny_complete
    if (input$filter_country != "All") {
      data <- data %>% split_and_filter("country_clean", input$filter_country)
    }
    if (input$filter_theme != "All") {
      data <- data %>% split_and_filter("intervention_theme", input$filter_theme)
    }
    if (input$filter_category != "All") {
      data <- data %>% split_and_filter("category", input$filter_category)
    }
    return(data)
  })
  
  # Render tables
  output$population_table <- DT::renderDataTable({
    filtered_population()
  })
  
  output$intervention_table <- DT::renderDataTable({
    filtered_intervention()
  })
  
  output$outcome_table <- DT::renderDataTable({
    filtered_outcome()
  })
  
  output$integrity_table <- DT::renderDataTable({
    shiny_integrity
  })
  
  # Download filtered dataset
  output$download <- downloadHandler(
    filename = function() {
      paste0("data_scoping_review_Batinovic_et_al", ".tsv")
    },
    content = function(file) {
      vroom::vroom_write(filtered_complete(), file)
    }
  )
  
###############################################################
#####################     world map    ########################
###############################################################
  # countries
  countries_reactive <- reactive({
    filtered_complete() %>%                 
      select(country_clean) %>%
      filter(!is.na(country_clean)) %>% 
      tidyr::separate_longer_delim(country_clean, delim = ",") %>% 
      mutate(country_clean = trimws(country_clean)) %>% 
      group_by(country_clean) %>% 
      count(name = "n") %>% 
      ungroup()
  })
  
  world_sf <- reactive({
    rnaturalearth::ne_countries(scale = "small", returnclass = "sf") %>% 
      dplyr::mutate(region = admin)              # for clearer naming
  })
  
  world_joined <- reactive({
    w <- world_sf()
    cts <- countries_reactive()
    
    w %>% 
      left_join(cts, by = c("region" = "country_clean")) %>% 
      mutate(
        color = dplyr::case_when(
          is.na(n)            ~ "gray",
          n < 10              ~ "#ffe5e5",
          n >= 10 & n <= 20   ~ "#f28c8c",
          n >= 21 & n <= 50   ~ "#800e13",
          n >= 51 & n <= 100  ~ "#380404",
          n > 500             ~ "#A94064"
        )
      )
  })
  
  output$world_map <- leaflet::renderLeaflet({
    dat <- world_joined()
    
    pal <- colorFactor(
      levels = c("#ffe5e5", "#f28c8c", "#800e13", "#380404", "#A94064", "gray"),
      palette = c("#ffe5e5", "#f28c8c", "#800e13", "#380404", "#A94064", "gray")
    )
    
    leaflet(dat) %>%
      addTiles() %>%
      addPolygons(
        fillColor   = ~pal(color),
        color       = "white",
        weight      = 0.5,
        fillOpacity = 0.8,
        label = ~paste0(
          "<b>", region, "</b><br>",
          "Studies: ", ifelse(is.na(n), 0, n)
        ) %>% lapply(htmltools::HTML),
        highlightOptions = highlightOptions(weight = 2, color = "#666", bringToFront = TRUE)
      ) %>%
      addLegend(
        "bottomleft",
        pal     = pal,
        values  = ~color,
        title   = "N Studies",
        labFormat = function(type, cuts, p) {
          # custom labels matching your bins
          c("<10","10–20","21–50","51–100","over 500","none")
        }
      )
  })
  
  output$intervention_years <- renderPlotly({
    
    p <- i_data_plot %>%
      group_by(published_year, intervention_theme) %>%
      count() %>%
      ggplot(aes(
        x = published_year,
        y = n,
        group = intervention_theme,
        fill = intervention_theme,
        size = n,
        text = paste("Intervention:", intervention_theme,
                     "<br>Year:", published_year,
                     "<br>N:", n)
      )) +
      geom_point(position = position_dodge(width = 0.5), shape = 21) +
      scale_fill_brewer(palette = "Pastel2") +
      theme_minimal() +
      labs(x = "Year of Publication") +
      theme(
        legend.position = "none",
        panel.background = element_rect(fill = "transparent", color = NA),
        plot.background  = element_rect(fill = "transparent", color = NA)
      )
    
    ggplotly(p, tooltip = "text") %>%
      layout(
        paper_bgcolor = "rgba(0,0,0,0)",   # fully transparent
        plot_bgcolor  = "rgba(0,0,0,0)"
      )
  })
  
  
}

# Run the application
shinyApp(ui = ui, server = server)
