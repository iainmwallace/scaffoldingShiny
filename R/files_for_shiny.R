
write_global_file<-function(file_name='global.r', datastore_type="sqllite"){
  #write global file
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

  if(datastore_type=="sqllite"){
  y<-paste0("\nlibrary(DBI)
            library(dplyr)
            library(RSQLite)
            conn <- dbConnect(RSQLite::SQLite(),", "\"my-db.sqlite\"",")
            datatable=\"my_datatable\"")
  x<-paste0(x,y)
  }
  writeLines(x,file_name)
}

write_save_data_info_file<-function(file_name='save_data.md'){
  x<-"# Intro

This is a shiny app scaffolded using [https://github.com/iainmwallace/scaffoldingShiny](https://github.com/iainmwallace/scaffoldingShiny)

It is a working app but very easy to customize.

  "
  writeLines(x,file_name)

}

write_browse_data_info_file<-function(file_name='browse_data.md'){
  x<-"# Browse data form
This is a shiny app scaffolded using (https://github.com/iainmwallace/scaffoldingShiny)[https://github.com/iainmwallace/scaffoldingShiny]

Browse and download data input into the app here.
It can be customized!
  "
  writeLines(x,file_name)

}
