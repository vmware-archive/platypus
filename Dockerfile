# Docker build file for VMware Platypus API explorer container build
FROM alpine:3.3

MAINTAINER Roman Tarnavski, Aaron Spear

# need nginx web server.  
RUN apk add --update nginx 

WORKDIR /usr/share/nginx/html/

# copy the local swagger json files into the image.  All files in this location are scanned
# and included in the 'local' API list in API Explorer
COPY ./api*.json /usr/share/nginx/html/local/swagger/
COPY ./local-apis.json /usr/share/nginx/html/local/
COPY ./apix-config.json /usr/share/nginx/html/local/

COPY nginx.conf /etc/nginx/nginx.conf
COPY "runner.sh" /usr/share/nginx/html/
# this ADD command will extract the favicons in the html root
ADD ./favicons.tar.gz /usr/share/nginx/html/

# install python, certificates so that wget works, download the distribution, configure it,
# and then uninstall python. done as one step so that image size is not bloated with python 
# which is unused except for the config step.  To pickup a new version, update the VERSION
# env var below to match the release in github 

RUN export VER="2.0.0" && export MILESTONE="a3" &&\
    apk add --update ca-certificates && \
    wget https://github.com/vmware/api-explorer/releases/download/${VER}${MILESTONE}/api-explorer-dist-${VER}.zip && \
    wget https://github.com/vmware/api-explorer/releases/download/${VER}${MILESTONE}/api-explorer-tools-${VER}.zip && \
    unzip -o api-explorer-dist-${VER}.zip && unzip -o api-explorer-tools-${VER}.zip  && \
    mv -f ./local/local-apis.json ./local.json && \ 
    mv -f ./local/apix-config.json ./assets/apix-config.json && \
    rm apiFilesToLocalJson.py  api-explorer*.zip && \
    rm -rf apixlocal* \
    apk del ca-certificates && \
    rm -rf /var/cache/apk/* 

EXPOSE 80
ENTRYPOINT ["/usr/share/nginx/html/runner.sh"]
