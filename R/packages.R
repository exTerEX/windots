pkgs <- c(
    "rmarkdown",
    "languageserver",
    "httpgd",
    "tidyverse",
    "ggpubr",
    "ggsci",
    "gggenes",
    "ggtext",
    "ggpmisc",
    "ggcorrplot"
)

pkgs <- unique(pkgs)

install.packages(pkgs)
