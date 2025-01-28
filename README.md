
# Scoping Review ID Analysis Repository

This repository contains all the necessary files, scripts, and data for analyzing and visualizing results from a scoping review of school-based interventions for students with IDD. You can find supplementary materials available here: [https://doi.org/10.17605/OSF.IO/NECA5](https://doi.org/10.17605/OSF.IO/NECA5)

Access the Shiny App with the dataset here: [School-based interventions for students with ID](http://wanda.lnu.se:3838/scoping_review_school_id/shiny_app_scoping/)

Below is an overview of the repository structure and the purpose of its components.

---

## Repository Structure

### 1. `1_data`
- **Description**: This folder contains scripts and raw data required for the analysis.
- **Key Files**:
  - `clean_dataset.R`: This script initializes the project by importing and cleaning the dataset. It also sets up all necessary libraries.
  - `review_251543_included_csv_20241113040533.csv`: Bibliographic information about the studies.
  - `codebook.R`: contains metadata and codebook information about the dataset
- **Instructions**:
  - Run `clean_dataset.R` first to prepare the data for subsequent scripts.

---

### 2. `2_figures`
- **Description**: Contains scripts to generate all figures used in the manuscript.
- **Key Files**:
  - `country_map.R`: Script to create a geographic visualization of data.
  - `figure_sankey.R`: Script for creating a Sankey diagram.
  - `intervention_descriptives.R`: Generates descriptive figures for interventions.
  - `outcome_descriptives.R`: Creates figures summarizing study outcomes.
  - `population_descriptives.R`: Generates population-based descriptive visualizations.
  - `publications_info.R`: Summarizes publication-related data.
  - `wordclouds.R`: Generates word cloud visualizations.
- **Output**: All figures are saved in the `figs` folder.
- **Instructions**:
  - Before running scripts in the `2_figure` and `3_quality_assessment`, create a folder called `figs` in `2_figure`, and then `wordcloud` and `sankey` folders within `figs`.
  - These scripts can be run in any order after running `clean_dataset.R`.


---

### 3. `3_quality_assessment`
- **Description**: Contains scripts for generating figures related to research integrity and quality assessments.
- **Key Files**:
  - `quality_data.R`: Script to analyze and visualize data quality and research integrity metrics.
- **Output**: All quality-related figures are saved in the `figs` folder.
- **Instructions**:
  - This script can be run independently of other figure scripts but requires running `clean_dataset.R` first.

---

### 4. `shiny_app_scoping`
- **Description**: Contains a Shiny app for interactive exploration of the dataset.
- **Features**:
  - Allows users to filter data interactively.
  - Provides an option to download filtered data.
- **Instructions**:
  - The app sources `clean_dataset.R` and can be run independently.

---
---

## How to Use
1. Clone this repository to your local machine.
2. Open the R project file `scoping_review_ID_analysis.Rproj` in RStudio.
3. Start by running `clean_dataset.R` located in `1_data` to prepare the dataset.
4. Execute the figure generation scripts from `2_figures` and/or `3_quality_assessment` as needed.
5. Launch the Shiny app by running `app.R` in `shiny_app_scoping`.

---

> sessionInfo()
R version 4.4.1 (2024-06-14)
Platform: aarch64-apple-darwin20
Running under: macOS Sonoma 14.0

Matrix products: default
BLAS:   /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libBLAS.dylib 
LAPACK: /Library/Frameworks/R.framework/Versions/4.4-arm64/Resources/lib/libRlapack.dylib;  LAPACK version 3.12.0

locale:
[1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8

time zone: Europe/Stockholm
tzcode source: internal

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
 [1] vroom_1.6.5             bslib_0.8.0             DT_0.33                
 [4] shiny_1.9.1             wordcloud2_0.2.1        tm_0.7-15              
 [7] NLP_0.3-0               gsheet_0.4.5            ggpattern_1.1.3        
[10] patchwork_1.3.0         fontawesome_0.5.2       webshot_0.5.5          
[13] htmlwidgets_1.6.4       networkD3_0.4           showtext_0.9-7         
[16] showtextdb_3.0          sysfonts_0.8.9          rnaturalearthdata_1.0.0
[19] rnaturalearth_1.0.1     here_1.0.1              janitor_2.2.0          
[22] lubridate_1.9.3         forcats_1.0.0           stringr_1.5.1          
[25] dplyr_1.1.4             purrr_1.0.2             readr_2.1.5            
[28] tidyr_1.3.1             tibble_3.2.1            ggplot2_3.5.1          
[31] tidyverse_2.0.0        

loaded via a namespace (and not attached):
 [1] DBI_1.2.3          rlang_1.1.4        magrittr_2.0.3     snakecase_0.11.1  
 [5] e1071_1.7-16       compiler_4.4.1     systemfonts_1.1.0  callr_3.7.6       
 [9] vctrs_0.6.5        maps_3.4.2         pkgconfig_2.0.3    crayon_1.5.3      
[13] fastmap_1.2.0      labeling_0.4.3     utf8_1.2.4         promises_1.3.0    
[17] rmarkdown_2.29     tzdb_0.4.0         ps_1.8.1           ragg_1.3.3        
[21] bit_4.5.0          xfun_0.49          cachem_1.1.0       jsonlite_1.8.9    
[25] later_1.3.2        terra_1.7-78       parallel_4.4.1     R6_2.5.1          
[29] stringi_1.8.4      jquerylib_0.1.4    Rcpp_1.0.13-1      knitr_1.48        
[33] httpuv_1.6.15      igraph_2.1.1       timechange_0.3.0   tidyselect_1.2.1  
[37] rstudioapi_0.17.1  yaml_2.3.10        codetools_0.2-20   curl_5.2.3        
[41] processx_3.8.4     withr_3.0.2        evaluate_1.0.1     sf_1.0-18         
[45] units_0.8-5        proxy_0.4-27       xml2_1.3.6         pillar_1.9.0      
[49] KernSmooth_2.23-24 generics_0.1.3     rprojroot_2.0.4    hms_1.1.3         
[53] munsell_0.5.1      scales_1.3.0       xtable_1.8-4       class_7.3-22      
[57] glue_1.8.0         slam_0.1-54        tools_4.4.1        gridpattern_1.2.2 
[61] fs_1.6.5           grid_4.4.1         crosstalk_1.2.1    colorspace_2.1-1  
[65] cli_3.6.3          kableExtra_1.4.0   textshaping_0.4.0  fansi_1.0.6       
[69] viridisLite_0.4.2  svglite_2.1.3      gtable_0.3.6       sass_0.4.9        
[73] digest_0.6.37      classInt_0.4-10    farver_2.1.2       memoise_2.0.1     
[77] htmltools_0.5.8.1  lifecycle_1.0.4    httr_1.4.7         mime_0.12         
[81] bit64_4.5.2 
