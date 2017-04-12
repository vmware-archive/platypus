/*
 * Copyright (c) 2016 VMware, Inc. All Rights Reserved.
 * This software is released under MIT license.
 * The full license information can be found in LICENSE in the root directory of this project.
 */
(function (window) {
  window.config = window.config || {};

  // Whether or not to enable debug mode
  // Setting this to false will disable console output
  window.config.enableDebug = false;
  
  // Whether or not to enable local APIs
  window.config.enableLocal = true;
    
  // local APIs endpoint
  window.config.localApiEndPoint = "local.json";
  
  // Whether or not to enable remote APIs and resources
  window.config.enableRemote = true;

  // default filtering to apply to the window after the initial load is done.  This is different
  // from enablinh remote or local as well a productCatalog because it is possible for the user to
  //change the selection after page load
  window.config.defaultFilters = {
      keywords : "",
      products : [],
      languages: [],
      types: [],
      sources: []
  };
  
  // Product catalog: if specified, only the products in the list are added to the GUI irrespective of
  // any selection that the user makes.  If you only ever want a subset of products available this is the
  // option to use.  If however you want to have DEFAULT selections and be able to change them, you should
  // instead use the defaultFilters.
  // Available values are: vSphere, NSX, vCenter Server, vCloud Air, vCloud Suite, Virtual SAN, vRealize Suite
  //window.config.productCatalog = "vRealize Automation";
  
  // Remote APIs endpoint.  
  window.config.remoteSampleExchangeApiEndPoint = "https://apigw.vmware.com/sampleExchange/v1";
  window.config.remoteApiEndPoint = "https://vdc-repo.vmware.com/apix";

}(this));
