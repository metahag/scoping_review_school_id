showtext_auto()
showtext_opts(dpi = 250)

library(treemapify)

sensitivity_data <- clean_shiny %>% 
  select(covidence_study, diagnosis, category, design_category, intervention_theme)


category_sens <- sensitivity_data %>% group_by(covidence_study) %>% select(diagnosis, category) %>% 
  unique() %>% ungroup() %>% plyr::count(vars = c("diagnosis", "category")) %>% drop_na()

theme_sens <- sensitivity_data %>% group_by(covidence_study) %>% select(diagnosis, intervention_theme) %>% 
  unique() %>% ungroup() %>% plyr::count(vars = c("diagnosis", "intervention_theme")) %>% drop_na()

design_sens <- sensitivity_data %>% group_by(covidence_study) %>% select(diagnosis, design_category) %>% 
  unique() %>% ungroup() %>% plyr::count(vars = c("diagnosis", "design_category")) %>% drop_na()

######### PLOTS ############
ggplot(category_sens, aes(area = freq, fill = freq, label = diagnosis, subgroup = category))  +
  geom_treemap() +
  geom_treemap_subgroup_border(colour = "white", size = 5) +
  geom_treemap_subgroup_text(place = "centre", grow = FALSE, size = 50,
                             alpha = 0.25, colour = "black") +
  geom_treemap_text(colour = "lightgray", place = "centre",
                    size = 10, grow = FALSE, fontface = "italic") +
  theme(legend.position = "none")


ggsave(
  filename = here("2_figures", "figs", "sensitivity_outcome.png"),
  height = 1000,
  width = 2200,
  units = "px"
)

ggplot(theme_sens, aes(area = freq, fill = diagnosis, label = diagnosis, subgroup = intervention_theme))  +
  geom_treemap() +
  geom_treemap_subgroup_border(colour = "white", size = 5) +
  geom_treemap_subgroup_text(place = "centre", grow = FALSE, size = 50,
                             alpha = 0.25, colour = "black") +
  geom_treemap_text(colour = "white", place = "centre",
                    size = 10, grow = FALSE, fontface = "italic") +
  theme(legend.position = "none") +
  scale_fill_brewer(palette = "Reds")

ggsave(
  filename = here("2_figures", "figs", "sensitivity_intervention.png"),
  height = 1000,
  width = 2200,
  units = "px"
)

ggplot(design_sens, aes(area = freq, fill = diagnosis, label = diagnosis, subgroup = design_category))  +
  geom_treemap() +
  geom_treemap_subgroup_border(colour = "white", size = 5) +
  geom_treemap_subgroup_text(place = "centre", grow = FALSE, size = 50,
                             alpha = 0.25, colour = "black") +
  geom_treemap_text(colour = "white", place = "centre",
                    size = 10, grow = FALSE, fontface = "italic") +
  theme(legend.position = "none") +
  scale_fill_brewer(palette = "Greens")

ggsave(
  filename = here("2_figures", "figs", "sensitivity_design.png"),
  height = 1000,
  width = 2200,
  units = "px"
)