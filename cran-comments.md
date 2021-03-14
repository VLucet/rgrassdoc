## Test environments
* local R installation (on Pop Os 20.10), R 4.0.3
* windows 10 (on GitHub Actions), R 4.0.3 & devel
* Mac OS (on GitHub Actions), R 4.0.3
* ubuntu 20.04 (on GitHub Actions), R 4.0.3 & devel

## Comments

For this package, the examples of the function man() are wrapped in dontrun{}, 
and the tests are skipped on CRAN due to the fact that the package is meant
to be ran interactively, because its main function is to use the Viewer pane 
in RStudio (or a browser window).

## R CMD check results

  Maintainer: ‘Valentin Lucet <valentin.lucet@gmail.com>’
  
  New submission
  
  Possibly mis-spelled words in DESCRIPTION:
    RStudio (3:49)

0 errors ✓ | 0 warnings ✓ | 1 note x
