### =============================
### =           TODO            =
### =============================

### ==================
### = 1. Get it working =
### ==================

# 1. # TODO Upload existing data
# 	1. Add copy of existing excel spreadsheet
# 	2. create rdata for speed (each release)
# 2. # TODO re-create analyses
# 	1. Format as knitr outputting to pdf/html
# 3. Pick required packages
# 	* https://cran.r-project.org/web/packages/psychmeta/index.html

### =====================================
### =         Features to add           =
### =====================================

### ==========
### = 2. Output =
### ==========

# 1. Vignette so browsers can see current results.

### ===============
### = 3. Updating =
### ===============

# 1. Add new data
# 	1. Push new-data file to the github, which we then add to the main file?
# 1. Update via an R function (creates git pull request?
# 	3. Add new results function
# 	4. Add new columns function

### =============================================================
### = 4. Credit updaters on new doi-based releases of the paper =
### =============================================================
# 1. doi built-in.
# 2. low-effort: via R or uploading a spreadsheet to github; or web interface.
# 3. Incentive structure to contribute?
# 	1. http://blog.chrisgorgolewski.org/2017/11/sharing-academic-credit-in-open-source.html
# 	2. Add re-order to author list for new data or systematic reviews?


### =================================
### = 5. Extensible for more topics =
### =================================
# 1. Unify, or fork
# 2. Able to select results for different topics.
# 	1. File--> SQL structure
# 	2. Use [sqlite](https://cran.r-project.org/web/packages/RSQLite/index.html)?
			# dbGetQuery(db, "SELECT * FROM GxSES WHERE age > 18")

### =================
### = Systematicity =
### =================
# 1. Create system to store, document, and run automated searches on g scholar/pmed and detect candidate new papers
# 2. Checking/adding for credit/authorship/money if grant or philanthropy available?


# ===========================
# = 6. Boiler plate abstract, introduction, methods, and disscussion =
# ===========================

# 1. Refs for the topic, and the meta-analysis.
# 2. Build templates.
# 3. Automate hypotheses/discussion.


# ===========================
# = 7. Support bibliography =
# ===========================

# 1. Use [bibtex](https://cran.r-project.org/web/packages/bibtex/bibtex.pdf) package
# 2. build reference for meta-analysis from dois in source list and citations in the introduction

