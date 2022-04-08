grep -H -r "ETRS_1989_UTM_Zone_30N" *.PRJ | cut -d: -f1 >listado_etrs89_utm30.txt;
grep -H -r "ETRS_1989_UTM_Zone_29N" *.PRJ | cut -d: -f1 >listado_etrs89_utm29.txt;
grep -H -r "ED_1950_UTM_Zone_30N" *.PRJ | cut -d: -f1 > listado_ed50_utm30.txt;
grep -H -r "ED_1950_UTM_Zone_29N" *.PRJ | cut -d: -f1 > listado_ed50_utm29.txt;
while read f;
do
echo ${f//PRJ/SHP}
for filename in ${f//PRJ/*};
do
cp $filename ${filename//CONSTRU.ZIP/CONSTRU_25830}
done
done <listado_etrs89_utm30.txt
while read f;
do
echo ${f//PRJ/SHP}
ogr2ogr -s_srs "+init=epsg:25829" -t_srs "+init=epsg:25830" ${f//CONSTRU.ZIP.PRJ/CONSTRU_25830.SHP} ${f//PRJ/SHP}
done <listado_etrs89_utm29.txt
while read f;
do
echo ${f//PRJ/SHP}
ogr2ogr -s_srs "+init=epsg:23030 +nadgrids=PENR2009.gsb" -t_srs "+init=epsg:25830 +nadgrids=null" ${f//CONSTRU.ZIP.PRJ/CONSTRU_25830.SHP} ${f//PRJ/SHP}
done <listado_ed50_utm30.txt
while read f;
do
echo ${f//PRJ/SHP}
ogr2ogr -s_srs "+init=epsg:23029 +nadgrids=PENR2009.gsb" -t_srs "+init=epsg:25830 +nadgrids=null" ${f//CONSTRU.ZIP.PRJ/CONSTRU_25830.SHP} ${f//PRJ/SHP}
done <listado_ed50_utm29.txt
for f in *CONSTRU_25830* ;
do
mv -- "$f" "$(tr [:lower:] [:upper:] <<< "$f")" ;
done
mkdir "etrs89_utm30/";
for f in *CONSTRU_25830*;
do
mv $f "etrs89_utm30/"
done
echo Proceso completado. Los datos finales se encuentran en el directorio
etrs89_utm30