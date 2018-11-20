library(dplyr)
library(sp)
library(leaflet)

census_file <- download.file("http://www2.census.gov/geo/tiger/GENZ2017/shp/cb_2017_us_cd115_500k.zip",
                             destfile = "cb_2017_us_cd115_500k.zip")
unzip("cb_2017_us_cd115_500k.zip")

#fetch FIPS codes for all state lookups
FIPS_code <- xml2::read_html("https://en.wikipedia.org/wiki/Federal_Information_Processing_Standard_state_code") %>% 
  rvest::html_nodes("table") %>% 
  .[[1]] %>% 
  rvest::html_table() %>% 
  rename(STATEFP = `Numeric code`, ALPHA = `Alpha code`) %>% 
  mutate(STATEFP = stringr::str_pad(string = STATEFP, width=2, side="left", pad = "0"))

all_US <- rgdal::readOGR("cb_2017_us_cd115_500k.shp", "cb_2017_us_cd115_500k")

all_US_FIPS <- merge(all_US, FIPS_code)
all_US_FIPS$state_district <- paste(all_US_FIPS$ALPHA, all_US_FIPS$CD115FP, sep="-")
for(x in all_US_FIPS$state_district){
  temp <- subset(all_US_FIPS, state_district == x)
  temp_map <- leaflet(temp) %>%
    addProviderTiles("OpenStreetMap.Mapnik") %>%
    addPolygons(color = "#444444", weight = 1, smoothFactor = 0.5,
                opacity = 1.0, fillOpacity = 0.5)
  htmlwidgets::saveWidget(temp_map, file = paste0(x, ".html"))
  geojsonio::geojson_write(temp, file= paste0("geojson_files/", x, ".geojson"),
                           convert_wgs84 = T)
}

system("mv *.html html_maps")
