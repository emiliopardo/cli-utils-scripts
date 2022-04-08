 for i in *MTA*;
   do
     listgeo  -tfw "$i" 
  done
       
 #mkdir "8bits/";    
 
 #for j in *.tfw;
   #do
     #mv "$j" 8bits/
   #done  
   
  #cd 8bits/ 
   
 #for h in *.tif;
   #do 
     #gdal_translate -co compress=LZW -a_srs EPSG:25830 "$h" ${h//._tfw_tif/.tif}   
#done
