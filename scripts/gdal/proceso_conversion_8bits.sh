#Conversion mta10_2013 a 8 bits

#SACAMOS LAS COORDENADAS DE LAS CABECERAS DE LOS FICHEROS ORIGINALES A FICHEROS TFW
 for i in *MTA*;
   do
     listgeo  -tfw "$i" 
  done
  
#CREAMOS DIRECTORIO 8BITS 
   mkdir 8bits/
 
#COPIAMOS LOS FICHEROS TFW AL DIRECTORIO CREADO ANTERIORMENTE
  for h in *.tfw;
   do
     mv "$h" 8bits/ 
  done
  
#CONVERTIMOS LAS IMÁGENES ORIGINALES A 8BITS CON IMAGEMAGICK DEFINIENDO UNA PALETA DE 256 COLORES HACIENDO USO DE LA PALETA DEFINIDA EN PRUEBA.TIF
#LOS FICHEROS RESULTANTES SE GUARDAN EN EL DIRECTORIO 8BITS
  for j in *MTA*;
   do
     convert  "$j" -compress LZW -type Palette -colors 256 -remap prueba.tif 8bits/$j
 done
 
#ACCEDEMOS AL DIRECTORIO 8BITS
 cd 8bits/
 
#INCLUIMOS LAS CABECERAS EN LOS TIF DE 8BITS Y NOMBRANDOLOS _8BITS.TIF 
  for k in *.tif;
   do 
     gdal_translate -co compress=LZW -a_srs EPSG:25830 "$k" ${k//.tif/_8bits.tif}   
 done
 
done 
 
  
