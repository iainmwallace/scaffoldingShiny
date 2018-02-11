#' Build a basic shiny app that stores user input in a csv file
#' @title Build basic shiny app
#' @description Build basic shiny CRUD app that stores user input in a csv file
#' @param input_list list of fields for the Shiny app
#' @param datastore_type type of datastore used to save data. Currently must be file_based
#'
#' @export build_basic_app
#'
#' @examples
#' input_list<-list(type=c("Text","Text"),id=c("id1","id2"),label=c("new_blah1","blah2"))
#' build_basic_app(input_list)
build_basic_app<-function(input_list,datastore_type="file_based"){



  create_ui_file(input_list)
  create_server_file(input_list,datastore_type=datastore_type)
  write_save_data_info_file()
  write_browse_data_info_file()
  write_global_file(datastore_type=datastore_type)

#  styler::style_file('ui.r')
#  styler::style_file('server.r')
#  styler::style_file('global.r')


  shiny::runApp()

}
