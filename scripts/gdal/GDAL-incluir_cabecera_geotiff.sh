 for i in *.tif;
   do 
     gdal_translate -co compress=LZW -a_srs EPSG:25830 "$i" ${i//.tif/_8bits.tif}   
 done

 mkdir resultado_final/

 for h in *_8bits*;
    do
      mv "$h" resultado_final/
 done
done

