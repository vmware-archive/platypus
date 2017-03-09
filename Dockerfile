# Docker build file for VMware Platypus API explorer container build
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
COPY ./logo_small.png /usr/share/nginx/html/images/logo_small.png

# install python, certificates so that wget works, download the distribution, configure it,
# and then uninstall python. done as one step so that image size is not bloated with python 
# which is unused except for the config step.  To pickup a new version, update the VERSION
# env var below to match the release in github 
RUN export VER="0.0.5" && \
    apk add --update python ca-certificates && \
    wget https://github.com/vmware/api-explorer/releases/download/${VER}/api-explorer-dist-${VER}.zip && \
    wget https://github.com/vmware/api-explorer/releases/download/${VER}/api-explorer-tools-${VER}.zip && \
    unzip -o api-explorer-dist-${VER}.zip && unzip -o api-explorer-tools-${VER}.zip  && \
    python apiFilesToLocalJson.py --swaggerglob ./local/swagger/*.json --outfile ./local.json && \
    rm apiFilesToLocalJson.py  api-explorer*.zip && \
    apk del python ca-certificates && \
    rm -rf /var/cache/apk/* 

EXPOSE 80
ENTRYPOINT ["/usr/share/nginx/html/runner.sh"]
