library(shiny)
library(DT)
library(bslib)
library(dplyr)
library(tidyr)
library(vroom)
library(showtext)
library(here)

# Load custom font
font_add("FontAwesome", regular = here("1_data", "Font Awesome 5 Free-Solid-900.otf"))
font_add_google("Space Mono", "space_mono")
showtext_auto()

# Load dataset and set up the data
source(here("1_data","clean_dataset.R"))

# Subset data for each section
shiny_population <- compressed_data %>% 
  select(covidence_id, covidence_study, population_of_interest, country_clean,
         participant_id, sample_size_clean, gender_clean, school_grade, school_level)

shiny_intervention <- compressed_data %>% 
  select(covidence_id, intervention_theme, intervention, operationalization, rationale_clean, 
         instructor_clean, setting_institution_clean, setting_room_clean)

shiny_outcome <- compressed_data %>% 
  select(covidence_id, category, instrument_standardization, outcome, operationalization_of_the_outcome, examiner_clean)

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


# Define UI
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

# Define server
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
}

# Run the application
shinyApp(ui = ui, server = server)
