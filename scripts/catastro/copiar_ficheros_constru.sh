# 1º Unificamos la localización de todos los ficheros CONSTRU.ZIP tanto rustico como urbano

find . -type f -name *_CONSTRU.ZIP -exec cp {} ./catastro_2018_constru \;

