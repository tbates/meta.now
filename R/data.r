### ==================
### = Bibliography =
### ==================
# 1. # TODO Add dois to existing data
# 3. # TODO decide whether to
		# 1. maintain bib files in extdata
		# 2. create a bib folder
		# 3. use subfolders for everything for each analysis
# 1. TODO: Add a fn to check that all dois are in bib file.
# 	1. add if necessary (and fn to merge submitted updates to bib file)
# 3. # DONE create and populate bib file 
# 	1. RefManageR::GetBibEntryWithDOI(doi, temp.file = tempfile(fileext = ".bib"), delete.file = TRUE)
# 2. # DONE: Picked bib package: [RefManageR](https://cran.r-project.org/web/packages/RefManageR)

# bib = load_bib(meta = "GxSES")

meta_check_all_DOIs_are_in_bib <- function(df, bib) {
	# 1. get dois in meta-analysis
	# 2. get dois in bib
	# 3. x %in% y?
	# return list of missing dois
	unique(df$doi) %in% bib$doi
}

# 2. Add any new dois for refs, report errors

addMissingDOIs <- function(df, bib) {
	missing = meta_check_all_DOIs_are_in_bib(df, bib)
	if(length(missing) > 0){
		# Add missing doi
		for(thisDOI in missing) {
			newRef = GetBibEntryWithDOI(thisDOI )
			# bib+newRef
		}
		# WriteBib(newRef)
	} else {
		message("All bibs in DOIs")
	}	
}

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
	fp = system.file(paste0("extdata/", meta), paste0("bib_", meta, ".bib"), package = "meta.now")
	bib = RefManageR::ReadBib(fp)
}


#' Read in the xlsx file containing effects to be meta-analysed
#'
#' @description
#' You provide the name of the meta analysis (e.g. "GxSES") which is expanded to the file name containing 
#' all the preior estiamtes, e.g. "data_GxSES.xlsx".
#' @details
#' (the actual file resides in the package's data folder).
#'
#' @param meta name of the meta-analytic "question"
#' @return - the effects data.frame
#' @export
#' @family Data Functions
#' @examples
#' df = load_meta(meta = "GxSES") # loaded as df
load_meta <- function(meta, type = "xlsx", verbose = getOption("verbose")) {
	# TODO: Check for blank cells? will make e.g. df$s_z into char.
	# TODO add an option to set data type
	# TODO detect suffix?
	fp = system.file(paste0("extdata/", meta), paste0("data_", meta, ".", type), package = "meta.now")
	# umx_msg(fp)
	if(type == "xlsx"){
		df <- gdata::read.xls(xls = fp, as.is=TRUE)
	} else if(type == "txt"){
		df <- read.delim2(fp, as.is = TRUE, na.strings = "NA")
	}else{
		stop("I only know about xlsx, txt")
	}
}


### ==========
### = Update =
### ==========
# 1. # TODO Update via R and via file uploads to github (via pages site?)
# 2. Add any new dois for refs, report errors

addMissingDOIs <- function(x) {
	x = meta_Check_all_DOIs_in_bib(x)
	if(!x){
		# add missing doi
	} else {
		message("All bibs in DOIs")
	}	
}
