#!/usr/bin/env python
import glob
import sys
import pyproj

EPSG23030 = pyproj.Proj("+init=epsg:23030 +nadgrids=penr2009.gsb")
EPSG25830 = pyproj.Proj("+init=EPSG:25830")

list_of_files = glob.glob('*.tfw')           # create the list of file
for file_name in list_of_files:
	new_file=open(file_name.replace('.tfw', '_etrs89.tfw'),'w')
	original_file=open(file_name) 
	lines=original_file.readlines()
	new_file.write(lines[0])
	new_file.write(lines[1])
	new_file.write(lines[2])
	new_file.write(lines[3])
	ed50_x=lines[4].replace('\n', '')
	ed50_y=lines[5].replace('\n', '')
	etrs89_x,etrs89_y=pyproj.transform(EPSG23030, EPSG25830, ed50_x, ed50_y)
	new_file.write(str(etrs89_x)+'\n')
	new_file.write(str(etrs89_y)+'\n')
	new_file.close()


	

