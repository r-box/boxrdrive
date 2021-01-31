#' Set option for Box Drive root
#'
#' We are storing this value in an option because it we can mock the option
#' in testing, making the testing independent of the Box Drive installation.
#'
#' To avoid errors on loading, this function is designed not to throw errors;
#' rather, it sets `option("boxrdrive.root")` to `NULL`, so that it can be dealt
#' with later.
#'
#' @seealso [Box Drive reference](https://support.box.com/hc/en-us/articles/360043697454-Configuring-the-Default-Box-Drive-Folder-Location)
#'
#' @return `character` previous value of option, invisibly.
#' @noRd
#'
set_option_root <- function() {

  os <- get_os()

  old_root <- getOption("boxrdrive.root")

  if (identical(os, "Darwin")) {
    root <- root_macOS()
  }

  if (identical(os, "Windows")) {
    root <- root_windows()
  }

  options(boxrdrive.root = root)

  return(invisible(old_root))
}

root_macOS <- function() {

  root <- NULL
  root <-
    tryCatch(
      system2(
        "defaults",
        args = c("read", "com.box.desktop", "preferences/sync_directory_path"),
        stdout = TRUE,
        stderr = TRUE
      ),
      warning = return_null,
      error = return_null
    )

  root
}

root_windows <- function() {

  root <-
    tryCatch(
      utils::readRegistry("SOFTWARE\\Box\\Box", "HLM"),
      warning = return_null,
      error = return_null
    )

  root
}
