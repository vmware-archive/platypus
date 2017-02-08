## Project Platypus
![](platypus.jpg)

Platypus is an initiative to improve documentation across a number of VMware's products (see [Supported Products](#supported-products)) as described using [Open API](https://openapis.org/) and displaying these local APIs using [VMware's API Explorer component](http://github.com/vmware/api-explorer/). Open API definitions as declared in the root of the project are displayed as 'local' definitions in the API Explorer.  API Explorer can also display official API definitions provided by VMware at https://code.vmware.com/apis.

## Just Run it
There are nightly builds that publish to Dockerhub that you should be able to just use.  The command below will run the container on your host at port 8080 (you can change this port to whatever works for you.  Can be port 80 as well.)

`docker run --rm --name platypus -p 8080:80 vmware/platypus`

## Migrating from previous versions of Platypus
Previously Platypus required specifying which API you wanted to access in the Swagger UI, and only allowed
using one API at a time.  In this new version all APIs are provided simultaneously with no change to the container.  

If you wish to see only the APIs provided in the Platypus container, click on the 'local' checkbox at the bottom left corner of the page.  If you also wish to see all VMware official API documents that are currently hosted on the BETA https://code.vmware.com/apis site, you can also click 'remote'

#### Build and run

`docker build -t platypus .`

`docker run -p 80:80 platypus`

## Contribution

Have an idea to improve Platypus ?

1. Fork the Platypus
2. Make modifications
3. Open a PR
