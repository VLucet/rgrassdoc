library(rvest)

index <- read_html("https://grass.osgeo.org/grass78/manuals/full_index.html")

index_nodes <- html_nodes(index, 'tr td')
index_text <- html_text(index_nodes)

grassmodules78 <- data.frame(
  module = as.character(index_text[seq(from=1, to = length(index_text), by = 2)]),
  description = as.character(index_text[seq(from=2, to = length(index_text), by = 2)]),
  stringsAsFactors = F)

usethis::use_data(grassmodules78, overwrite = TRUE, internal = FALSE)
