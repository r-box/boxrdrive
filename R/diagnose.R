#' Diagnose Box Drive
#'
#' Provides diagnostics on access to local computer's installation of Box Drive.
#' To reload Box Drive's settings from your computer, use `reload = TRUE`.
#'
#' @return Invisible `NULL`, called for side effects.
#' @examples
#'   dr_box_drive()
#' @export
#'
dr_box_drive <- function() {

  os <- get_os()

  if (!os %in% c("Darwin", "Windows")) {
    ui_oops("Box Drive not available on OS {os}, only MacOS and Windows.")
    return(invisible(NULL))
  }

  set_option_root()

  # this function is not tested because everything above this comment
  # depends on the operating system and whether Box Drive is installed.

  # the functions called below this comment *are* tested because we can
  # manage the side effects.

  if (!dr_box_drive_installed()) {
    return(invisible(NULL))
  }

  if (!dr_box_drive_mounted()) {
    return(invisible(NULL))
  }

  return(invisible(NULL))
}

# snapshot-test this
dr_box_drive_installed <- function() {

  installed <- box_drive_installed()

  if (!installed) {
    ui_oops("Cannot find Box Drive installation.")
  } else {
    ui_done("Box Drive installation found.")
  }

  invisible(installed)
}

# snapshot-test this
dr_box_drive_mounted <- function() {

  mounted <- box_drive_mounted()

  if (!mounted) {
    ui_oops(
      "Box Drive directory not available; check that Box Drive is running."
    )
  } else {
    value <- ui_value(getOption("boxrdrive.root"))
    ui_done("Box Drive directory available at {value}.")
  }

  invisible(mounted)
}

# test this
box_drive_installed <- function() {
  !is.null(getOption("boxrdrive.root"))
}

# test this
box_drive_mounted <- function() {
  box_drive_installed() && fs::dir_exists(getOption("boxrdrive.root"))
}

