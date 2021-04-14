# cs540-facility-data
Postgres/gis spacial data for the volusia county facilities with a focus on fire stations

In order to get this data working you will need to follow these steps:
1. Download the facilities shapefiles from: http://maps.vcgov.org/gis/download/shapes.htm (can also use this repositories data but it will be out of date)
2. Use the load_facilities.sh script to load the facilities data into your postgres database
3. Follow the queries in fire_stations.sql to show how the fire stations were found and there distances to them
4. When the sql file says to run the script you should run the update_fire_station_distances.py file (this will take a long time)
5. The last query in the sql file just shows that the python script has been successful

All parcels with geometry now have a closest fire station
