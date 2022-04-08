#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
Created on 15 sep. 2017

@author: epardo
'''
# standard imports

import os
import psycopg2

conn = psycopg2.connect("dbname='metadatos' user='postgres' host='localhost' password='postgres'")
cursor = conn.cursor()
query =  "INSERT INTO metadatos (archivo,metadato) VALUES (%s, %s);"

path = './metadatos'
for filename in os.listdir(path):
    if not filename.endswith('.xml'): continue
    fullname = os.path.join(path, filename)
    f = open(fullname, 'r')
    #print f.read()
    data = (filename,f.read())
    cursor.execute(query, data)
    f.close()
    conn.commit()
