#!/bin/bash

echo "$1"



echo "copying build.gradle to application"
echo 'cp ./app_build.gradle ../'$1'/'$1'/build.gradle'
cp ./app_build.gradle ../$1/$1/build.gradle
echo "copying build.gradle to composite application"
cp ./composite_build.gradle ../$1/$1CompositeApplication/build.gradle

cp -r ./gradle/* ../$1
mkdir -p ../$1/cucumber-sit
cp -r ./cucumber/* ../$1/cucumber-sit



grep --include=*.gradle -rnl './../'$1 -e "$projectName\$" | xargs -i@ sed -i 's/\$projectName\$/'$1'/g' @

