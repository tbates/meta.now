#   Copyright 2007-2017 Copyright 2017-2018 Timothy C. Bates
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
# 
#        http://www.apache.org/licenses/LICENSE-2.0
# 
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

# usethis::use_vignette("guide", base_path ="~/bin/meta.now")

# ===============================
# = Highlevel models (ACE, GxE) =
# ===============================
.onAttach <- function(libname, pkgname){
	packageStartupMessage("For an overview type '?meta.now'")
}

#' @importFrom RefManageR ReadBib
#' @importFrom RefManageR GetBibEntryWithDOI
# #' @importFrom psychmeta 
# #' @importFrom RSQLite 
NULL

utils::globalVariables(c(
	)
)

### ==================
### = Output =
### ==================
# 1. # TODO Create github pages site for package? or use vignettes?
# 	1. https://github.com/blog/2464-use-any-theme-with-github-pages
# 2. # TODO choose graph styles
# 3. # TODO write different outputs

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


#' Do a meta-analysis: now!
#'
#' meta.now helps keep meta-analyses up-to-date, with functions to produce the graphs and text of a meta-analysis,
#' and support via git for users to push updates as new data emerge
#' 
#' If you want the bleeding-edge version:
#' 
#' devtools::install_github("tbates/meta.now")
#' 
#' @family Reporting Functions
#' @family Plotting functions
#' @family Data Functions
#' @family File Functions
#' @family Miscellaneous Utility Functions
#' 
#' @examples
#'
#' @docType package
#' @name meta.now
NULL
