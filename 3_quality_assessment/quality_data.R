########### visualization ###########
#ethics_year_plot <- 
ethics_year %>% group_by(published_year, ethical_approval) %>% 
  count(ethical_approval) %>% 
  ggplot(aes(x = published_year, y = n, fill = ethical_approval)) +
  geom_col(position = position_dodge2(width = 1, preserve = "single")) +
  scale_fill_manual("Obtained ethical approval",
                    values = c("#AD2831", "#003049"),
                    labels = c("No", "Yes")) +
  labs(x = "Year of publication",
       y = "Number of ethical approvals") +
  theme_minimal() 

ggsave(
  filename = here("2_figures", "figs", "ethics_year.png"),
  width = 2000,
  height = 1500,
  units = "px"
)

  

########## consent ##########
#consent_year_plot <- 
ethics_year %>% group_by(published_year, consent) %>% 
  count(consent) %>% 
  ggplot(aes(x = published_year, y = n, fill = consent)) +
  geom_col(position = position_dodge2(width = 1, preserve = "single")) +
  scale_fill_manual("Obtained consent",
                    values = c("#AD2831", "#003049"),
                    labels = c("No", "Yes")) +
  labs(x = "Year of publication",
       y = "Number of reported consents") +
  theme_minimal() 

ggsave(
  filename = here("2_figures", "figs", "consent_year.png"),
  width = 2000,
  height = 1500,
  units = "px"
)

  
############# open science practices ##############
######. data
ethics_year %>% group_by(published_year, data_adequate) %>% 
  count(data_adequate) %>% 
  ggplot(aes(x = published_year, y = n, fill = data_adequate)) +
  geom_col(position = position_dodge2(width = 1, preserve = "single")) +
  scale_fill_manual("Data shared according to Open Science Principles",
                    values = c("#AD2831", "#003049"),
                    labels = c("No", "Yes")) +
  labs(x = "Year of publication",
       y = "Shared data") +
  theme_minimal() 

ggsave(
  filename = here("2_figures", "figs", "opendata_year.png"),
  width = 2000,
  height = 1500,
  units = "px"
)


###### materials
#materials <- 
  ethics_year %>% group_by(published_year, materials_adequate) %>% 
  count(materials_adequate) %>% 
  ggplot(aes(x = published_year, y = n, fill = materials_adequate)) +
  geom_col(position = position_dodge2(width = 1, preserve = "single")) +
  scale_fill_manual("Shared materials",
                    values = c("#AD2831", "#003049", "#ffe5e5"),
                    labels = c("No", "Yes, inadequately", "Yes")) +
  labs(x = "Year of publication",
       y = "Number of studies") +
  theme_minimal() 

  ggsave(
    filename = here("2_figures", "figs", "openmaterials_year.png"),
    width = 2000,
    height = 1500,
    units = "px"
  )
  
  