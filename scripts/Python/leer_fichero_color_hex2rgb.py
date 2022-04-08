#!/usr/bin/env python

import csv

with open("colores_mta10_2001.csv", "rb") as f:
    reader = csv.reader(f, delimiter="\t")
    for row in reader:	
		color= row[0]
		value = color.lstrip('#')
		lv = len(value)
		print tuple(int(value[i:i+lv/3], 16) for i in range(0, lv, lv/3))

		
        
