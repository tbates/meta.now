### ==================
### = Bibliography =
### ==================
# 1. # TODO Add dois to existing data
# 2. # TODO pick a package: [RefManageR](https://cran.r-project.org/web/packages/RefManageR)
# 3. # TODO create and populate bib file 
# 	1. RefManageR::GetBibEntryWithDOI(doi, temp.file = tempfile(fileext = ".bib"), delete.file = TRUE)
# 3. # TODO decide whether to
		# 1. maintain bib files in extdata
		# 2. create a bib folder
		# 3. use subfolders for everything for each analysis

# 1. check all dois in bib file
# 	1. add if necessary

# bib = load_bib(meta = "GxSES")

newRef = GetBibEntryWithDOI("10.1046/j.0956-7976.2003.psci_1475.x")
GetBibEntryWithDOI("10.1046/j.0956-7976.2003.psci_1475.x"); 
WriteBib(newRef)

meta_Check_all_DOIs_in_bib <- function(x) {
	
}