
The blackbox tests for App Functions SDK are conducted by leveraging the App Service Configurable docker image with the :latest tag which points to master since there hasn't been an official release yet.

The tests leverages a docker profile baked into the docker image with all of the transforms preconfigured so as to easily leverage consul to update values per blackbox test requirements. All tests currently run using Postman.

Tests primarily focus on the following:

- Dynamically updating execution order of the functions
- Dynamically updated parameters of the function transforms
- Various combinations of functions chained together
    - FilterByDeviceName, TransformToXML, SetOutputData
    - FilterByDeviceName, TransformToJSON, SetOutputData
    - FilterByValueDescriptor, TransformToJSON, CompressWithGZIP, SetOutputData
    - FilterByDeviceName, TransformToJSON, CompressWithZLIB, SetOutputData
    - FilterByDeviceName, TransformToXML, CompressWithZLIB, EncryptWithAES, SetOutputData
- Standard Routes (Ping, Metrics, Configuration)
- Consul Integration


As briefly mentioned, Consul is used in between tests to update functions and their parameters. As such, a delay of 500ms between each run is imposed to ensure consul has received it and the App Functions SDK has had enough time to react and update the values appropriately.

The following areas are out of scope as of 8/6/2019 for the blackbox tests. (However, these items are unit tested in the app functions SDK itself.)

- HTTPExport
- MQTTExport
- ZMQIntegration

