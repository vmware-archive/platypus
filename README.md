## Project Platypus

# [ placeholder for Orchard's wisdom / intro ]

## Just Run it

`docker run --rm --name platypus -p 80:8080 vmware/platypus`

## Specify PRODUCT & VERSION

`docker run --name platypus --rm -p 80:8080 -e PRODUCT="vra" -e VERSION="7" vmware/platypus`

`docker run --name platypus --rm -p 80:8080 -e PRODUCT="vrops" -e VERSION="6.2" vmware/platypus`

## Supported Variants

| Product       | Version       | Build   |
| ------------- | :---:         | :---:   |
| vRA           | 7             | 3311738 |
| vROPs         | 6.2           | 3445568 |
| vRO           | 7             | 3310032 |


_**or**_

#### Get it

clone this repo, and then:

`git submodule update --init --recursive` to make sure you obtain the Swagger-UI code-base

#### Build it

Replace `[vmware/platypus]` with your choice of a

`docker build -t vmware/platypus .`
