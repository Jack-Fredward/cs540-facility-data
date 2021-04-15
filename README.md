# cs540-facility-data
Postgres/gis spacial data for the volusia county facilities with a focus on fire stations

An easier way is to: (note this is not working with current version of pgadmin 4.3 that I am using, I used dbeaver to import the data)
1. Create a table in your postgres database with a column for parid and a column for fsdistance
2. In pgadmin select this empty table and choose to import data
3. Select the provided csv file as the import file

This is for the complete facilities data
In order to get this data working you will need to follow these steps:
1. Download the facilities shapefiles from: http://maps.vcgov.org/gis/download/shapes.htm (can also use this repositories data but it will be out of date)
2. Use the load_facilities.sh script to load the facilities data into your postgres database
3. Follow the queries in fire_stations.sql to show how the fire stations were found and there distances to them
4. When the sql file says to run the script you should run the update_fire_station_distances.py file (this will take a long time)
5. The last query in the sql file just shows that the python script has been successful

All parcels with geometry now have a closest fire station
