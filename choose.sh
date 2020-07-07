#!/bin/bash +X

######### checking versioning file existance if not, create and add versioning to file ###########

if [ ! -f $component.txt ]
  then
   echo 0 0 0 > $component.txt
fi

########################## checking versioning file existance is completed ########################

############################# versioning script start #############################################

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

################ versioning script end ##############################

export version=$major.$minor.$patch

############# committing versioning file to central repo ############

#git add $component.txt

#git commit -m " $component.txt file updated with version"

#git push origin master

################## versioning file committed #########################
