# scaffold input components for the ui.r file

create_input_box<-function(type,id,label){
  label=paste0("\"",label,"\"")
  id=paste0("\"",id,"\"")
  if(type=="Text"){
    x<-paste0("textInput(inputId=",id,",label=",label,",placeholder=\"Change placeholder\")")
  } else if(type=="Select"){
    x<-paste0("selectInput(inputId=",id,",label=",label,",choices=c(\"change\",\"here\"),selected = \"\",multiple=TRUE)")
  } else if(type == "Numeric"){
    x<-paste0("numericInput(inputId=",id,",label=",label,",value=1, min = NA, max = NA, step = NA)
")
  }

  # add tool tips

  x<-paste0(x,"%>%
              shinyInput_label_embed(
                icon(\"info\") %>%
                  bs_embed_tooltip(title = \"Change this help text for input\")
              )")

  return(x)
}

create_input_boxes<-function(input_list){
  #input list contains type, id, label

  z<-purrr::pmap(input_list,create_input_box)
  input_boxes<-paste0(z,collapse = ",\n")
  return(input_boxes)

}
