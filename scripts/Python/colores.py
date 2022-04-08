#!/usr/bin/env python

import re
import sys

def hex_to_rgb(value):
  value = value.lstrip('#')
  lv = len(value)
  return tuple(int(value[i:i+lv/3], 16) for i in range(0, lv, lv/3))

def rgb_to_hex(rgb):
  rgb = eval(rgb)
  r = rgb[0]
  g = rgb[1]
  b = rgb[2]
  return '#%02X%02X%02X' % (r,g,b)

def main():
  color = raw_input("HEX [#FFFFFF] or RGB [255, 255, 255] value (no value quits program): ")
  while color:
    if re.search('\#[a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9]', color):
      converted = hex_to_rgb(color)
      print converted
    elif re.search('[0-9]{1,3}, [0-9]{1,3}, [0-9]{1,3}', color):
      converted = rgb_to_hex(color)
      print converted
    elif color == '':
      sys.exit(0)
    else:
      print 'You didn\'t enter a valid value!'
    color = raw_input("HEX [#FFFFFF] or RGB [255, 255, 255] value (no value quits program): ")

if __name__ == '__main__':
  main()
