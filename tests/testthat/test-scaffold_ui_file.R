context("test-scaffold_ui_file.R")

test_that("UI file created", {
  input_list<-list(type=c("Text","Text"),id=c("id1","id2"),label=c("new_blah1","blah2"))
  expect_message(create_ui_file(input_list),"UI file created")
})

test_that("UI inputs correct",{
  expect_error(create_ui_file("blah"),'Must be of type \'list\'')
  expect_error(create_ui_file(list(type=c(),blah=c())),'Must include the elements')
})
