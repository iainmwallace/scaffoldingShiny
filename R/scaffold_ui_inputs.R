# scaffold input components for the ui.r file

create_input_box<-function(type,id,label){
  label=paste0("\"",label,"\"")
  id=paste0("\"",id,"\"")
  if(type=="Text"){
    x<-paste0("textInput(inputId=",id,",label=",label,",placeholder=\"Change placeholder\")")
  }

  return(x)
}

create_input_boxes<-function(input_list){
  #input list contains type, id, label

  z<-purrr::pmap(input_list,create_input_box)
  input_boxes<-paste0(z,collapse = ",\n")
  return(input_boxes)

}
