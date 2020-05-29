library(rvest)

index <- read_html("https://grass.osgeo.org/grass78/manuals/full_index.html")

index_nodes <- html_nodes(index, 'tr td')
index_text <- html_text(index_nodes)

all_modules <- data.frame(
  name = as.character(index_text[seq(from=1, to = length(index_text), by = 2)]),
  description = as.character(index_text[seq(from=2, to = length(index_text), by = 2)]),
  addon = FALSE,
  stringsAsFactors = F)

index_addon <- read_html("https://grass.osgeo.org/grass78/manuals/addons/")

index_addon_nodes <- html_nodes(index_addon, 'ul li') # li a
index_addon_text <- html_text(index_addon_nodes)
index_addon_text_clean <- gsub("[\r\n]", "", index_addon_text)[11:length(index_addon_text)]


all_addons <- data.frame(
  name = unlist(lapply(strsplit(index_addon_text_clean, ": "), `[`, 1)),
  description = unlist(lapply(strsplit(index_addon_text_clean, ": "), `[`, 2)),
  addon = TRUE,
  stringsAsFactors = F)

grassmodules78 <- rbind(all_modules, all_addons)

usethis::use_data(grassmodules78, overwrite = TRUE, internal = FALSE)
