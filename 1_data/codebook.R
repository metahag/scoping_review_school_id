library(codebook)
### metadata about the dataset
metadata(compressed_data)$name <- "Scoping Review of School-based interventions for students with ID: Extraction Dataset"
metadata(compressed_data)$description <- "Dataset containing extractions of studies included in the scoping review"
metadata(compressed_data)$identifier <- "doi:10.17605/OSF.IO/48D6C"
metadata(compressed_data)$datePublished <- "2025-01-01"
metadata(compressed_data)$creator <- list(
  "@type" = "Person",
  givenName = "Lucija", familyName = "Batinovic",
  email = "luce.batinovic@gmail.com",
  affiliation = list("@type" = "Organization",
                     name = "Linkoping University, Sweden"))
metadata(compressed_data)$citation <- "Batinovic (2016). Scoping Review of School-based interventions for students with ID: Extraction Dataset."
metadata(compressed_data)$url <-
  "https://doi.org/10.17605/OSF.IO/48D6C"
metadata(compressed_data)$temporalCoverage <- "2023"
metadata(compressed_data)$keywords <- c("Intellectual Disability", "Education", "Interventions")
metadata(compressed_data)

#### attributes of variables in the dataset
### general information about the study
attr(compressed_data$covidence_study, "label") <- "A unique identifier for each study combining covidence exported ID and study name."
attr(compressed_data$covidence_id, "label") <- "A unique identifier for each study exported from Covidence"
attr(compressed_data$doi, "label") <- "Digital Object Identifier (DOI) providing a unique reference to the study."
attr(compressed_data$title, "label") <- "The title of the study or article."
attr(compressed_data$journal_publisher, "label") <- "The name of the journal or publisher where the study was published."
attr(compressed_data$country, "label") <- "The country where the study was conducted."
attr(compressed_data$country_clean, "label") <- "Cleaned names of the countries reported."

##### demographic information
attr(compressed_data$population_of_interest, "label") <- "The population or group of interest in the study, either intellectual disability or broader/other."
attr(compressed_data$participant_id, "label") <- "Unique identifier for participants in the study combining covidence exported ID and participant name."
attr(compressed_data$participants, "label") <- "Name of participants or group in the study."
attr(compressed_data$gender_sex, "label") <- "Gender of the participants, or number of males in a group."
attr(compressed_data$gender_clean, "label") <- "Cleaned gender data to state either m or of if individuals extracted, or integer of males in group."
attr(compressed_data$sample_size, "label") <- "The total sample size of the study."
attr(compressed_data$sample_size_clean, "label") <- "Cleaned sample size data to provide only integers."
attr(compressed_data$age, "label") <- "Age of participants."
attr(compressed_data$age_mean, "label") <- "Mean age of participants."
attr(compressed_data$age_sd, "label") <- "Standard deviation of ages."
attr(compressed_data$age_min, "label") <- "Minimum age of participants."
attr(compressed_data$school_grade, "label") <- "School grade of participants."
attr(compressed_data$school_level, "label") <- "School level of participants (e.g., primary, secondary, or both)."

### diagnosis information
attr(compressed_data$diagnosis, "label") <- "The name for intellectual disability reported for the participants."
attr(compressed_data$other_diagnosis, "label") <- "Other names not specified in the predefined values for diagnosis column."
attr(compressed_data$other_diagnoses, "label") <- "Additional diagnoses reported in the study."
attr(compressed_data$other_diagnoses_clean, "label") <- "Additional diagnoses categorized according to ICD-11."
attr(compressed_data$idd_level, "label") <- "Intellectual and developmental disability (IDD) level of participants."
attr(compressed_data$other_idd_level, "label") <- "Other IDD levels not available in predefined values."
attr(compressed_data$idd_diagnosis_reference, "label") <- "Reported Reference used for diagnosing IDD."
attr(compressed_data$other_diagnosis_reference, "label") <- "Other references not available in predefined values."
attr(compressed_data$iq_score, "label") <- "IQ score of participants."
attr(compressed_data$iq_mean, "label") <- "Mean IQ score of the sample."
attr(compressed_data$iq_sd, "label") <- "Standard deviation of IQ scores."
attr(compressed_data$iq_max, "label") <- "Maximum IQ score observed in the study."
attr(compressed_data$iq_test, "label") <- "IQ test(s) used in the study."
attr(compressed_data$iq_test_clean, "label") <- "Categorized IQ tests."
attr(compressed_data$other_measurement, "label") <- "Other diagnostic measurements reported in the study."
attr(compressed_data$other_measurement_clean, "label") <- "Categorized other diagnostic measurements."
attr(compressed_data$score, "label") <- "Other measurement scores reported"

#### intervention information
attr(compressed_data$intervention_id, "label") <- "Unique identifier for the intervention."
attr(compressed_data$intervention, "label") <- "Name and/or short Description of the intervention."
attr(compressed_data$operationalization, "label") <- "How the intervention was operationalized, or description of procedured where available."
attr(compressed_data$rationale, "label") <- "The theoretical framework that was the basis of the intervention."
attr(compressed_data$intervention_theme, "label") <- "Categories the intervention belongs to."
attr(compressed_data$rationale_clean, "label") <- "Categorized intervention rationale."
attr(compressed_data$study_design, "label") <- "Specific design used in the study."
attr(compressed_data$other_design, "label") <- "Other designs not specified in predefined values."
attr(compressed_data$design_category, "label") <- "Clean study design categories"
attr(compressed_data$instructor, "label") <- "Person(s) who implemented the intervention."
attr(compressed_data$instructor_clean, "label") <- "Categorized instructor information."
attr(compressed_data$setting_institution, "label") <- "Institutional setting of the study."
attr(compressed_data$setting_room, "label") <- "Specific room or environment of the intervention."
attr(compressed_data$duration, "label") <- "Duration of the entire intervention."
attr(compressed_data$frequency, "label") <- "Frequency of the intervention sessions, number of sessions or how often they happened"
attr(compressed_data$intensity_mean_mode, "label") <- "Mean or mode intensity of the intervention, in minutes"
attr(compressed_data$intensity_min, "label") <- "Minimum intensity of the intervention, in minutes"
attr(compressed_data$intensity_max, "label") <- "Maximum intensity of the intervention, in minutes"
attr(compressed_data$comparison, "label") <- "Details about the comparison group or control."
attr(compressed_data$follow_up_period, "label") <- "Period of follow-up post-intervention."
attr(compressed_data$setting_institution_clean, "label") <- "Categorized institutional settings."
attr(compressed_data$setting_room_clean, "label") <- "Categorized room settings."
attr(compressed_data$duration_clean, "label") <- "Categorized duration of interventions."
attr(compressed_data$intensity_mean_clean, "label") <- "Categorized mean intensity of interventions."
attr(compressed_data$latest_followup, "label") <- "The latest follow-up time reported."
attr(compressed_data$followup_number, "label") <- "Number of follow-up periods reported."

#### Outcome information
attr(compressed_data$outcome_id, "label") <- "Unique identifier for the outcome."
attr(compressed_data$outcome, "label") <- "Description/Name of the outcome."
attr(compressed_data$operationalization_of_the_outcome, "label") <- "How the outcome was operationalized."
attr(compressed_data$category, "label") <- "Category of the outcome (e.g., academic, cognitive)."
attr(compressed_data$measurement_instrument, "label") <- "Instrument used to measure outcomes."
attr(compressed_data$instrument_standardization, "label") <- "Whether the instrument was standardized"
attr(compressed_data$examiner, "label") <- "Persons(s) that assessed the outcomes."
attr(compressed_data$examiner_clean, "label") <- "Categorized examiners."


#codebook::codebook(compressed_data)

