
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
  x<-"# Conratulations!

You have scaffolded a simple shiny app.
This tab allows a user to save the input you specified.
The data is stored in the backend that you specified.
This data is displayed in the next tab.

Feel free to provide feedback by opening an [issue]
(https://github.com/iainmwallace/scaffoldingShiny)

  "
  writeLines(x,file_name)

}

write_browse_data_info_file<-function(file_name='browse_data.md'){
  x<-"# Browse data form
You have scaffolded a simple shiny app.

This tab allows a user to browse the data that has been saved and download it.
The data is stored in the backend that you specified.

  Feel free to provide feedback by opening an [issue]
  (https://github.com/iainmwallace/scaffoldingShiny)
  "
  writeLines(x,file_name)

}
