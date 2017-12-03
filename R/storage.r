### ==================
### = Storage =
### ==================
# 1. TODO Read and write spreadsheet input
# 2. TODO update mechanism via github pull requests
# 	2. implement file interface
# 3. TODO create and SQL tables for data?
# 	1. https://cran.r-project.org/web/packages/RSQLite/RSQLite.pdf


#' Read in bib file containing references to be cited
#'
#' @description
#' You provide the name of the meta analysis (say "GxSES") which is expanded to "bib_GxSES.bib"
#' and opened (the actual file resides in the package's data folder).
#' @details
#'
#' @param meta name of the meta-analytic "question"
#' @return - the effects data.frame
#' @export
#' @family Data Functions
#' @examples
#' bib = load_bib(meta = "GxSES") # loaded as bib
load_bib <- function(meta) {
	# meta = "GxSES"	# "bib_GxSES.bib"
	BibOptions(check.entries = TRUE)
	fp = system.file("extdata", paste0("bib_", meta, ".bib"), package = "meta.now")
	bib = RefManageR::ReadBib(fp)
}


#' Read in the xlsx file containing effects to be meta-analysed
#'
#' @description
#' You provide the name of the meta analysis (say "GxSES") which is expanded to "data_GxSES.xlsx"
#' and opened (the actual file resides in the package's data folder).
#' @details
#'
#' @param meta name of the meta-analytic "question"
#' @return - the effects data.frame
#' @export
#' @family Data Functions
#' @examples
#' load_meta(meta = "GxSES") # loaded as df
load_meta <- function(meta, verbose = getOption("verbose")) {
	# gets a ".csv" dataframe containing all the previous results.
	# df = data(paste0("data_", meta), package = "meta.now", verbose = verbose)
	fp = system.file("extdata", paste0("data_", meta, ".csv"), package = "meta.now")
	# fp = system.file("extdata", paste0("data_", meta, ".xlsx"), package = "meta.now")
	df <- read.delim2(fp, stringsAsFactors = FALSE)	
	# df <- gdata::read.xls(xls = fp, stringsAsFactors = FALSE, sheet="", na.strings = "NA")
}
