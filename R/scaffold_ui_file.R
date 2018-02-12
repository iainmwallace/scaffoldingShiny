# Scaffolding functions to create the UI file

create_ui_file<-function(input_list,file_name="ui.r"){

  checkmate::assert_list(input_list)
  checkmate::assert_names(names(input_list),must.include = c('type','id','label'))
  checkmate::assert_character(file_name)


  input_boxes<-create_input_boxes(input_list)
  my_input<-input_data_tab(input_boxes)
  my_browse<-browse_data_tab()
  my_dash<-create_dashboardPage()
  file_content<-paste0(my_input,my_browse,my_dash)
  writeLines(file_content,file_name)

  if(file.exists(file_name)){
    message("UI file created\n")
  }else{
    warning("UI file not created\n")
  }

}

# create input data function -------------------------------------------
input_data_tab<-function(input_boxes){
  start<-"\n# input -------------------------------------------------------------------
  \ninput_data_tab<-function(){
  tabItem(tabName = \"input_data_tab\",
  fluidRow(
  box(width=12,title=\"\",
  includeMarkdown(\"save_data.md\"))
  ),
  fluidRow(
  box(width=12,title=\"\",\n"

  end<-")
  ),fluidRow(
  actionButton(\"save\", \"Save\")

  )
  )
  }\n"
  x<-paste0(start,input_boxes,end)
  return(x)

}

# create browse data function ---------------------------------------------
browse_data_tab<-function(){
  x<-"\n# browse tab function ------------------------------------------------------------------
  \nbrowse_data_tab<-function(){
  tabItem(tabName = \"browse_data_tab\",
  fluidRow(
  box(width=12,title=\"\",
  includeMarkdown(\"browse_data.md\"))
  ),
  fluidRow(
  box(width=12,title=\"Browse Data\",
  withSpinner(DT::dataTableOutput('data')),
  downloadButton(\"download_data\")
  )
  )

  )
  }\n"

  return(x)
}


# Dashboard page scaffolding ----------------------------------------------


create_dashboardPage<-function(){
  #Dashboard Page scaffolding function that creates two tabs
  #Register Data
  #Browse Data

  x<-"\n# Dashboard ---------------------------------------------------------------
  \ndashboardPage(
  dashboardHeader(title = \"Title\"),
  dashboardSidebar(
  sidebarMenu(
  id = \"tabs\",
  menuItem(\"Input data\", tabName = \"input_data_tab\", icon=icon(\"info\")),
  menuItem(\"Browse data\",tabName = \"browse_data_tab\",icon = icon(\"info\"))
  )

  ),
  dashboardBody(
  #tags$head(includeScript(\"tracking.js\")),
  useShinyjs(),
  #    shinyjs::inlineCSS(appCSS),
  tags$head(tags$style(HTML(\"
  .shiny-split-layout > div {
  overflow: visible;
  }
  \"))),
  tabItems(
  input_data_tab(),
  browse_data_tab()
  ),
  use_bs_tooltip()
  )
  )"

  return(x)

  }
