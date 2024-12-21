###############
outcomes_set <- clean_shiny %>% 
  select(covidence_study, category) %>% 
  separate_rows(category, sep = "\\; ") %>% 
  filter(!is.na(category)) %>% 
  group_by(covidence_study) %>% 
  mutate(category = paste0(category, " outcome")) %>% 
  distinct()

intervention_set <- clean_shiny %>% 
  select(covidence_study, intervention_theme) %>% 
  separate_rows(intervention_theme, sep = "\\, ") %>% 
  filter(!is.na(intervention_theme)) %>% 
  filter(intervention_theme != "Control") %>% 
  mutate(intervention_theme = paste0(str_to_lower(intervention_theme),
                                     " intervention")) %>% 
  group_by(covidence_study) %>% 
  distinct()
  

dendogram_set <- full_join(outcomes_set, intervention_set,
                           by = "covidence_study",
                           relationship = "many-to-many")
  

dendogram_data <- dendogram_set %>%
  group_by(intervention_theme, category) %>%
  filter(!is.na(intervention_theme)) %>% 
  count(name = "connections")


# Create the hierarchical data frame
dendogram <- data.frame(
  level1 = dendogram_data$intervention_theme,
  level2 = dendogram_data$category
)

# Transform it into an edge list
edges_level1_2 <- dendogram %>% 
  select(level1, level2) %>% 
  unique() %>% 
  rename(source = level1, target = level2)

links <- edges_level1_2

# Create a node data frame: it lists every entity involved in the flow
nodes <- data.frame(
  name = unique(c(as.character(links$source), as.character(links$target)))
)

# With networkD3, connection must be provided using id, not using real name like in the links dataframe
links$IDsource <- match(links$source, nodes$name) - 1
links$IDtarget <- match(links$target, nodes$name) - 1

# Create a sample value column for the links (since we don't have counts in links)
links$value <- 1

# Make the Network
p <- sankeyNetwork(Links = links, Nodes = nodes,
                   Source = "IDsource", Target = "IDtarget",
                   Value = "value", NodeID = "name", 
                   sinksRight = FALSE, )

p



# Modify the links creation to include the connection count
links <- dendogram_data %>% 
  select(intervention_theme, category) %>% 
  rename(source = intervention_theme, target = category) %>% 
  left_join(
    dendogram_data %>% 
      group_by(intervention_theme, category) %>% 
      summarise(value = first(connections), .groups = 'drop'),
    by = c("source" = "intervention_theme", "target" = "category")
  )

# Create node data frame
nodes <- data.frame(
  name = unique(c(as.character(links$source), as.character(links$target)))
)

# Add ID columns for networkD3
links$IDsource <- match(links$source, nodes$name) - 1
links$IDtarget <- match(links$target, nodes$name) - 1

colorscale = 'd3.scaleOrdinal(["#0466c8", "#003049", "#ffe5e5", "#AD2831", "#800E13", "#640D14", "#38040E", "#250902"])'
# Create the Sankey Network
p <- sankeyNetwork(Links = links, 
                   Nodes = nodes,
                   Source = "IDsource", 
                   Target = "IDtarget",
                   Value = "value", 
                   NodeID = "name", 
                   sinksRight = FALSE,
                   fontSize = 16,          
                   nodeWidth = 30,        
                   nodePadding = 20,    
                   colourScale = colorscale
)
p

# Save the Sankey widget
saveWidget(
  p, 
  here("2_figures", "figs", "sankey", "sankey.html"),
  selfcontained = FALSE, 
  libdir = here("2_figures", "figs", "sankey")
)

# Take a screenshot of the saved Sankey widget
webshot(
  here("2_figures", "figs", "sankey", "sankey.html"), 
  here("2_figures", "figs", "sankey", "sankey.png"), 
  delay = 5, 
  vwidth = 1650,   
  vheight = 840,   
  zoom = 4
)
