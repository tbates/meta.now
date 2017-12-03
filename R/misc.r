#' make meta.now using devtools
#'
#' @description
#' Easily  run devtools "install", "release", "win", or "examples".
#'
#' @param what whether to "install", "release" to CRAN, check on "win", "check", or "examples"))
#' @param pkg the local path to your package. Defaults to my path to meta.now
#' @param check Whether to run check on the package before release (default = TRUE)
#' @return - 
#' @export
#' @family Miscellaneous Utility Functions
#' @examples
#' \dontrun{
#' umx_make(what = "install"))  # just installs the package
#' umx_make(what = "examples")) # run the examples
#' umx_make(what = "check"))    # run R CMD check
#' umx_make(what = "win"))      # check on win-builder
#' umx_make(what = "release"))  # release to CRAN
#' }
meta_make <- function(what = c("install", "examples", "check", "win", "rhub", "release" ), pkg = "~/bin/meta.now", check = TRUE) {
	what = match.arg(what)
	if(what == "install"){
		devtools::document(pkg = pkg); devtools::install(pkg = pkg);
	} else if(what == "examples"){
		devtools::run_examples(pkg = pkg)
	} else if(what == "check"){
		# http://r-pkgs.had.co.nz/check.html
		devtools::check(pkg = pkg)		
	} else if (what =="win"){
		# old =
		# devtools::build_win(pkg = pkg)

		# new =
		devtools::check_win_devel(pkg = pkg)
	} else if (what =="rhub"){
		# devtools::check_rhub(pkg = pkg)
	} else if (what == "release"){
		devtools::release(pkg = pkg, check = check)
	}
}
