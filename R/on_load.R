.onLoad <- function(libname, pkgname){
  options(grass.version=7.8, grass.viewer="viewer")
  cli::cli_alert_info(paste0("GRASS GIS documentation - set to GRASS version ",
                             cli::col_green(.Options$grass.version)))
}
