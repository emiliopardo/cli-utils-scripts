#!/usr/bin/env python
import glob
import sys

list_of_files = glob.glob('*.tfw')           # create the list of file
csv=open('csv_ed50_utm30.txt','w')
for file_name in list_of_files:
	f=open(file_name) 
	lines=f.readlines()
	f=file_name+","+lines[4].replace('\n', '').replace('\r', '')+","+lines[5].replace('\r', '')
	csv.write(f)
csv.close()	
	

	
	

