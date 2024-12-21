### pub data ###
pub_data <- read_delim("./1_data/review_251543_included_csv_20241113040533.csv") %>% 
  clean_names()

pub_data_clean <- pub_data %>% select(covidence_number, published_year)

#### visualization ####
#pub_years <- 
pub_data_clean %>% 
  count(published_year) %>% 
  ggplot(aes(x = published_year, y = n)) +
  geom_col(fill = "#003049") +
  labs(x = "Publication Year",
        y = "Number of Reports") +
  theme_minimal() 

ggsave(filename = file.path("./2_figures/figs","pub_year.png"),
       height = 1000,
       width = 1500,
       units = "px")