test_that("local_root() works", {

  root <- "a/b/c"

  local_root(root)

  expect_identical(getOption("boxrdrive.root"), root)
})
