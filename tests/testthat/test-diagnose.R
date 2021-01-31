test_that("test with NULL root", {

  # we use local_root() to temporarily set the option that the
  # tested functions refer to.

  local_root(NULL)

  expect_false(box_drive_installed())
  expect_snapshot(dr_box_drive_installed())

  expect_false(box_drive_mounted())
  expect_snapshot(dr_box_drive_mounted())

})

test_that("test with cwd root (exists)", {


  local_root(".")
  expect_true(box_drive_installed())
  expect_snapshot(dr_box_drive_installed())

  expect_true(box_drive_mounted())
  expect_snapshot(dr_box_drive_mounted())

})

test_that("test with /dev/null root (does not exist)", {

  local_root("/dev/null")
  expect_false(box_drive_mounted())
  expect_snapshot(dr_box_drive_mounted())

})
