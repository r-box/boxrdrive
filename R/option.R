#' Set option for Box Drive root
#'
#' We are storing this value in an option because it we can mock the option
#' in testing, making the testing independent of the Box Drive installation.
#'
#' @seealso [Box Drive reference](https://support.box.com/hc/en-us/articles/360043697454-Configuring-the-Default-Box-Drive-Folder-Location)
#'
#' @return `character` previous value of option, invisibly.
#' @noRd
#'
set_option_root <- function() {

  os <- unname(Sys.info()["sysname"])

  old_root <- getOption("boxrdrive.root")
  root <- old_root

  if (identical(os, "Darwin")) {
    root <- root_macOS()
  }

  if (identical(os, "Windows")) {
    root <- root_windows()
  }

  options(boxrdrive.root = root)

  return(invisible(old_root))
}

stop_no_installation <- function() {
  stop("Cannot find Box Drive installation.", call. = FALSE)
}

root_macOS <- function() {

  root <-
    tryCatch(
      system2(
        "defaults",
        args = c("read", "com.box.desktop", "preferences/sync_directory_path"),
        stdout = TRUE,
        stderr = TRUE
      ),
      warning = function(w) stop_no_installation(),
      error = function(e) stop_no_installation()
    )

  root
}


root_windows <- function() {

  root <-
    tryCatch(
      utils::readRegistry("SOFTWARE\\Box\\Box", "HLM"),
      warning = function(w) stop_no_installation(),
      error = function(e) stop_no_installation()
    )

  root
}
