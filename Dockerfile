#
# used for Project Platypus; for the make benefit
# of VMware API's Documentation using Swagger
#
# as seen on http://github.com/vmware/platypus
# 

#
# hacky way of injecting the API definition
#

FROM alpine:3.3

MAINTAINER Roman Tarnavski

RUN apk add --update sed nginx

WORKDIR /usr/share/nginx/html/

ADD ./ui/dist/ /usr/share/nginx/html

COPY ./logo_small.png /usr/share/nginx/html/images/logo_small.png

EXPOSE 80

COPY "api-*.json" /usr/share/nginx/html/

COPY "runner.sh" /usr/share/nginx/html/

ENTRYPOINT ["/usr/share/nginx/html/runner.sh"]
