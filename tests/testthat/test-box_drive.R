test_that("box_drive() works", {

  withr::local_options(list(boxrdrive.test = TRUE))

  # simulate Box Drive not installed
  local_root(NULL)
  expect_warning(
    expect_error(box_drive(), "installation not found"),
    "boxrdrive\\.test is TRUE"
  )

  # create tempdir
  tempdir <- withr::local_tempdir()

  # specify, but do not yet create, Box Drive directory
  boxdir <- fs::path(tempdir, "Box")
  local_root(boxdir)

  # simulate Box Drive not mounted
  expect_warning(
    expect_error(box_drive(), "directory not mounted"),
    "boxrdrive\\.test is TRUE"
  )

  # create directory, allowing success
  fs::dir_create(boxdir)

  expect_warning(
    expect_identical(box_drive(), boxdir),
    "boxrdrive\\.test is TRUE"
  )

  expect_warning(
    expect_identical(box_drive("foo"), fs::path(boxdir, "foo")),
    "boxrdrive\\.test is TRUE"
  )

})
