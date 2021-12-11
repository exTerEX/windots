# Change location of the default library
.libPaths("~/.config/R/lib/4")

# Default options
options(
    repos = c(CRAN = "https://cloud.r-project.org/"),
    editor = "code",
    pager = "internal",
    useFancyQuotes = FALSE,
    tab.width = 2,
    browserNLdisabled = TRUE,
    max.print = 200,
    shiny.launch.browser = TRUE,
    Ncpus = parallel::detectCores(),
    scipen = 999,
    languageserver.snippet_support = TRUE,
    vsc.use_httpgd = TRUE,
    languageserver.server_capabilities = list(
        documentHighlightProvider = FALSE
    ),
    remotes.install.args = "--no-multiarch",
    devtools.install.args = "--no-multiarch",
)

# Completion of package names
utils::rc.settings(ipck = TRUE)

# History
Sys.setenv("R_HISTFILE" = path.expand("~/.config/R/.Rhistory"))

# Error tracing
if ("rlang" %in% loadedNamespaces()) options(error = rlang::entrace)

# Clear environment
rm(list = ls())
