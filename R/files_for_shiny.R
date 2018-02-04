
write_global_file<-function(file_name='global.r'){
  x<-"library(shiny)
library(bsplus)
  library(shinydashboard)
  library(shinycssloaders)
  library(shinyjs)

  # for server functions
  library(dplyr)
  library(DT)
  library(glue)
  library(readr)"

  writeLines(x,file_name)
}

write_save_data_info_file<-function(file_name='save_data.md'){
  x<-"# Save data form
Details should go here
  "
  writeLines(x,file_name)

}

write_browse_data_info_file<-function(file_name='browse_data.md'){
  x<-"# Browse data form
Details should go here"
  writeLines(x,file_name)

}
