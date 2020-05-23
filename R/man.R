#' View a 'GRASS GIS' module manual page
#'
#'
#' @param module (Character string, or simply the name of a 'GRASS GIS' module)
#' The function supports non standard evaluation (i.e. \code{man(r.in.gdal)}).
#' @param dir (Character string) The directory in which to store the cached
#' documentation (default to \code{tempdir()}).
#' @param viewer (Character string) One of \code{"viewer"} or \code{"browser"}. The
#' viewer in which to disply the documentation, default to
#' \code{.Options$grass.viewer} (i.e. the 'Rstudio' pane). \code{browse} is
#' a wrapper around \code{man} with de default viewer set to the browser.
#'
#' @return
#' This function does not return anything and is used for its side effects.
#'
#' @export
#'
#' @examples
#' man("r.in.gdal")
#' man(r.reclass)
#' the_module <- "v.overlay"
#' man(the_module)
#' browse(the_module)

#'@export
man <- function(module, viewer=.Options$grass.viewer, dir=tempdir()){

  # Allows NSE
  module <- tryCatch({
    module <- !!module
  }, error = function(e){
    module <- rlang::as_string(rlang::ensym(module))
  })

  # Get default grass version
  grass_version <- .Options$grass.version

  # Check the cache for css and logo files
  if (!file.exists(file.path(dir, "grassdocs.css"))){
    xml2::download_html(url = "https://grass.osgeo.org/grass78/manuals/grassdocs.css",
                        file = file.path(dir, "grassdocs.css"))
  }

  if (!file.exists(file.path(dir,"grass_logo.png"))){
    xml2::download_html(url = "https://grass.osgeo.org/grass78/manuals/grass_logo.png",
                        file = file.path(dir, "grass_logo.png"))
  }

  # If viewing in rsudio pane
  if (viewer == "viewer"){

    # Check the cache for module file
    if (!file.exists(file.path(dir, paste0(module, ".html")))){

      tryCatch({
        hmtl <- xml2::download_html(url = paste0("https://grass.osgeo.org/grass", grass_version,
                                                 "/manuals/", module, ".html"),
                                    file = file.path(dir, paste0(module, ".html")))
      }, error = function(e){
        stop(paste0("Error: no manual entry exists for module <", module,">"))
      })

    }

    rstudioapi::viewer(file.path(tempdir(), paste0(module, ".html")))

    # Else, viewing in browser
  } else if (viewer == "browser"){

    utils::browseURL(paste0("https://grass.osgeo.org/grass", grass_version,
                            "/manuals/", module, ".html"))

  } else{

    stop("Viewer must be one of \"viewer\" and \"browser\"" )

  }
}

#'@rdname man
#'@export
browse <- function(module, viewer="browser", dir=tempdir()){

  man(module = rlang::enexpr(module), viewer = viewer, dir = dir)

}
