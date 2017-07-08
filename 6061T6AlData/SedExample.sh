#!/bin/sh
for i in ExptData\\* 
do 
  echo $i 
  t=`echo $i | sed -e 's/ExptData\\\\//'` 
  echo $t
  mkdir ExptData
  mv $i ExptData/$t
done 
