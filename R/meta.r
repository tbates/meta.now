### ==================
### = 1. Get it working =
### ==================
# 1. Pick required packages
# 	* https://cran.r-project.org/web/packages/psychmeta/index.html
# 2. # TODO Upload existing data
# 	1. [x] Add copy of existing excel spreadsheet
# 	2. [ ] create rdata for speed (each release)
# 3. # TODO re-create analyses
# 	1. [ ] Add R for analyses
# 	2. [ ] Format as knitr outputting to pdf/html

#' doit
#'
#' @description
#' doit does a meta-analysis
#'
#' @details
#'
#' @param meta the name of the meta-analysis (e.g "GxSES")
#' @return - 
#' @export
#' @family Reporting Functions
#' @examples
#' \dontrun{
#' doit("GxSES")
#' }
doit <- function(meta) {
	# meta = "GxSES"
	df  = load_meta(meta = "GxSES")	
	bib = load_bib(meta  = "GxSES")

	old.dir    = getwd()
	tmpdir = tempdir()
	setwd(tmpdir)
	doc        = system.file("Rmd", paste0(meta, ".Rmd"), package = "meta.now")
	tmpfile    = tempfile(fileext = ".html", tmpdir = tmpdir)
	knit2html(doc, tmpfile)
	browseURL(tmpfile)
	# Citet(bib, 1)
	setwd(old.dir)
}
