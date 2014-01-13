# selenium-rc #

_selenium-rc_ is a convenient ruby wrapper for the Selenium Standalone Server jar (formerly Selenium RC Server) packaged as a gem. This gem bundles the latest selenium-server-standalone-{version}.jar file and provides a binary and Ruby library to manage it.

### Version ###

The current version of this gem (2.39.0) packages Selenium Standalone Server 2.39.0 - [http://selenium.googlecode.com/files/selenium-server-standalone-2.39.0.jar](http://selenium.googlecode.com/files/selenium-server-standalone-2.39.0.jar)

### Basic Ruby Usage ###

    server = SeleniumRC::Server.boot('localhost')
    #=> Starts a Selenium Server accessible via http://localhost:4444 (the default port)

    server = SeleniumRC::Server.boot('localhost', 8888)
    #=> Starts a Selenium Server accessible via http://localhost:8888

    server = SeleniumRC::Server.boot('localhost', 8888, :args => ["-browserSideLog", "-suppressStupidness"])
    #=> Starts a Selenium Server accessible via http://localhost:8888 and passes arbitrary options to Selenium

    server = SeleniumRC::Server.boot('localhost', 8888, :timeout => 120)
    #=> Starts a Selenium Server accessible via http://localhost:8888 and waits 120 seconds before timing out

    server.stop
    #=> Stops the running Selenium Server

### Basic Command Line Usage ###

    $ selenium-rc
    #=> Starts a Selenium Server on localhost and the default port (4444)

    $ export SELENIUM_SERVER_PORT=8888
    $ selenium-rc
    #=> Starts a Selenium Server on localhost on port 8888

### License ###
This software redistributes the Selenium Standalone Server (selenium-server.jar) in an *unmodified* form.
The Selenium Server is licensed under the [Apache License 2.0](http://www.apache.org/licenses/LICENSE-2.0).

All other software contained within is licensed under the MIT License. See the MIT.LICENSE file in this project for details

### Links & More Info ###

[SeleniumHQ](http://seleniumhq.org/)

[Selenium Project on Google Code](http://code.google.com/p/selenium/)

[Pivotal Labs](http://pivotallabs.com)

Copyright (c) 2010-2011 Pivotal Labs. This software is licensed under the MIT License.
