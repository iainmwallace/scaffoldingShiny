function(input, output, session) {

dataset_to_save<-reactive({
my_data <- tibble(
id1=input$id1,
id2=input$id2)
 return(my_data)})

registerData<-observeEvent(input$save,{

  my_dataset<-dataset_to_save()

  withProgress(message="Registering",value=0.2,{
if(file.size("my_file.csv")>10){
            write_csv(my_dataset,path="my_file.csv",append = TRUE)
}else{
            write_csv(my_dataset,path="my_file.csv",append = FALSE)
}
}) 
 showModal(modalDialog(

  title = "Thank you!",
  "Data has been saved"
  ))
  })
allData <- reactiveFileReader(1000, session,"my_file.csv","read_csv")
output$data <- DT::renderDataTable({

  data<-allData()

  data<-data%>%select(
  everything())

  DT::datatable(data,  selection = 'single',
  filter='top',
  rownames= FALSE,
  escape=FALSE,
  options = list(
  scrollX = TRUE)
  )
})
output$download_data <- downloadHandler(
  filename = function() {
  paste("download_data", ".csv", sep = "")
  },
  content = function(file) {
  write_csv(allData(), file)
  }
  )
}
