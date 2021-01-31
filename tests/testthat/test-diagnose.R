test_that("box_drive_installed() works", {

  # we use local_root() to temporarily set the option that the
  # tested functions refer to.

  local_root(NULL)
  expect_false(box_drive_installed())

  local_root(".")
  expect_true(box_drive_installed())

})

test_that("box_drive_mounted() works", {

  local_root(NULL)
  expect_false(box_drive_mounted())

  local_root(".")
  expect_true(box_drive_mounted())

  local_root("/dev/null")
  expect_false(box_drive_mounted())

})
