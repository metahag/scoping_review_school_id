showtext_auto()
showtext_opts(dpi = 250)
########################### sample size #######################################
design_size <- clean_shiny %>%
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


#extract sample size per study
sample_size <- clean_shiny %>% 
  # remove non-ID single participants and typically developing groups
  filter(!(iq_score %in% c("86", "100",  "78","81", 
                         "87", "105",  "99", "104",
                         "198", "96", "90", "110",
                         "98", "102")) &
         !(other_diagnosis %in% c("no ID", "Typically Developing Children",
                                "typically developing comparison"))) %>% 
  # select the ID and the sample size column
  select(covidence_study, sample_size_clean) %>% 
  # group by ID
  group_by(covidence_study) %>%
  # remove NA rows
  filter(!is.na(sample_size_clean)) %>% 
  # add up the sample sizes
  summarise(size = sum(as.numeric(sample_size_clean), na.rm = TRUE))

#summary(sample_size)

#combine study design and sample size to summarize per design the sample size
sample_design <- full_join(design_size, sample_size, by = "covidence_study",
                           relationship = "many-to-many")

mean_sample_design <- sample_design %>% 
  group_by(design_type, design_category) %>% 
  summarise(mean_value = mean(size, na.rm = TRUE),
            sd_value = sd(size, na.rm = TRUE),
            median_value = median(size, na.rm = TRUE),
            n = n(),
            min_value = min(size, na.rm = TRUE),
            max_value = max(size, na.rm = TRUE),
            lower_tf = quantile(size, 0.25, na.rm = TRUE),
            upper_tf =  quantile(size, 0.75, na.rm = TRUE)) %>% 
  filter(!is.na(design_category)) %>% 
  ungroup() %>% 
  mutate(design_category = as_factor(design_category))


# filter out infrequent designs for a clearer plot
mean_sample_design <- mean_sample_design %>% 
  filter(n >= 20)

#########################################################################
#################### sample size by design plot #########################
#########################################################################

# Filter for Group Design
group_design_plot <- mean_sample_design %>%
  filter(design_type == "Group Design") %>%
  ggplot(aes(
    y = reorder(paste0(design_category, " (n = ", n, ")"), median_value),
    x = median_value
  )) +
  geom_boxplot(
    aes(
      xmiddle = median_value,
      xmin = min_value,
      xmax = max_value,
      xlower = lower_tf,
      xupper = upper_tf,
      group = paste(design_category, design_type)
    ), 
    stat = "identity",
    orientation = "y",
    color = "#800E13",
    fill = "#ffe5e5",
    width = 0.4
  ) +
  coord_cartesian(xlim = c(0, 70)) +
  geom_text(
    aes(label = round(median_value, digits = 0)), 
    nudge_x = 0,
    nudge_y = -0.5,
    size = 3,
    color = "#38040E"
  ) + 
  geom_text(
    aes(label = paste0("(max = ", round(max_value, digits = 0), ")"),
        x = 68), 
    nudge_x = 0,
    nudge_y = 0.3,
    size = 2,
    color = "#38040E"
  ) +
  geom_text(
    aes(label = paste0("(IQR 1 = ", round(lower_tf, digits = 0), ")"),
        x = lower_tf), 
    nudge_x = -1,
    nudge_y = 0.3,
    size = 2,
    color = "#38040E"
  ) +
  geom_text(
    aes(label = paste0("(IQR 3 = ", round(upper_tf, digits = 0), ")"),
        x = upper_tf), 
    nudge_x = 1,
    nudge_y = -0.3,
    size = 2,
    color = "#38040E"
  ) +
  scale_y_discrete(position = "right") +
  theme_minimal() +
  labs(
    x = "Median Sample Size", 
    y = "Study Design (N of studies)",
    title = "Group Design"
  )

# Adjusted Single-Case Design Plot
single_case_plot <- mean_sample_design %>%
  filter(design_type == "Single-Case Design") %>%
  ggplot(aes(
    y = reorder(paste0(design_category, " (n = ", n, ")"), median_value),
    x = median_value
  )) +
  geom_boxplot(
    aes(
      xmiddle = median_value,
      xmin = min_value,
      xmax = max_value,
      xlower = lower_tf,
      xupper = upper_tf,
      group = paste(design_category, design_type)
    ), 
    stat = "identity",
    orientation = "y",
    color = "#800E13",
    fill = "#ffe5e5",
    width = 0.4
  ) +
  # Reduce x-axis maximum to make boxplots larger
  coord_cartesian(xlim = c(0, 30)) +
  geom_text(
    aes(label = round(median_value, digits = 0)), 
    nudge_x = 0,
    nudge_y = 0.5,
    size = 3,
    color = "#38040E"
  ) + 
  geom_text(
    aes(label = paste0("(max = ", round(max_value, digits = 0), ")"),
        x = 28),
    nudge_x = 0,
    nudge_y = 0.3,
    size = 2,
    color = "#38040E"
  ) +
  geom_text(
    aes(label = paste0("(IQR 1 = ", round(lower_tf, digits = 0), ")"),
        x = lower_tf), 
    nudge_x = -1.5,
    nudge_y = -0.3,
    size = 2,
    color = "#38040E"
  ) +
  geom_text(
    aes(label = paste0("(IQR 3 = ", round(upper_tf, digits = 0), ")"),
        x = upper_tf), 
    nudge_x = 1.5,
    nudge_y = -0.3,
    size = 2,
    color = "#38040E"
  ) +
  scale_y_discrete(
    position = "right",
    expand = expansion(mult = c(0.3, 0.3))  
  ) +
  theme_minimal() +
  theme(
    # Increase vertical spacing between y-axis labels
    axis.text.y = element_text(margin = margin(t = 5, b = 5)),
    # Adjust plot margins
    plot.margin = margin(t = 10, r = 10, b = 20, l = 10)
  ) +
  labs(
    x = "Median Sample Size", 
    y = "Study Design (N of studies)",
    title = "Single-Case Design"
  )


# Combine with patchwork
combined_plot <- group_design_plot +
  single_case_plot +
  plot_layout(ncol = 1, heights = c(1, 1.5)) +
  plot_annotation(
    theme = theme(
      plot.margin = margin(t = 10, r = 20, b = 40, l = 20)  # Global margins
    )
  )


# Display the combined plot
print(combined_plot)

ggsave(filename = here("2_figures","figs","sample_size_plot.png"),
       height = 2000,
       width = 2500,
       units = "px")

#########################################################################
#################### other diagnoses plot #########################
#########################################################################
o_diag <- 
  clean_shiny %>% select(covidence_study, other_diagnoses_clean) %>% 
  filter(!is.na(other_diagnoses_clean)) %>% 
  group_by(covidence_study, other_diagnoses_clean) %>% 
  unique() %>% 
  ungroup() %>% 
  count(other_diagnoses_clean) 


#other_diagnosis_plot <- 
o_diag %>% 
  mutate(other_diagnoses_clean = as_factor(other_diagnoses_clean)) %>% 
  ggplot(aes(x = reorder(other_diagnoses_clean, n), y = n)) +
  geom_col(fill = "#640D14", width = 0.5) +
  coord_flip() +
  theme_minimal() +
  labs(y = "n",
       x = "Other Diagnoses (ICD-11 Categories)")

ggsave(filename = here("2_figures","figs","other_diagnosis_plot.png"),
       height = 1000,
       width = 2200,
       units = "px")

#########################################################################
#################### idd level plot #########################
#########################################################################
## idd levels overall
idd_lev <- 
  clean_shiny %>% select(covidence_study, idd_level) %>% 
  filter(!is.na(idd_level)) %>% 
  group_by(covidence_study,idd_level) %>% 
  unique() %>% 
  ungroup() %>% 
  count(idd_level) 


idd_level_plot <- 
idd_lev %>% 
  ggplot(aes(x = idd_level, y = n)) +
  geom_col(fill = "#003049",
           width = 0.5) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1)) +
  labs(y = "n",
       x = "Level of ID overall")

ggsave(filename = here("2_figures", "figs","idd_levels_plot.png"))

## idd levels per study design

idd_lev_s <- 
  clean_shiny %>% select(covidence_study, idd_level) %>% 
  filter(!is.na(idd_level)) %>% 
  group_by(covidence_study)
design_t <- design_size %>% select(covidence_study, design_type)

idd_design <- full_join(design_size, idd_lev_s, by = "covidence_study",
                        relationship = "many-to-many")

idd_design <- idd_design %>% 
  select(covidence_study, design_type, idd_level) %>% 
  group_by(covidence_study, design_type, idd_level) %>% 
  count() %>% 
  ungroup() %>% 
  group_by(design_type, idd_level) %>% 
  count() %>% 
  ungroup() %>% 
  filter(!is.na(idd_level),
         !is.na(design_type),
         design_type != "Other") # remove again for consistency with other plots

#### descriptives for the levels per design ####
# Calculate total n for each design type
data_with_totals <- idd_design %>%
  group_by(design_type) %>%
  filter(idd_level != "not reported") %>% 
  mutate(total_n = sum(n)) %>%
  ungroup()

# Calculate the percentage for the specific idd_levels
specific_levels <- data_with_totals %>%
  filter((design_type == "Group Design" & idd_level == "mild") |
           (design_type == "Single-Case Design" & idd_level == "moderate")) %>%
  mutate(percent = (n / total_n) * 100) %>%
  select(design_type, idd_level, n, total_n, percent)

specific_levels

######## plots ############

idd_design_plot <- 
idd_design %>% 
  ggplot(aes(x = idd_level, y = n, fill = design_type)) +
  geom_col(width = 0.5) +
  facet_wrap(vars(design_type), nrow = 3, 
             scales='free', strip.position = "top") +
  scale_fill_manual(values = c("#640D14","#AD2831")) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1),
        legend.position = "none",
        panel.spacing = unit(0.01, "lines"), # Reduces space between facets
        strip.text = element_text(size = 12), # Adjust size of facet labels
        plot.margin = margin(5, 1, 1, 5) # Adjust overall plot margins
        ) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.01))) +
  labs(y = "n",
       x = "Level of ID per Study Design",
       fill = "Study Design Type") +
  coord_cartesian(clip = "off") # Adjust zoom to make bars fill the plot better

combined_severity_plot <- 
  idd_level_plot | idd_design_plot

ggsave(filename = here("2_figures", "figs","combined_idd_design_plot.png"))

#########################################################################
#################### diagnostic tools plot #########################
#########################################################################
diagnostic_tools <- clean_shiny %>% 
  select(covidence_study, iq_test_clean, other_measurement_clean) %>% 
  mutate(diagnostic_tools = paste0(iq_test_clean, ", ", other_measurement_clean)) %>% 
  filter(!is.na(diagnostic_tools)) %>% 
  separate_rows(diagnostic_tools, sep = ",") %>% 
  mutate(diagnostic_tools = str_trim(diagnostic_tools, side = "left")) %>% 
  group_by(covidence_study,diagnostic_tools) %>% 
  unique() %>% 
  ungroup() %>% 
  count(diagnostic_tools) 

# Bin into "Other" category for less frequent tools
top_10_tools <- diagnostic_tools %>% 
  arrange(desc(n)) %>% 
  slice_head(n = 10) %>% 
  pull(diagnostic_tools)

diagnostic_tools <- diagnostic_tools %>%
  mutate(diagnostic_tools = ifelse(diagnostic_tools %in% top_10_tools, diagnostic_tools, "Other")) %>% 
  group_by(diagnostic_tools) %>% 
  summarise(n = sum(n), .groups = "drop") %>% 
  arrange(desc(n))

##### relabel tools for the plot ####
# Define relabeled tool names
tool_labels <- c(
  "WISC" = "Wechsler Intelligence Scale for Children",
  "VABS" = "Vineland Adaptive Behavior Scale",
  "SB" = "Stanford-Binet Intelligence Scale",
  "ABAS" = "Adaptive Behavior Assessment Scale",
  "KBIT" = "Kaufman Brief Intelligence Test",
  "DAS" = "Differential Ability Scale",
  "Leiter" = "Leiter International Performance Scale",
  "WPPSI" = "Wechsler Preschool and Primary Scale of Intelligence",
  "WJ - TA" = "Woodcock-Johnson Tests of Achievement"
)

# Relabel the tools
diagnostic_tools <- diagnostic_tools %>%
  mutate(diagnostic_tools = recode(diagnostic_tools, !!!tool_labels))

############ plot
#tools_plot <- 
diagnostic_tools %>% 
  filter(diagnostic_tools != "NA") %>% 
  mutate(diagnostic_tools = as_factor(diagnostic_tools)) %>% 
  ggplot(aes(x = reorder(diagnostic_tools, n), y = n)) +
  geom_col(fill = "#A94064", width = 0.5) +
  coord_flip() +
  theme_minimal() +
  labs(y = "n",
       x = "Most Commonly Reported Diagnostic Tools")

ggsave(filename = here("2_figures","figs","diagnostic_tools_plot.png"),
       height = 1000,
       width = 2200,
       units = "px")


################ overall number of participants ###############
#extract sample size per study
sample_size_overall <- clean_shiny %>% 
  # Remove non-ID single participants and typically developing groups
  filter(!(iq_score %in% c("86", "100", "78", "81", 
                           "87", "105", "99", "104",
                           "198", "96", "90", "110",
                           "98", "102")) &
           !(other_diagnosis %in% c("no ID", "Typically Developing Children",
                                    "typically developing comparison"))) %>% 
  # Summarize the total sample size
  summarise(total_sample_size = sum(sample_size_clean, na.rm = TRUE)) %>% 
  pull(total_sample_size)

####### population of interest ##############
pop_int <- clean_shiny %>% 
  select(covidence_study, population_of_interest) %>% 
  group_by(covidence_study) %>% 
  distinct() %>%
  drop_na() %>% 
  ungroup() %>% 
  count(population_of_interest)
