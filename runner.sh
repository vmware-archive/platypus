#!/bin/sh

echo "specifying your environment .. "

if [ -z ${PRODUCT} ]; then
  echo "PRODUCT not set, defaulting to vRA"
  export PRODUCT="vra"
fi

if [ -z ${VERSION} ]; then
  echo "VERSION not set, defaulting to 7"
  export VERSION="7"
fi

if [ -z ${API_HOST} ]; then
  echo "API_HOST not set, defaulting to localhost."
  export API_HOST="localhost"
fi

# check the file actually exists
API_FILE="api-$PRODUCT-$VERSION.json"

if [ ! -f $API_FILE ]; then
  echo "API Definition [ $API_FILE ] not found. Aborting"
  exit 1
fi

sed -i -e "s|http://petstore.swagger.io/v2/swagger.json|api-$PRODUCT-$VERSION.json|g" index.html
sed -i -e "s|platypus_host|$API_HOST|g" api-$PRODUCT-$VERSION.json
sed -i -e 's,http://swagger.io,https://github.com/vmware/platypus,g' index.html
sed -i -e 's,>swagger<,>platypus<,g' index.html
sed -i -e 's,89bf04,01BFBF,g' ./css/screen.css
sed -i -e 's,20px 0 20px 40px;,20px 0 20px 60px;,g' ./css/screen.css

echo "starting your swaggerness"
nginx -g 'daemon off;'