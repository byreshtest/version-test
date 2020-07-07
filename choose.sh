#!/bin/bash +X

export major=`awk '{print $1 }' $component.txt` 
export minor=`awk '{print $2 }' $component.txt`
patch=`awk '{print $3 }' $component.txt`

if [ 'patch' = $version ] 
 then
   export patch=$((patch + 1))
   echo VERSION:$major.$minor.$patch
   echo $major $minor $patch > $component.txt
   echo version file updated
 elif [ 'minor' = $version ]
   then
     export minor=$((minor + 1))
     export patch=0
     echo VERSION:$major.$minor.$patch
     echo $major $minor $patch > $component.txt
     echo version file updated
 elif [ 'major' = $version ]
   then
     export major=$((major + 1))
     export minor=0
     export patch=0
     echo VERSION:$major.$minor.$patch
     echo $major $minor $patch > $component.txt
     echo version file updated
 else
     echo version not selected
fi

## push updated file to central repo ##

# git add $component.txt
# git commit -m "version updated "
# git push origin master
