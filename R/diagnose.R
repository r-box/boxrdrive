#' Diagnose Box Drive
#'
#' @param reload `logical` indicates to reload Box Drive settings.
#'
#' @return Invisible `NULL`, called for side effects.
#' @examples
#'   dr_box_drive()
#' @export
#'
dr_box_drive <- function(reload = TRUE) {

  if (reload) {

  }

  if (!box_drive_installed()) {
    # oops not installed
    return(invisible(NULL))
  }

  # confirm installed

  if (!box_drive_mounted()) {
    # oops not mounted
    return(invisible(NULL))
  }

  # confirm mounted

  return(invisible(NULL))
}

box_drive_installed <- function() {
  is.null(getOption("boxrdrive.root"))
}

box_drive_mounted <- function() {
  box_drive_installed() && fs::dir_exists(getOption("boxrdrive.root"))
}
