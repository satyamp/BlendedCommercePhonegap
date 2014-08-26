# BlendedCommerce Phonegap App

This is the Phonegap App for our Multimedia Project "Blended Commerce".

## Components used
The app is built using Phonegap. It uses Backbone for communication with
the Database Server and Grunt with Compass, SASS and CoffeeScript for
building as well as bower for frontend packages.

## Installation
First make sure you have node.js installed on your system.

After cloning run:

```
npm install
bower install
```

To setup the project.

## Local Development
To develop without deploying to an actual device run `grunt server`.

The provided `eventsender` script allows you to send fake NFC events to
the app.

## Deploy to device
Run `grunt build && phonegap run android --device` to deploy the app to
a connected Android Device.
