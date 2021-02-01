#' Get path on Box Drive
#'
#' @param ... `character` elements of path, with respect to root of Box Drive.
#'
#' @return `character` absolute path on Box Drive.
#' @examples
#' \dontrun{
#'   # not run because it depends on side effects
#'   box_drive("major_project", "key_file.csv")
#' }
#' @export
#'
box_drive <- function(...) {

  # test option allows us to specify the Box Drive root, thus
  # to test this function
  if (identical(getOption("boxrdrive.test"), TRUE)) {
    warning("boxrdrive.test is TRUE, not setting boxrdrive.root")
  } else {
    # consult the Box Drive settings
    set_option_root()
  }

  root <- getOption("boxrdrive.root")

  if (is.null(root)) {
    stop("Box Drive installation not found.")
  }

  if (!fs::dir_exists(root)) {
    stop("Box Drive directory not mounted. Check that Box Drive is running.")
  }

  fs::path(root, ...)
}
