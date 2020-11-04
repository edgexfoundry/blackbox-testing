# Blackbox Testing against Edgexfoundry Snap

This file contains instructions for how to run the blackbox-tests against the EdgeX Foundry snaps edgexfoundry and edgex-app-service-configurable that are both available from the Snap Store (https://snapcraft.io/store).

Step 1: Setup environment variable

Locate the env.sh file at the following path

**/bin/env.sh**

Uncomment the following environment variable

**export TEST_ENV=localhost**

If you wish to use different channels for edgexfoundry and/or app-service-configurable then navigate to the deploy-edgeX-snaps.sh file 
and uncomment the following environment variables and append the required value 

**export EF_CHANNEL=**

**export ASC_CHANNEL=**

You can also use locally built snaps of either edgexfoundry and/or app-service-configurable by specifying the following environment variables

**export EF_SNAP=path_to_snap**

**export ASC_SNAP=path_to_snap**

Replace path_to_snap with an absolute path to each snap respectively.

Note, if both ASC_CHANNEL and ASC_SNAP variables are exported then ASC_SNAP will take precedence and ASC_CHANNEL will be ignored.  
This logic is also true for EF_CHANNEL and EF_SNAP.

If you wish to run the tests with security than set the following environment variable:

**export SECURITY_SERVICE_NEEDED=true**

Once you have set the environment variables, save the file. Navigate back to the root directory of the project and run the following bash command

**. bin/env.sh**

Step 2: Deploy test environment

Run the following script

**./deploy-edgeX-snaps.sh**

The above script will install the appropriate snaps and enable the services needed for testing.

Step 3: Execute blackbox tests:

**./bin/run.sh -all** 

The above **-all** flag executes all tests

Note you can run individual tests using different flags, however, it has been determined that the tests have to run in a specific sequence in order to ensure no assertions fail. The exact sequence is as follows:

**-dv** = deviceVirtualTest

**-asc** = appServiceConfigurableTest

**-cd** = coreDataTest

**-co** = commandTest

**-md** = metaDataTest

**-sn** = supportNotificationTest

**-sys** = supportSchedulerTest

