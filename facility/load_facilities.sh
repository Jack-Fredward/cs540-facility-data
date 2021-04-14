#loading facility data
shp2pgsql -d -I -s 2236 -W "latin1" -g geom facility.shp volusia.gis_facility > create_facility.sql
psql -d spatial -f create_facility.sql
