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
