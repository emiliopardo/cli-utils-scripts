set t_srs=EPSG:25830
set host=10.240.2.27
set port=5432
set database=ogr2ogr
set user=postgres
set password=postgres
set schema=public


@REM https://gdal.org/programs/ogr2ogr.html

for %%i in (*.shp) do (
    @REM ogr2ogr -lco FID=gid -lco GEOMETRY_NAME=geom -update -append -t_srs EPSG:25830 -f PostgreSQL PG:"host=10.240.2.27 port=5432 dbname=ogr2ogr user=postgres password=postgres schemas=public" %%i
    ogr2ogr -lco FID=gid -lco GEOMETRY_NAME=geom -update -append -t_srs %t_srs% -dim XY -nlt PROMOTE_TO_MULTI -f PostgreSQL PG:"host=%host% port=%port% dbname=%database% user=%user% password=%password% schemas=%schema%" %%i
)