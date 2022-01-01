
options(
  # scientific notation -----
  "scipen" = 100L,
  #"digits" = 4L,

  # install packages faster -----
  Ncpus = 4L,

  # usethis setup -----
  usethis.name = "Adam H. Sparks",
  usethis.description = list(
    `Authors@R` = 'person("Adam H.", "Sparks",
                     email = "adamhsparks@icloud.com",
                     role = c("aut", "cre"),
                     comment = c(ORCID = "0000-0002-0061-8359")',
    License = "MIT + file LICENSE",
    Version = "0.0.0.9000"
  )
)

# Time Zone fix https://github.com/tidyverse/lubridate/issues/928
Sys.setenv("TZDIR" = file.path(R.home(), "share", "zoneinfo"))
Sys.setenv(NOT_CRAN = "true")

# RStudio theme switching -----
if (interactive() &&
    requireNamespace("rsthemes", quietly = TRUE) &&
    requireNamespace("later", quietly = TRUE)) {
  # Use later() to delay until RStudio is ready
  later::later(function() {
    # Set preferred themes if not handled elsewhere..
    rsthemes::set_theme_light("Nord Snow Storm {rsthemes}")  # light theme
    rsthemes::set_theme_dark("Nord Polar Night Aurora {rsthemes}") # dark theme

    auto_dark <- function(delay = 1) {
      cmd_is_dark <- "defaults read NSGlobalDomain AppleInterfaceStyle"
      macos_style <-
        suppressWarnings(system(
          cmd_is_dark,
          intern = TRUE,
          ignore.stderr = TRUE
        ))
      if (identical(tolower(macos_style), "dark")) {
        rsthemes::use_theme_dark()
      } else {
        rsthemes::use_theme_light()
      }
      later::later(auto_dark, delay)
    }
    auto_dark()
  }, delay = 1)
}

# git prompt setup -----
#prompt::set_prompt(function(...) {
#  branch <- (purrr::safely(gert::git_branch))()
#  if (is.null(branch$result))
#    return("> ")
#  return(paste0("[", branch$result, "] > "))
#})
