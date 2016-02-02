## Project Platypus

# [ placeholder for Orchard's wisdom / intro ]

## Just Run it

`docker run --rm --name platypus -p 80:8080 vmware/platypus`

_**or**_

#### Get it

clone this repo, and then:

`git submodule update --init --recursive` to make sure you obtain the Swagger-UI code-base

#### Build it

Replace `[vmware/platypus]` with your choice of a 

`docker build -t vmware/platypus .`