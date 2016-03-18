#!/bin/bash

echo "specifying your environment .. "

if [ -z ${PRODUCT} ]; then
  echo "PRODUCT not set, defaulting to vRA"
  export PRODUCT="vra"
fi

if [ -z ${VERSION} ]; then
  echo "VERSION not set, defaulting to 7"
  export VERSION="7"
fi

# check the file actually exists
API_FILE="api-$PRODUCT-$VERSION.json"
API_FILE=${API_FILE,,}

if [ ! -f $API_FILE ]; then
  echo "API Definition [ $API_FILE ] not found. Aborting"
  exit 1
fi

sed -i -e "s|http://petstore.swagger.io/v2/swagger.json|api-$PRODUCT-$VERSION.json|g" /app/dist/index.html

echo "starting your swaggerness"
/app/node_modules/gulp/bin/gulp.js serve