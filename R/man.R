#' View a 'GRASS GIS' module manual page
#'
#' Visualize a 'GRASS GIS' module manual page either in the RStudio viewer
#' pane or in your browser.
#'
#' @param module (Character string, or simply the name of a 'GRASS GIS' module)
#'     The function supports non standard evaluation (i.e. \code{man(r.in.gdal)}).
#' @param dir (Character string) The directory in which to store the cached
#'     documentation (default to \code{tempdir()}).
#' @param viewer (Character string) One of \code{"viewer"} or \code{"browser"}. The
#'     viewer in which to disply the documentation, default to
#' \code{.Options$grass.viewer} (i.e. the 'Rstudio' pane). \code{browse} is
#'     a wrapper around \code{man} with de default viewer set to the browser.
#'
#' @return
#' This function does not return anything and is used for its side effects.
#'
#' @examples
#' \dontrun{
#' man("r.in.gdal")
#' browse(r.reclass)
#' }
#'
#'@export
man <- function(module, viewer=.Options$grass.viewer, dir=tempdir()){

  modules_data <- rgrassdoc::grassmodules78

  # Allows NSE
  module <- tryCatch({
    module <- !!module
  }, error = function(e){
    module <- rlang::as_string(rlang::ensym(module))
  })

  # Get default grass version
  grass_version <- man_get_version()

  # Check the cache for css and logo files
  if (!file.exists(file.path(dir, "grassdocs.css"))){
    xml2::download_html(url = "https://grass.osgeo.org/grass78/manuals/grassdocs.css",
                        file = file.path(dir, "grassdocs.css"))
  }

  if (!file.exists(file.path(dir,"grass_logo.png"))){
    xml2::download_html(url = "https://grass.osgeo.org/grass78/manuals/grass_logo.png",
                        file = file.path(dir, "grass_logo.png"))
  }

  # Proceed to partial matching
  if(!(module %in% modules_data$name)){

    cli::cli_alert_danger(paste0("No manual entry exists for module ",
                                 cli::col_green(module)))
    matches <- agrep(pattern = module, x = modules_data$name, value = T)

    if (length(matches)==0){
      cli::cli_alert_danger(paste0("No manual entry matching the index for module ",
                                   cli::col_green(module)))
      stop("module not found", call. = FALSE)
    }

    theend <- ifelse(length(matches)>5, 5, length(matches))

    cli::cli_alert(paste0("Did you mean: "))
    cli::cat_line(paste0("   ", cli::col_yellow(matches[1:theend])))
    module <- matches[1]
  }

  # Verify if addon or not
  module_idx <- which(module == modules_data$name)
  if(modules_data$addon[module_idx]){

    url_prefix <- "/manuals/addons/"

  } else{

    url_prefix <- "/manuals/"

  }

  # Check the cache for module file
  if (!file.exists(file.path(dir, paste0(module, ".html")))){

    tryCatch({

      the_url <- rgrassdoc_make_url(grass_version = grass_version,
                                    url_prefix = url_prefix,
                                    module = module)
      hmtl <- xml2::download_html(url = the_url,
                                  file = file.path(dir, paste0(module, ".html")))

    }, error = function(e){

      cli::cli_alert_danger(paste0("Error downloading html documentation, ",
                                   "check your internet connection"))

    })

  }

  # Check viewer and display
  if (viewer == "viewer"){

    rgrassdoc_viewer_message(module)

    if (interactive()){
      rstudioapi::viewer(file.path(dir, paste0(module, ".html")))
    } else {
      message("Session is not interactive - viewer cannot be used")
    }

  } else if (viewer == "browser"){
    the_url <- rgrassdoc_make_url(grass_version = grass_version,
                                  url_prefix = url_prefix,
                                  module = module)

    rgrassdoc_browser_message(module)

    if (interactive()){
      utils::browseURL(the_url)
    } else {
      message("Session is not interactive - browser cannot be used")
    }

  } else{

    cli::cli_alert_danger("Argument 'viewer' must be one of 'viewer' OR 'browser'" )

  }
}

#'@rdname man
#'@export
browse <- function(module, viewer="browser", dir=tempdir()){

  man(module = rlang::enexpr(module), viewer = viewer, dir = dir)

}

# Helper functions
# Construct the url
rgrassdoc_make_url <- function(base = "https://grass.osgeo.org/grass",
                               grass_version, url_prefix, module,
                               end = ".html"){

  url <- paste0(base, grass_version*10, url_prefix, module, end)

  return(url)

}

# Contruct messages
rgrassdoc_browser_message <- function(module){
  cli::cli_alert_success(paste0("Opening module ", cli::col_green(module),
                                " in browser"))
}

rgrassdoc_viewer_message <- function(module){
  cli::cli_alert_success(paste0("Displaying module ", cli::col_green(module),
                                " in viewer"))
}
