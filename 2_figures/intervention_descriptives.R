################## intervention data ##########################
# rationale
rationale_size <- 
  clean_shiny %>% select(covidence_id, rationale_clean) %>% 
  group_by(covidence_id, rationale_clean) %>% 
  filter(!is.na(rationale_clean)) %>% 
  separate_longer_delim(rationale_clean, delim = "; ") %>% 
  unique() %>% 
  ungroup() %>% 
  count(rationale_clean) 

##### relabel frameworks for the plot ####
rationale_labels <- c(
 "bandura’s theory of self-efficacy" = "Bandura theory of self-efficacy",
 "bloom's taxonomy" = "Bloom taxonomy",
 "gardner’s theory of multiple intelligences" = "Gardner theory of multiple intelligences",
 "mayer's cognitive theory" = "Mayer cognitive theory",
 "piaget's cognitive theory" = "Piaget cognitive theory",
 "skinner behavior theory" = "Skinner behavior theory",
 "vygotsky's cognitive theory" = "Vygotsky cognitive theory",
 "bandura's social learning theory" = "Bandura social learning theory"
)

# Relabel the frameworks
rationale_size <- rationale_size %>%
  mutate(rationale_clean = recode(rationale_clean, !!!rationale_labels))


#########################################################################
#################### rationales plot #########################
#########################################################################

# lollipop plot
lol_rationale <- rationale_size %>% 
  arrange(n) %>% 
  mutate(rationale_clean = as_factor(rationale_clean)) %>% 
  filter(rationale_clean != "unclear theoretical framework") %>% 
  filter(n > 1)

#rationale_plot <- 
lol_rationale %>% 
  mutate(rationale_clean = as_factor(rationale_clean)) %>% 
  ggplot(aes(x = reorder(rationale_clean, n), y = n)) +
  geom_col(fill = "#640D14",
           width = 0.5) +
  coord_flip() +
  theme_minimal() +
  labs(y = "n",
       x = "Most Common Theoretical Frameworks")

ggsave(
  filename = here("2_figures", "figs", "rationale_plot.png"),
  height = 1000,
  width = 2200,
  units = "px"
)



#########################################################################
#################### interventionist plot #########################
#########################################################################
implementer <- 
  clean_shiny %>% select(covidence_study, instructor_clean) %>% 
  filter(!is.na(instructor_clean)) %>% 
  group_by(covidence_study, instructor_clean) %>% 
  unique() %>% 
  ungroup() %>% 
  count(instructor_clean) %>% 
  mutate(total_n = sum(n),
         percent = (n / total_n) * 100)


#implementer_plot <- 
implementer %>% 
  mutate(instructor_clean = as_factor(instructor_clean)) %>% 
  ggplot(aes(x = reorder(instructor_clean,n), y = n)) +
  geom_col(fill = "#003049",
           width = 0.5) +
  coord_flip() +
  theme_minimal() +
  labs(y = "n",
       x = "Instructor")

ggsave(
  filename = here("2_figures", "figs", "implementer_plot.png"),
  height = 1000,
  width = 2200,
  units = "px"
)

#########################################################################
#################### setting - room plot #########################
#########################################################################
setting_r <- 
  clean_shiny %>% select(covidence_study, setting_room_clean) %>% 
  filter(!is.na(setting_room_clean)) %>% 
  group_by(covidence_study, setting_room_clean) %>% 
  unique() %>% 
  ungroup() %>% 
  count(setting_room_clean) %>% 
  mutate(total_n = sum(n),
         percent = (n / total_n) * 100)


#setting_plot <- 
setting_r %>% 
  mutate(setting_room_clean = as_factor(setting_room_clean)) %>% 
  ggplot(aes(x = reorder(setting_room_clean, n), y = n)) +
  geom_col(fill = "#640D14",
           width = 0.5) +
  coord_flip() +
  theme_minimal() +
  labs(y = "n",
       x = "Setting - Room")

ggsave(
  filename = here("2_figures", "figs", "room_plot.png"),
  height = 1000,
  width = 2200,
  units = "px"
)

########################## design #########################
design_percent <- clean_shiny %>%
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
  ) %>%
  # Count the occurrences of each design type
  group_by(design_category) %>% 
  count(design_category, name = "count") %>%
  # Filter out uncommon designs (fewer than 20)
  filter(count >= 20) %>%
  # Calculate percentages of the total
  mutate(percentage = (count / sum(count)) * 100)
