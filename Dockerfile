# Docker build file for VMware Platypus kAPI explorer/Platypus container build

FROM alpine:3.3

MAINTAINER Roman Tarnavski, Aaron Spear

# need nginx web server.  
RUN apk add --update nginx 

WORKDIR /usr/share/nginx/html/

# copy the local swagger json files into the image.  All files in this location are scanned
# and included in the 'local' API list in API Explorer
COPY ./api*.json /usr/share/nginx/html/local/swagger/

COPY nginx.conf /etc/nginx/nginx.conf
COPY "runner.sh" /usr/share/nginx/html/
<<<<<<< HEAD
COPY ./logo_small.png /usr/share/nginx/html/images/logo_small.png

# install python, certificates so that wget works, download the distribution, configure it,
# and then uninstall python. done as one step so that image size is not bloated with python 
# which is unused except for the config step.  To pickup a new version, update the VERSION
# env var below to match the release in github 
RUN export VERSION="0.0.2" && \
    apk add --update python && \
    apk update && \
    apk add ca-certificates && \
    wget https://github.com/vmware/api-explorer/releases/download/${VERSION}/api-explorer-dist-${VERSION}.zip && \
    wget https://github.com/vmware/api-explorer/releases/download/${VERSION}/api-explorer-tools-${VERSION}.zip && \
    unzip -o api-explorer-dist-*.zip  && \
    unzip -o api-explorer-tools-*.zip  && \
    python apiFilesToLocalJson.py --swaggerglob /usr/share/nginx/html/local/swagger/*.json --outfile /usr/share/nginx/html/local.json && \
    rm apiFilesToLocalJson.py && \
    rm api-explorer*.zip && \
    apk del python ca-certificates && \
    rm -rf /var/cache/apk/* 

=======

# install python, certificates so that wget works, download the distribution, configure it,
# and then uninstall python. done as one step so that image size is not bloated with python 
# which is unused except for the config step.  To pickup a new version, update the VERSION
# env var below to match the release in github 
RUN export VERSION="0.0.2" && \
    apk add --update python && \
    apk update && \
    apk add ca-certificates && \
    wget https://github.com/vmware/api-explorer/releases/download/${VERSION}/api-explorer-dist-${VERSION}.zip && \
    wget https://github.com/vmware/api-explorer/releases/download/${VERSION}/api-explorer-tools-${VERSION}.zip && \
    unzip -o api-explorer-dist-*.zip  && \
    unzip -o api-explorer-tools-*.zip  && \
    python apiFilesToLocalJson.py --swaggerglob /usr/share/nginx/html/local/swagger/*.json --outfile /usr/share/nginx/html/local.json && \
    rm apiFilesToLocalJson.py && \
    rm api-explorer*.zip && \
    apk del python ca-certificates && \
    rm -rvf /var/cache/apk/* && \
    ls -alR  

>>>>>>> aa5169c... Changed Platypus container to host new VMware API Explorer as the UI.
EXPOSE 80
ENTRYPOINT ["/usr/share/nginx/html/runner.sh"]
