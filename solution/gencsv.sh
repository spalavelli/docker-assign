#! /bin/bash
RANDOM=$$
for i in `seq 9`
do 
        echo $i,$RANDOM
done >> inputFile
