build_basic_app<-function(input_list,data_file="my_file.csv"){

  #initialize file
  writeLines("",data_file)

  create_ui_file(input_list)
  create_server_file(input_list,save_path = data_file)
  shiny::runApp()

}
