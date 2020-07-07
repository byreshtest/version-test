#!/bin/bash

major=`awk '{print $1 }' $component.txt` 
minor=`awk '{print $2 }' $component.txt`
patch=`awk '{print $3 }' $component.txt`

if [ 'patch' = $version ] 
 then
   patch=$((patch + 1))
   echo VERSION:$major.$minor.$patch
   echo $major $minor $patch > $component.txt
   echo version file updated
 elif [ 'minor' = $version ]
   then
     minor=$((minor + 1))
     patch=0
     echo VERSION:$major.$minor.$patch
     echo $major $minor $patch > $component.txt
     echo version file updated
 elif [ 'major' = $version ]
   then
     major=$((major + 1))
     minor=0
     patch=0
     echo VERSION:$major.$minor.$patch
     echo $major $minor $patch > $component.txt
     echo version file updated
 else
     echo version not selected
fi

