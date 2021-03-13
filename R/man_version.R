#' Access or modify the active GRASS doc version
#'
#' This set of function can be used to get the version used by the package or
#' to set the desired version.
#'
#' @param version [Double] The desired version of GRASS (7.8, 7.9, etc...)
#'
#' @return
#' The function `man_get_version` will return the currently set version, and
#' `man_set_version` will do so invisibly.
#'
#' @examples
#' man_set_version(7.9)
#' man_get_version()
#'
#' @export
man_set_version <- function(version=7.8){

  if(version %% 1 == 0){

    stop("version must be of the form: x.x (i.g 7.8)")

  } else {

    options(grass.version=version)
    message(paste0("GRASS GIS documentation - set to GRASS version ",
                   .Options$grass.version))
  }

  return(invisible(man_get_version()))
}

#' @export
#' @rdname man_set_version
man_get_version <- function(){

  return(.Options$grass.version)

}
