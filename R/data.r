https://youtu.be/20ku1H4VzfQ

time: The faculty who didn't support Weinstein are not Cowards.
This is Sam and Brett. Sam suggests they are. Brett says he didn't, but maybe they are. The rationales are wrong. I'm not a coward for not fighting eery single fight in the world in possibly could, for good. You have to pick battles. The coward is not fighting a battle he has decided IS the one to fight. 
My claim: Most faculty actually are not thinking about what is a good fight, they are just avoiding fights. A majority with an opinion one way or another support crushing people opposed to intersectional nonsense. A tiny minority disagree.

time: You'll be picked off one by one. Nope. No evidence for this, indeed, the opposite. And many will be calculating they can retire before this hits, and others that they can prosper while it rules. The exact opposite.

time: Race is not the best term to use for human group differences. But we have different lineages, and races are as valid (useful biological concepts) as families.

This is likely true: Jensen said as much about intelligence. The term is so overloaded, we should speak instead of scientific concepts, like general ability.

21:52: It would be a miracle if all populations were identical on any trait. Brett said that we don’t need to fear this. Certainly inuits are selected for conserving heat, and Kenyans are selected for something else, which allows them to be faster in a 1 km run. Brett then says everywhere selects for intelligence, and it will spread. This much we can agree upon. We are a highly nurture-dependent creature. I think this is true also. But this (better cognition is valuable everywhere, and may spread, and we have culture) doesn’t create an apriori reason that all lineages will be identical on the genetics that affect IQ. Anymore than mobility is valuable, and may spread, and we have culture, a priori rules out the Inuit vs. Kenyan difference in running (or any of many htousnads of differences, large and small).

30:00: The black lives matter movement is ineducable on the matters which matter most to them – identity and race.
This is indeed incalculable. It is devastating: it prevents reason. What can we say: Oh why? I think this tells us that need for cognition is the single most important trait for us to study, and nurture, and scaffold in society - think of the equivalent of whistle-blower laws. Jo Johnson is doing this.

35:00 Intersectionality.


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
# 	1. RefManageR::GetBibEntryWithDOI(doi, temp.file = tempfile(".bib"), delete.file = TRUE)
# 2. # DONE: Picked bib package: [RefManageR](https://cran.r-project.org/web/packages/RefManageR)

# bib = load_bib(meta = "GxSES")

# 1. Find all xlsx files
# 2. check an up-to-date Rd exists for each
# 	* Create one if not
# 3. If new Rd(s) created, update combined file

mn_update_data <- function(x) {
	# ✓ todo get a list of all .xlsx files in extdata	
	path = system.file(paste0("extdata/", me), package = "meta.now")
	alldataFiles = list.files(path = path, pattern = "data_GxSES..*\\.xlsx")
	rdFiles      = list.files(path = path, pattern = "data_GxSES..*\\.rd")
	# Update rd file list for any new xlsx files found
	# TODO check if excel updated, not just created
	# 3. # TODO Check it's all up to date

	# 1. Open each contributory file for this project
	filesToUpdate = alldataFiles[!(alldataFiles %in% rdFiles)]
	for (f in filesToUpdate) {
		message("May take some time...")
		# f = alldataFiles[1]
		tmp = gdata::read.xls(paste0(path, "/", f), stringsAsFactors = FALSE)
		# delete guide column
		tmp$hint = NULL
		colNames = tmp$Variable
		colNames = umx_names(colNames, " ", replace = "_")
		# Transpose and drop row 1 (column names)
		y = data.frame(t(tmp)[-1, ], stringsAsFactors = FALSE)
		names(y) = colNames
		# y[1:5,c(1, 15)]
		# Detect number of rows in this dataset, and reduce df to this
		maxRows = sum(!is.na(y$s))
		y = y[maxRows, ]
		# TODO fill out columns of redundant data
		# 1. Find first data point "s"
		mightNeedFilling = colNames[1:which(colNames %in% "s") - 1]
		# 2. 
		

		# Remove .xlsx from name, and save output
		dfName = umx_names(f, ".xlsx", replace = "")
		assign(dfName, y)
		save(dfName, file = paste0(dfName, ".rda"))
		system(paste("open ",shQuote(getwd(), type = "csh")))	
	}
	# replace spaces (which are imported as periods) with "_"
	df = umx_rename(df, "_", grep="\\.");
	# Make US and non US data sets
	dfUS = df[df$US == 1, ]
	dfEU = df[df$US == 0, ]
	
	# 2. TODO Save the meta-file for this project
	# meta_make()
}


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
