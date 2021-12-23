# Change location of the default library
.libPaths("~/.config/R/lib/4")

# Default options
local(
    {
        r <- getOption("repos")
        r["CRAN"] <- "https://cloud.r-project.org"
        options(repos = r)
    }
)

options(editor = "code")
options(pager = "internal")

# Completion of package names
utils::rc.settings(ipck = TRUE)

# Error tracing
if ("rlang" %in% loadedNamespaces()) options(error = rlang::entrace)

# Clear environment
rm(list = ls())
