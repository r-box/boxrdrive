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

# based on usethis::ui_oops, etc.
ui_output <- function(x, bullet, .envir) {
  x <- glue::glue_collapse(x, "\n")
  x <- glue::glue(x, .envir = .envir)
  x <- paste0(bullet, " ", x)
  rlang::inform(x)
}

ui_oops <- function(x, .envir = parent.frame()) {
  ui_output(x, bullet = crayon::red(cli::symbol$cross), .envir = .envir)
}

ui_done <- function(x, .envir = parent.frame()) {
  ui_output(x, bullet = crayon::green(cli::symbol$tick), .envir = .envir)
}

# this one is a direct copy of usethis::ui_value()
ui_value <- function(x) {
  if (is.character(x)) {
    x <- encodeString(x, quote = "'")
  }
  x <- glue::glue_collapse(x, sep = ", ")
  x <- crayon::blue(x)
}


