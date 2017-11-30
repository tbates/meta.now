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


load_data <- function(path) {
	df <- gdata::read.xls(xls = path, stringsAsFactors = FALSE ,sheet="",na.strings = "NA")	
}
	
