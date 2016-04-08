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

COPY ./logo_small.png /app/dist/images/logo_small.png

RUN npm install

EXPOSE 8080

COPY "api-*.json" /app/dist/

COPY "runner.sh" /app/dist/

WORKDIR /app/dist/

ENTRYPOINT ["/app/dist/runner.sh"]
