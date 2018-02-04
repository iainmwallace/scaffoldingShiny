context("test-scaffold_server_file.R")

test_that("Server file created", {
  input_list<-list(type=c("Text","Text"),id=c("id1","id2"),label=c("new_blah1","blah2"))
  expect_message(create_server_file(input_list),"server file created")
})

test_that("Server inputs correct",{
  expect_error(create_server_file("blah"),'Must be of type \'list\'')
  expect_error(create_ui_file(list(type=c(),blah=c())),'Must include the elements')
})
