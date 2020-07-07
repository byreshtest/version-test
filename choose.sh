major=`awk '{print $1 }' version.txt`; minor=`awk '{print $2 }' version.txt`; patch=`awk '{print $3 }' version.txt`

if [ 'patch' = $1 ] 
 then
   patch=$((patch + 1))
   echo patch increased and VERSION:$major.$minor.$patch
   echo $major $minor $patch > version.txt
   echo version file updated
 elif [ 'minor' = $1 ]
   then
     minor=$((minor + 1))
     patch=0
     echo minor increased and patch reset to zero and VERSION:$major.$minor.$patch
     echo $major $minor $patch > version.txt
     echo version file updated
 elif [ 'major' = $1 ]
   then
     major=$((major + 1))
     minor=0
     patch=0
     echo major increased and minor, patch reset to zero and VERSION:$major.$minor.$patch
     echo $major $minor $patch > version.txt
     echo version file updated
 else
     echo version not selected
fi

