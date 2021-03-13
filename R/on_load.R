.onLoad <- function(libname, pkgname){
  options(grass.version=7.8, grass.viewer="viewer")
  packageStartupMessage(paste0("GRASS GIS documentation - set to GRASS version ",
                               (.Options$grass.version)))
}
