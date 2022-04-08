# Creamos una carpeta para almacenar los ficheros descomprimidos
mkdir "constru_2018_unzip/";
# Hacemos un bucle para acceder a todos los ficheros zip
for i in *.ZIP;
do
# Creamos un directorio que tenga el mismo nombre que el nombre del fichero zip
mkdir "$i-dir"
# Accedemos al directorio creado previamente
cd "$i-dir"
# Descomprimimos el fichero zip dentro del directorio en cuestion
unzip "../$i"
# Movemos los ficheros que estan dentro del directorio a la carpeta raiz y los renombramos con el nombre del directorio, asi cada fichero tiene el nombre que le corresponde al zip
for j in *;
do
mv "$j" ../constru_2018_unzip/"$i.${j##*.}"
done
cd ..
# Borramos los directorio creados para cada uno de los ficheros
for x in *CONSTRU*/;
do
rm -d "$x"
done
done