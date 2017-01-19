Unofficial Autodesk License Manager FLEXlm® Network Server container.
=====================================================================
[![Docker Automated buil](https://img.shields.io/docker/automated/haysclark/adlmflexnetserver.svg?maxAge=2592000)](https://hub.docker.com/r/haysclark/adlmflexnetserver/builds/) [![Docker Stars](https://img.shields.io/docker/stars/haysclark/adlmflexnetserver.svg?maxAge=2592000)](https://hub.docker.com/r/haysclark/adlmflexnetserver/) [![license](https://img.shields.io/github/license/mashape/apistatus.svg)]()

A simple Docker container that runs Autodesk License Manager FLEXlm® Network Server.

Usage
-----

    docker run -d -t --mac-address="[LICENSE_MAC_ADDRESS]" \
    -h [LICENSE_HOSTNAME] \
    -v [LOCAL_LICENSE_PATH]:/var/flexlm/adsk_server.lic:ro \
    -p 2080:2080 -p 27000-27009:27000-27009 \
    haysclark/adlmflexnetserver

By default, the container expects to find a FlexLM license here: __/var/flexlm/adsk_server.lic__ and _lmgrd_ with log to this file: __/var/log/flexlm/lmgrd.log__.  Internally, the container is running _lmgrd_ with the following command:

    lmgrd -z -l /var/log/flexlm/lmgrd.log -c /var/flexlm/adsk_server.lic

### Custom Arguments

All additional arguments passed to the container are forwarded to _lmgrd_; however, the default logging and license flags will not be included.

> Note: The container ALWAYS passes the '-z' flag to _lmgrd_ so that it runs in the Foreground. Otherwise, Docker believes the task is over, and the container will 'stop' immediately.

Here is a real world example of overriding the default license path by providing the _-c_ flag and license path.  It's important to understand that _lmgrd_ will not log because the logging flag has been omitted.

    docker run --name flexlm --detach --restart=always \
    --mac-address="12:34:56:ab:cd:ef" \
    -h host_name \
    -v /source/path.lic:/var/flexlm/lic.lic:ro \
    -p 2080:2080 -p 27000-27009:27000-27009 \
    haysclark/adlmflexnetserver \
    -c /var/flexlm/lic.lic

Troubleshooting
---------------
If you are unsure if the server is running correctly, you can log into the container.

    docker exec -it CONTAINER_ID /bin/bash

Once in bash run: 

    lmutil lmstat -a -c [LICENSE_PATH]

Resources
------------
[Official Docs](https://knowledge.autodesk.com/support/maya/downloads/caas/downloads/content/autodesk-network-license-manager-for-linux.html?v=2014)

Supports
----------
Applies to Autodesk Nastran 2015, Autodesk Nastran 2016, Autodesk Nastran 2017, Infrastructure Map Server 2014, Infrastructure Map Server 2015, Infrastructure Map Server 2016, Infrastructure Map Server 2017, Maya 2014, Maya 2015, Maya 2016, Maya 2017, Moldflow Insight 2015, Moldflow Insight 2016, Moldflow Insight 2017, MotionBuilder 2014, MotionBuilder 2015, MotionBuilder 2016, MotionBuilder 2017, Mudbox 2014, Mudbox 2015, Mudbox 2016, Mudbox 2017, Softimage 2014, Softimage 2015, Softimage 2016, VRED Design 2014, and VRED Products 2017