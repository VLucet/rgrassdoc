#'@export
man_version <- function(version=NULL){

  if(is.null(version)){
    message(paste0("GRASS GIS documentation - set to GRASS version ",
                   (.Options$grass.version)))
  } else {

    if(version %% 1 == 0){

      stop("version must be of the form: x.x (i.g 7.8)")

    } else {

      options(grass.version=version)
      message(paste0("GRASS GIS documentation - set to GRASS version ",
                     (.Options$grass.version)))
      }
  }
}
