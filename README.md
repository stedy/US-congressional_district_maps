This is a repository of HTML files for mapping every US Congressional
District

Input
=====

The main [R](https://cran.r-project.org) script, `make_CD_map.R` downloads [shapefiles](http://www2.census.gov/geo/tiger/GENZ2017/shp/cb_2017_us_cd115_500k.zip) of US Congressional Districts for the current Congress (at this time the 115th Congress) from the [US Census Bureau](https://www.census.gov/geo/maps-data/data/cbf/cbf_cds.html) website.

Output
======

For each Congressional District there are two files generated:

- A base64 encoded [Leaflet](https://leafletjs.com/) map. This is
generated as a 100% `<div>` with maps from
[OpenStreetMap](https://wiki.openstreetmap.org/wiki/Mapnik)

- A [geoJSON](http://geojson.org) file created with [geojson.io](https://github.com/mapbox/geojson.io) using [WGS84 coordinates](https://gisgeography.com/wgs84-world-geodetic-system/)

Both of these outputs can be styled with different base maps or use
different coordinate systems as desired.

Examples
========

For example, I live in
[WA-09](https://ballotpedia.org/Washington's_9th_Congressional_District) and here is the corresponding map:

[WA-09 html](http://stedy.github.io/US-congressional_district_maps/html_maps/WA-09.html)

And the geoJSON file:

[WA-09 geojson](http://stedy.github.io/US-congressional_district_maps/geojson_files/WA-09.geojson)
