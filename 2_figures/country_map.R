#### setup

countries <- as.data.frame(clean_shiny$country_clean)
names(countries) <- "country_clean"
countries <- countries %>%
  filter(!is.na(country_clean)) %>% 
  separate_longer_delim(country_clean, delim = ",") %>% 
  group_by(country_clean) %>% 
  count()

# Get world map new_data
world_map <- map_data("world")

# Merge with your new_data
merged_new_data <- merge(world_map, countries, 
                         by.x = "region", by.y = "country_clean", 
                         all.x = TRUE) %>% 
  mutate(color = case_when(
    n < 10 ~ "#ffe5e5",
    n >= 10 & n <= 20 ~ "#f28c8c",
    n >= 21 & n <= 50 ~ "#800e13",
    n >= 51 & n <= 100 ~ "#380404",
    n > 500 ~ "#A94064",
    TRUE ~ "gray"
  ),
  color = as_factor(color)
  )

text <- merged_new_data %>% 
  select(-subregion) %>% 
  filter(n >= 1)

#map_countries <- 
merged_new_data %>% 
  ggplot( aes(x = long, y = lat)) +
  geom_map(aes(map_id = region, fill = color), map = world_map) +
  scale_fill_identity(
    guide = "legend",
    labels = c("<10","10-20","21-50","51-100","over 500"),
    breaks = c("#ffe5e5", "#f28c8c", "#800e13", "#380404", "#A94064"),
    name = "N Studies",
    na.value = "gray"
  ) +
  theme_minimal() +
  geom_text(data = text %>% group_by(region) %>% summarise_all(mean, na.rm = TRUE),
            aes(label = region), size = 1, fontface = 1, color = "#003049") +
  theme(axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank(),
        legend.key.size = unit(0.4, 'cm'),
        legend.position = c(.1, .3),
        legend.title = element_text(size = 8),
        legend.text = element_text(size = 7)) 

ggsave(
  filename = here("2_figures", "figs", "map_countries.png"),
  width = 2000,
  height = 1500,
  units = "px"
)


################ table most common countries ####################
countries %>% arrange(desc(n)) %>% 
  filter(!is.na(country_clean), 
         n > 10) %>% 
  kableExtra::kable()

