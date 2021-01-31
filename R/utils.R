return_null <- function(x) {
  NULL
}

get_os <- function() {
  unname(Sys.info()["sysname"])
}

local_root <- function(root, .local_envir = parent.frame()) {
  withr::local_options(
    list(boxrdrive.root = root),
    .local_envir = .local_envir
  )
}
