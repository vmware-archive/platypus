#
# used for Grant Orchard's - Project Platypus
# for the make benefit of vRA API Swagger Documentation
# 
# as seen on http://github.com/vmware/platypus
#
# must be used in conjuction with the Swagger UI
# 
# hacky way of injecting the api definition below
# 

FROM vmware/node:4.2.4

MAINTAINER Roman Tarnavski

RUN tdnf install -y sed

WORKDIR /app

COPY ./ui /app

RUN npm install

EXPOSE 8080

COPY vra-api.json /app/dist/

RUN sed -i -e "s|http://petstore.swagger.io/v2/swagger.json|vra-api.json|g" /app/dist/index.html

CMD /app/node_modules/gulp/bin/gulp.js serve