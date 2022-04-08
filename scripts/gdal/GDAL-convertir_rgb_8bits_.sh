mkdir "mta10_2013_8bits/";

for i in *.tif;
	do
		rgb2pct.py -pct paleta.vrt "$i" ${i//.tif/_8bits.tif}
	done
for j in *_8bits.tif;
	do
        mv "$j" mta10_2013_8bits/
    done
done
