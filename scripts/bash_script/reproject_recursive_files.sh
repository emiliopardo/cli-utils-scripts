grep -H -r "GEOGCS" *.prj | cut -d: -f1 >
listado_etrs89.txt;


while read f;
do
echo ${f//prj/shp}
ogr2ogr -s_srs "+init=epsg:4258" -t_srs "+init=epsg:25830"
${f//.prj/_25830.shp} ${f//prj/shp}
done <listado_etrs89.txt

mkdir "etrs89_utm30/";
for f in *;
do
mv $f "etrs89_utm30/"
done
echo Proceso completado. Los datos finales se encuentran en el directorio etrs89_utm30
