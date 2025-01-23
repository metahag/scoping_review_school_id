# general setup for libraries, covers all subsequent scripts
# Load libraries
library(tidyverse)
library(janitor)
library(here)
library(rnaturalearth)
library(rnaturalearthdata)
library(showtext)
library(networkD3)
library(htmlwidgets)
library(webshot)
library(fontawesome)
library(patchwork)
library(ggpattern)
library(tm)
library(wordcloud2)

# Showtext configurations
showtext_auto()
showtext_opts(dpi = 300)

# Add FontAwesome (adjust path as needed)
font_add("FontAwesome", regular = here("1_data", "Font Awesome 5 Free-Solid-900.otf"))

# Utility function to ensure PhantomJS is installed for webshot (if used)
install_phantomjs <- function() {
  if (!webshot::is_phantomjs_installed()) {
    webshot::install_phantomjs()
  }
}

################################# data import ##################################
# import the shiny dataset
shiny_dataset <- readxl::read_xlsx(here("1_data", "osf_final_dataset_scoping.xlsx"))
shiny_dataset <- shiny_dataset %>% clean_names()

#import clean categories file
categories <- readxl::read_xlsx(here("1_data", "osf_categories_scoping.xlsx"), sheet = 2)

############## recode and create categories ##################################
clean_shiny <- shiny_dataset %>% 
  # participant variables
  mutate(sample_size_clean = ifelse(!is.na(match(sample_size, categories$sample_size_unique_hard_values)), 
                                    categories$sample_size_clean[match(sample_size, categories$sample_size_unique_hard_values)], 
                                    sample_size),
         gender_clean = ifelse(!is.na(match(gender_sex, categories$gender_unique_hard_values)), 
                               categories$gender_clean[match(gender_sex, categories$gender_unique_hard_values)], 
                               gender_sex),
         other_diagnoses = ifelse(!is.na(participants) & is.na(other_diagnoses), 
                                  "No Additional Diagnoses", 
                                  other_diagnoses),
         other_diagnoses_clean = ifelse(!is.na(match(other_diagnoses, categories$other_diagnoses_unique_hard_values)), 
                                        categories$other_diagnoses_clean[match(other_diagnoses, categories$other_diagnoses_unique_hard_values)], 
                                        other_diagnoses),
         iq_test_clean = ifelse(!is.na(match(iq_test, categories$iq_test_unique_hard_values)), 
                                categories$iq_test_clean[match(iq_test, categories$iq_test_unique_hard_values)], 
                                iq_test),
         other_measurement_clean = ifelse(!is.na(match(other_measurement, categories$other_measure_unique_hard_values)), 
                                          categories$other_measurement_clean[match(other_measurement, categories$other_measure_unique_hard_values)], 
                                          other_measurement),
    # intervention variables
      instructor_clean = ifelse(!is.na(match(instructor, categories$instructor_unique_hard_values)), 
                                categories$instructor_clean[match(instructor, categories$instructor_unique_hard_values)], 
                                instructor),
      setting_institution_clean = ifelse(!is.na(match(setting_institution, categories$setting_institution_unique_hard_values)), 
                                         categories$setting_institution_clean[match(setting_institution, categories$setting_institution_unique_hard_values)], 
                                         setting_institution),
      setting_room_clean = ifelse(!is.na(match(setting_room, categories$setting_room_unique_hard_values)), 
                                  categories$setting_room_clean[match(setting_room, categories$setting_room_unique_hard_values)], 
                                  setting_room),
      duration_clean = ifelse(!is.na(match(duration, categories$duration_unique_hard_values)), 
                              categories$duration_clean[match(duration, categories$duration_unique_hard_values)], 
                              duration),
      #frequency_clean = ifelse(!is.na(match(frequency, categories$frequency_unique_hard_values)), 
      #                         categories$frequency_clean[match(frequency, categories$frequency_unique_hard_values)], 
      #                         frequency),
      intensity_mean_clean = ifelse(!is.na(match(intensity_mean_mode, categories$intensity_mean_unique_hard_values)), 
                                    categories$intensity_mean_clean[match(intensity_mean_mode, categories$intensity_mean_unique_hard_values)], 
                                    intensity_mean_mode),
      latest_followup = ifelse(!is.na(match(follow_up_period, categories$followup_unique_hard_values)), 
                               categories$latest_followup[match(follow_up_period, categories$followup_unique_hard_values)], 
                               follow_up_period),
      followup_number = ifelse(!is.na(match(follow_up_period, categories$followup_unique_hard_values)), 
                               categories$followup_number[match(follow_up_period, categories$followup_unique_hard_values)], 
                               follow_up_period),
      intervention_theme = ifelse(!is.na(match(intervention, categories$intervention_unique_hard_values)), 
                                  categories$intervention_theme[match(intervention, categories$intervention_unique_hard_values)], 
                                  intervention),
      rationale_clean = ifelse(!is.na(match(rationale, categories$rationale_unique_hard_values)), 
                               categories$rationale_clean[match(rationale, categories$rationale_unique_hard_values)], 
                               rationale),
    design_category = case_when(
      is.na(design_category) ~ NA_character_, 
      design_category != "Other" ~ design_category,
      other_design %in% categories$study_design_unique_hard_values ~ 
        coalesce(categories$study_design_clean[match(other_design, categories$study_design_unique_hard_values)], "Other"),
      TRUE ~ "Other"), # clean up all designs categorized as Other
  # outcome category variable is recoded to include additional categories fot "other"
  category = ifelse(!is.na(match(outcome, categories$outcome_unique_hard_values)), 
                         categories$category_clean[match(outcome, categories$outcome_unique_hard_values)], 
                         outcome),
  examiner_clean = ifelse(!is.na(match(examiner, categories$examiner_unique_hard_values)), 
                          categories$examiner_clean[match(examiner, categories$examiner_unique_hard_values)], 
                          examiner),
  # study info variables
  country_clean = ifelse(!is.na(match(country, categories$country_unique_hard_values)), 
                         categories$country_clean[match(country, categories$country_unique_hard_values)], 
                         country)
      
  ) %>% 
  mutate(across(where(is.character), ~ na_if(., "NA")),
         sample_size_clean = as.numeric(sample_size_clean))

########## dataset compression ##################################
compressed_data <- clean_shiny %>%
  group_by(covidence_study) %>%
  summarise(across(everything(), ~ paste(unique(na.omit(.x)), collapse = "|")))


#################### misc ##############################

# define a color palette for visualisations
color_pal <- c( "#0466c8", #second contrast
                "#003049", #contrast
                "#ffe5e5",#lightest
                "#AD2831", #auburn
                "#800E13", #falured
                "#640D14", #rosewood
                "#38040E", #black_bean_two
                "#250902"#black_bean_one 
)


## check if all articles have been extracted
article_number <- clean_shiny %>% 
  select(covidence_id) %>% unique() %>% count()

## count how many studies there are (multiple studies per article)
study_number <- clean_shiny %>% 
  select(covidence_study) %>% unique() %>% count()


################################################################## 
################## research intergrity ######################
################################################################## 

################################# data import ##################################
# import quality assessment data
quality_data <- readxl::read_xlsx(here("1_data", "osf_quality_assessment_scoping.xlsx"))
quality_data <- quality_data %>% clean_names()

clean_quality <- quality_data %>% select(covidence_id, ethical_approval, consent, 
                                         data_statement, data_adequate,
                                         open_materials, materials_adequate,
                                         preregistration, prereg_adequate) %>% 
  filter(!is.na(covidence_id)) 

### pub data ###
pub_data <- read_delim(here("1_data","review_251543_included_csv_20241113040533.csv")) %>% 
  clean_names()

pub_data_clean <- pub_data %>% select(covidence_id = covidence_number, 
                                      published_year) 

ethics_year <- left_join(clean_quality, pub_data_clean, by = "covidence_id")

