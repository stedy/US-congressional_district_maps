This is a repository of base64 encoded HTML Leaflet maps of every US
Congressional District as well as geoJSON files for all corresponding Congressional districts. I used the [US Census
Bureau](https://www.census.gov/geo/maps-data/data/cbf/cbf_cds.html)
website to
download a [shape file](http://www2.census.gov/geo/tiger/GENZ2017/shp/cb_2017_us_cd115_500k.zip) of the US Congressional Districts for the current Congress (at this
time the 115th Congress). I then used [R](https://cran.r-project.org/) as well a wrapper for [Leaflet](https://leafletjs.com/) to make
the maps and [geojson.io](https://github.com/mapbox/geojson.io) to make the [geoJSON](http://geojson.org/) files.

For example, I live in WA-09 and here is the corresponding map:

[WA-09](http://stedy.github.io/US-congressional_district_maps/html_maps/WA-09.html)

And the geojson file:

[WA-09 geojson](http://stedy.github.io/US-congressional_district_maps/blob/master/geojson_files/WA-09.geojson)
