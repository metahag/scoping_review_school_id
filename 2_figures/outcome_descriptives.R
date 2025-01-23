showtext_auto()
showtext_opts(dpi = 300)
#font_add("FontAwesome", regular = "../figures/Font Awesome 5 Free-Solid-900.otf")
#########################################################################
#################### standardized instruments plot #########################
#########################################################################
design_clean <- clean_shiny %>%
  # Select relevant columns
  select(covidence_study, design_category) %>%
  # group by study
  group_by(covidence_study) %>% 
  # remove NA values
  filter(!is.na(design_category)) %>% 
  # remove duplicate values within study
  distinct() %>% 
  # Relabel design categories and create SCD and group category
  mutate(
    design_category = recode(design_category,
                          `Mixed (both between and within)` = "Pre-Post Comparison Design",
                          `Randomized Control Trial` = "Pre-Post Comparison Design"),
    design_type = case_when(
      design_category %in% c("Other Single-case Design",
                          "Changing criterion design",
                          "A-B Design (Pre-Post Design)",
                          "A-B-A (or A-B-A-B) Design (Reversal Design)",
                          "Alternating Treatments Design",
                          "Combined Single-case Designs",
                          "Multiple Baseline Design",
                          "Multiple Probe Design") ~ "Single-Case Design",
      design_category %in% c("Mixed (both between and within)",
                          "Within participants",
                          "Randomized Control Trial",
                          "Longitudinal Design",
                          "Mixed Methods Design",
                          "Between participants",
                          "Quasi-experimental Design",
                          "Pre-Post Comparison Design",
                          "Other Group Design") ~ "Group Design",
      design_category == "Pilot" ~ "Other",
      TRUE ~ design_category
    )
  ) 


instrument_clean <- clean_shiny %>% 
# Select relevant columns
select(covidence_study, instrument_standardization) %>%
  group_by(covidence_study) %>% 
  filter(!is.na(instrument_standardization)) %>% 
  distinct()

# join the clean design per study with unique instruments per study
instruments_design <- full_join(instrument_clean, design_clean, 
                                by = "covidence_study",
                                relationship = "many-to-many")


# Data preparation: Count the number of "Yes" (standardized) and "No" (created for the study) per design category
summary_data <- instruments_design  %>%
  filter(!is.na(design_category)) %>% 
  filter(!is.na(instrument_standardization)) %>%  # Remove NA values
  group_by(design_type, design_category, instrument_standardization) %>%
  summarise(count = n(), .groups = 'drop') %>%
  pivot_wider(names_from = instrument_standardization, values_from = count, values_fill = 0) %>%
  mutate(
    total = Yes + No,                           # Calculate total responses per group
    Yes_proportion = (Yes / total)*100,               # Calculate proportion of "Yes"
    No_proportion = (No / total)*100                  # Calculate proportion of "No"
  ) 

summary_data <- summary_data %>% 
  filter(total >= 20) # filter out less common study designs

# Filter data for each design_type
group_design_data <- summary_data %>%
  filter(design_type == "Group Design") %>% 
  pivot_longer(
    cols = c(Yes, No, Yes_proportion, No_proportion),
    names_to = "response_type",
    values_to = "value"
  ) %>%
  mutate(
    response = if_else(str_detect(response_type, "Yes"), "Yes", "No"),
    measure = if_else(str_detect(response_type, "proportion"), "proportion", "count")
  ) %>%
  select(-response_type) %>% # Remove the old response_type column
  pivot_wider(
    names_from = measure,
    values_from = value
  )

single_case_design_data <- summary_data %>%
  filter(design_type == "Single-Case Design") %>% 
  pivot_longer(
    cols = c(Yes, No, Yes_proportion, No_proportion),
    names_to = "response_type",
    values_to = "value"
  ) %>%
  mutate(
    response = if_else(str_detect(response_type, "Yes"), "Yes", "No"),
    measure = if_else(str_detect(response_type, "proportion"), "proportion", "count")
  ) %>%
  select(-response_type) %>% # Remove the old response_type column
  pivot_wider(
    names_from = measure,
    values_from = value
  )
################################################
############ instruments plot ####################
group_plot <- ggplot(group_design_data, aes(x = paste0(design_category, " (n = ", total, ")"), 
                              y = as.numeric(proportion),
                              fill = response, 
                              pattern = response)) +
  geom_col_pattern(position = position_dodge(width = 0.65),
                   width = 0.5,
                   alpha = 0.5) +
  scale_fill_manual(values = c("Yes" = "#AD2831", "No" = "#AD2831")) +
  scale_pattern_manual(values = c("Yes" = "stripe", "No" = "circle")) +
  coord_flip() +
  scale_y_continuous(limits = c(0, 100), expand = c(0, 0)) +
  labs(title = "% of (Non)standardized instruments by Design Category",
       fill = "Response",
       pattern = "Response") +
  theme_minimal() +
  theme(legend.position = "right",
        axis.title.x = element_blank(),
        axis.title.y = element_blank())


single_plot <- ggplot(single_case_design_data, aes(x = paste0(design_category, " (n = ", total, ")"), 
                                             y = as.numeric(proportion),
                                             fill = response, 
                                             pattern = response)) +
  geom_col_pattern(position = position_dodge(width = 0.65),
                   width = 0.5,
                   alpha = 0.5) +
  scale_fill_manual(values = c("Yes" = "#003049", "No" = "#003049")) +
  scale_pattern_manual(values = c("Yes" = "stripe", "No" = "circle")) +
  coord_flip() +
  labs(title = "",
       fill = "Response",
       pattern = "Response") +
  theme_minimal() +
  theme(legend.position = "right",
        axis.title.x = element_blank(),
        axis.title.y = element_blank())


# Combine the two plots using patchwork
combined_plot <- group_plot / single_plot

# Save the combined plot
ggsave(
  filename = here("2_figures", "figs", "instrument_standardization_combined_plot.png"),
  plot = combined_plot, height = 10, width = 8)



 #########################################################################
 #################### examiner plot #########################
 #########################################################################
 examiner <- 
   clean_shiny %>% select(covidence_study, examiner_clean) %>% 
   filter(!is.na(examiner_clean)) %>% 
   group_by(covidence_study, examiner_clean) %>% 
   unique() %>% 
   ungroup() %>% 
   count(examiner_clean) %>% 
   mutate(total_n = sum(n),
         percent = (n / total_n) * 100)


 
 
 #examiner_plot <- 
 examiner %>% 
   mutate(examiner_clean = as_factor(examiner_clean)) %>% 
   ggplot(aes(x = reorder(examiner_clean,n), y = n)) +
   geom_col(fill = "#003049",
            width = 0.5) +
   coord_flip() +
   theme_minimal() +
   labs(y = "n",
        x = "Examiner")
 
 ggsave(filename = here("2_figures", "figs","examiner.png"))
 
 #########################################################################
 #################### outcomes plot #########################
 #########################################################################
outcome_category <- 
   clean_shiny %>% select(covidence_study, category) %>% 
   filter(!is.na(category)) %>% 
   separate_rows(category, sep = "; ") %>% 
   group_by(covidence_study, category) %>% 
   unique() %>% 
   ungroup() %>% 
   count(category) 
 
 
 #outcome_category_plot <- 
outcome_category %>% 
   mutate(category = as_factor(category)) %>% 
   ggplot(aes(x = reorder(category,n), y = n)) +
   geom_col(fill = "#AD2831",
            alpha = 0.9,
            width = 0.5) +
   coord_flip() +
   theme_minimal() +
   labs(y = "n",
        x = "Outcome Category")
 
 ggsave(filename = here("2_figures", "figs", "outcome_category.png"))
 
