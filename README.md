## Project Platypus
![](platypus.jpg)

Platypus is an initiative to improve documentation across a number of VMware's products (see [Supported Products](#supported-products)) as described using [Open API](https://openapis.org/) and displaying these local APIs using [VMware's API Explorer component](http://github.com/vmware/api-explorer/). As configured, Platypus reads all API definitions available at https://code.vmware.com/apis using VMware API web services, but then also adds local definitions 
located in the platypus-api-additions directory.  (see instructions below on how to add others)

## Just Run it
There are nightly builds that publish to Dockerhub that you should be able to just use.  The command below will run the container on your host at port 8080 (you can change this port to whatever works for you.  Can be port 80 as well.)

`docker run --rm --name platypus -p 8080:80 vmware/platypus`

## Migrating from previous versions of Platypus
Previously Platypus required specifying which API you wanted to access in the Swagger UI, and only allowed
using one API at a time.  In this new version all APIs are provided simultaneously with no change to the container.  

If you wish to see only the APIs provided in the Platypus container, click on the 'local' checkbox at the bottom left corner of the page.  If you also wish to see all VMware official API documents that are currently hosted on the BETA https://code.vmware.com/apis site, you can also click 'remote'

## Build and run

```shell
docker build -t platypus .
```

```shell
# run the container on local port 8080
docker run -p 8080:80 platypus
```

## Adding another API
If you have a Swagger file you can add it as another local API definition:
1. Copy the Swagger JSON file into platypus-api-additions (sorry only JSON supported right now).  Note that the 
file needs to start with "api-" and end with ".json".
2. Edit the file platypus-api-additions/local-apis.json and add a new entry for your file.  Format details below.
3. Build the container As above

### local-apis.json schema to add another API

```json
{
    "api_uid": "api_photon_controller", 
    "name": "Photon Controller API", 
    "description": "Type some description for the API here.",
    "products": [
        "Photon Controller;1.1.1"
    ], 
    "resources": {
        "docs": []
    }, 
    "url": "local/swagger/api-photon.json", 
    "version": "1.1.1"
}
```
**api_uid**: This is a VMware specific string id for the API.  You can simply make something up, or you can look at https://https://apigw.vmware.com/v1/m4/api/dcr/rest/apix/apis/uids for a list of currently known supported IDs.  These are used to correlate the API with other documentation and sample code and such on code.vmware.com.
**name**: Human readable name for the API
**description**: what you want to type for this
**products**: This is a list of string names for VMware products that provide this API with a colon and version number optionally.  You can see a list of products at https://apigw.vmware.com/v1/m4/api/dcr/rest/apix/products
**resources**: You can optionally provide links to programming guides and other documentation in this list though the format is a bit cryptic, more documentation to come.
**url**: This is the relative URL from the HTTP root in the container to the swagger reference document.  Note that 
platypus stages all api references at "local/swagger" in the container so this must prepend the file name of the spec
located in the platypus-api-additions folder.
**version**: A version number string for the API itself if any.

## Contribution

Have an idea to improve Platypus ?

1. Fork the Platypus
2. Make modifications
3. Open a PR
