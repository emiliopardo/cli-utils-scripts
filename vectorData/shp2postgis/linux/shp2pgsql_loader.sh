#!/bin/bash

t_srs=EPSG:25830
host=10.240.2.27
port=5432
database=ogr2ogr
user=postgres
password=postgres
schema=public


# https://gdal.org/programs/ogr2ogr.html

for i in *.shp
    do 
        
        # ogr2ogr -lco FID=gid -lco GEOMETRY_NAME=geom -update -append -t_srs EPSG:25830 -f PostgreSQL PG:"host=10.240.2.27 port=5432 dbname=ogr2ogr user=postgres password=postgres schemas=public" %%i
        ogr2ogr -lco FID=gid -lco GEOMETRY_NAME=geom -update -append -t_srs $t_srs -dim XY -nlt PROMOTE_TO_MULTI -f PostgreSQL PG:"host=$host port=$port dbname=$database user=$user password=$password schemas=$schema" $i

    done;