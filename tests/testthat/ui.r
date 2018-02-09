
# input -------------------------------------------------------------------

input_data_tab <- function() {
  tabItem(
    tabName = "input_data_tab",
    fluidRow(
      box(
        width = 12, title = "Details",
        includeMarkdown("save_data.md")
      )
    ),
    fluidRow(
      box(
        width = 12, title = "Input Data",
        numericInput(inputId = "id1", label = "new_blah1", value = 1, min = NA, max = NA, step = NA)
        ,
        selectInput(inputId = "id2", label = "blah2", choices = c("change", "here"), selected = "", multiple = TRUE)
      )
    ), fluidRow(
      actionButton("save", "Save")
    )
  )
}

# browse tab function ------------------------------------------------------------------

browse_data_tab <- function() {
  tabItem(
    tabName = "browse_data_tab",
    fluidRow(
      box(
        width = 12, title = "Details",
        includeMarkdown("browse_data.md")
      )
    ),
    fluidRow(
      box(
        width = 12, title = "Browse Data",
        withSpinner(DT::dataTableOutput("data")),
        downloadButton("download_data")
      )
    )
  )
}

# Dashboard ---------------------------------------------------------------

dashboardPage(
  dashboardHeader(title = "Title"),
  dashboardSidebar(
    sidebarMenu(
      id = "tabs",
      menuItem("Input data", tabName = "input_data_tab", icon = icon("info")),
      menuItem("Browse data", tabName = "browse_data_tab", icon = icon("info"))
    )
  ),
  dashboardBody(
    # tags$head(includeScript("tracking.js")),
    useShinyjs(),
    #    shinyjs::inlineCSS(appCSS),
    tags$head(tags$style(HTML("
  .shiny-split-layout > div {
  overflow: visible;
  }
  "))),
    tabItems(
      input_data_tab(),
      browse_data_tab()
    ),
    use_bs_tooltip()
  )
)
