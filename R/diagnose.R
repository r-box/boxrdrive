#' Diagnose Box Drive
#'
#' Provides diagnostics on access to local computer's installation of Box Drive.
#' To reload Box Drive's settings from your computer, use `reload = TRUE`.
#'
#' @param reload `logical` indicates to reload Box Drive settings.
#'
#' @return Invisible `NULL`, called for side effects.
#' @examples
#'   dr_box_drive()
#' @export
#'
dr_box_drive <- function(reload = TRUE) {

  # if Mac or Windows
  if (!get_os() %in% c("Darwin", "Windows")) {

  }

  if (reload) {
    set_option_root()
  }

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
    # oops not installed

  }

  # confirm installed

  installed
}

# snapshot-test this
dr_box_drive_mounted <- function() {

  mounted <- box_drive_mounted()

  if (!mounted) {
    # oops not mounted

  }

  # confirm mounted

  mounted
}

# test this
box_drive_installed <- function() {
  !is.null(getOption("boxrdrive.root"))
}

# test this
box_drive_mounted <- function() {
  box_drive_installed() && fs::dir_exists(getOption("boxrdrive.root"))
}

