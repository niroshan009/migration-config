#!/bin/bash

echo "$1"



echo "copying build.gradle to application"
cp ./app_build.gradle ../test-project1/test-project-1/build.gradle
echo "copying build.gradle to composite application"
cp ./composite_build.gradle ../test-project1/test-project-1CompositeApplication/build.gradle

cp -r ./gradle/* ../test-project1
mkdir -p ../test-project1/cucumber-aat
cp -r ./cucumber/* ../test-project1/cucumber-aat



grep --include=*.gradle -rnl './../'$1 -e "$projectName\$" | xargs -i@ sed -i 's/\$projectName\$/'$1'/g' @

