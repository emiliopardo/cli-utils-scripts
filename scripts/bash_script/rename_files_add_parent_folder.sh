for i in $(ls); do                        # runs through the 'items' in this dir                               
  if [ -d $i ]; then                      # if this is a dir
     fname=${i##*/}                 # pick up the dir name which will be used as prefix
     echo $fname                           
     cd $i                                    # move into the dir       
     for z in *; do               # loop over files starting with test and fq extension
       echo $z  
       cp $z ${fname}.${z}         # put the prefix to the file.               
     done                                        
     cd ..                                         
  fi                                              
done
