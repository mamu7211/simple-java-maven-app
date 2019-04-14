#!/bin/bash
set +e
rm -rf target/zip-content
set -e
mkdir -p target/zip-content

VERSION=`mvn help:evaluate -Dexpression=project.version | grep "^[^\[]"`
ARTIFACTID=`mvn help:evaluate -Dexpression=project.artifactId | grep "^[^\[]"`

cp target/*.jar target/zip-content/
cd target/zip-content

echo "# Packaging $VERSION" > packaging-info.md
echo ""
echo $(date +"%Y-%m-%d %H:%M:%S") >> packaging-info.md

zip "$ARTIFACTID-$VERSION.zip" *

