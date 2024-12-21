########################### interventions ####################################

#Create a vector containing only the text
intervention_text <- clean_shiny$intervention # vector containing intervention info  
docs <- Corpus(VectorSource(intervention_text))

# cleanup code taken from: https://towardsdatascience.com/create-a-word-cloud-with-r-bde3e7422e8a
docs <- docs %>%
  tm_map(removeNumbers) %>%
  tm_map(removePunctuation)
  #tm_map(stripWhitespace)
docs <- tm_map(docs, content_transformer(tolower))
docs <- tm_map(docs, removeWords, stopwords("english"))

dtm <- TermDocumentMatrix(docs) 
matrix <- as.matrix(dtm) 
words <- sort(rowSums(matrix),decreasing=TRUE) 
df <- data.frame(word = names(words),freq=words)

# wordcloud for the interventions
set.seed(2024) # for reproducibility wordcloud
intervention_wordcloud <- wordcloud2(df, size=1.6, 
          color=color_pal)

saveWidget(intervention_wordcloud,"./2_figures/figs/wordcloud/intervention_wordcloud.html",
           selfcontained = F, libdir = "./2_figures/figs/wordcloud")
webshot("./2_figures/figs/wordcloud/intervention_wordcloud.html","./2_figures/figs/intervention_wordcloud.png", 
        delay =5, vwidth = 794, vheight = 561)

########################### outcomes ####################################

#Create a vector containing only the text
outcome_text <- clean_shiny$outcome # vector containing intervention info  
docs_one <- Corpus(VectorSource(outcome_text))

# cleanup code taken from: https://towardsdatascience.com/create-a-word-cloud-with-r-bde3e7422e8a
docs_one <- docs_one %>%
  tm_map(removeNumbers) %>%
  tm_map(removePunctuation)
#tm_map(stripWhitespace)
docs_one <- tm_map(docs_one, content_transformer(tolower))
docs_one <- tm_map(docs_one, removeWords, stopwords("english"))

dtm_one <- TermDocumentMatrix(docs_one) 
matrix_one <- as.matrix(dtm_one) 
words_one <- sort(rowSums(matrix_one),decreasing=TRUE) 
df_one <- data.frame(word = names(words_one),freq=words_one)

# wordcloud for the outcomes
set.seed(2024) # for reproducibility wordcloud
outcome_wordcloud <- wordcloud2(df_one, size=1.6, 
          color=color_pal)

saveWidget(outcome_wordcloud,"./2_figures/figs/wordcloud/outcome_wordcloud.html",
           selfcontained = F, libdir = "./2_figures/figs/wordcloud")
webshot("./2_figures/figs/wordcloud/outcome_wordcloud.html","./2_figures/figs/outcome_wordcloud.png", 
        delay =5, vwidth = 794, vheight = 561)

