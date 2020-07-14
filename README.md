# Woolies Village iOS Reference

Reference application for Woolies Village iOS SDK.

## Building

This project uses [Cocoa Pods](https://cocoapods.org/)

```bash
$ sudo gem install cocoapods
$ pod install
```

Open the workspace in XCode/App Code.

## Usage

During initial development the SDK will be a a folder within this project as colocation
facilitates easier iterative development. When the SDK is stabilised it will be extracted as a
separate project.

The SDK module comprises:
 - An adaption layer between the application and the API.
 - An API layer which knows how to communicate with the Village API.
 - An authentication layer.

Consumers have the flexibility to plug in different implementations of
the interfaces to allow particular technology choices (eg: choice of
HTTP client library). This makes it very easy to use the SDK in an
existing project, without necessarily introducing extra dependencies.

The entry point for consumers is the `Village` class.

#### Open API implementation

The SDK comes with an implementation of the `VillageApiRepository`
that uses the [Open API generator](https://openapi-generator.tech/) to
provide an API Client with DTOs representing the data structures of the
API. The SDK can be configured to use different libraries that the Open
API generator supports to again make it easier to embed into an existing
project with existing technology choices.

The use of an Open API implementation is a compile time choice as the
relevant libraries will all need to be included. It is not recommended to
try to use multiple implementations in the one build/app.

The current Open API implementations are:
 - `okhttp-gson` - Uses the [OkHttp](https://square.github.io/okhttp/)
     framework with [GSON](https://github.com/google/gson) for JSON
     (de)serialisation.
 - `objc` - Generates a SDK for use in an XCode project.

Each implementation's README contains more details on how to use the
API client, however the implementations follow a naming pattern so
that it's easy to swap variants if required.

##### Versioning

Open API implementations follow the same versioning scheme as the Village API spec.
So if the API is at `x.y.z` the implementation will be version `x.y.z.b` where `b`
is the build number. The build number allows for implementation changes
to be versioned that don't require a version bump to the spec because the
interface hasn't changed.

#### Generating an Open API implementation

Currently the script to generate an Open API implementation exists in the
[Android project](https://github.com/woolworthslimited/paysdk2-android)
as it is a Gradle task. See it's README for further details.

### Testing

TODO: Flesh out when tests added.

## Reference Application

Included in this repo is a sample reference application showing portions of the SDK in action.
The entry point into the app is the `PaymentConfirmViewController` which holds an instance
of the `Village` API.

The reference application is designed to make a payment to a merchant with the details of the
payment request to be loaded from a QR Code.

In order to retrieve the payment request details, the payment instruments and to actually make
a payment, the applications demonstrates the use of Bearer tokens to access the API.

### Using the app

The app is designed to have the user use the Camera app scan the QR Code and have the
codes contents passed to the Reference App. However this relies on
[Universal Linking](https://developer.apple.com/library/archive/documentation/General/Conceptual/AppSearch/UniversalLinks.html)
to be available. As of yet, the `apple-app-site-association` configuration has yet to 
be deployed. The current sample configuration in this repo is linked by Team ID to
Kieran Simpson (kieran@redcrew.com.au).

Until Universal Linking is available, users of the reference application will need to
update the hardcoded host and QR Code ID details to run the app, and exercise the workflow.

#### Using Postman to create a Payment Request

In order to use the app, a merchant has to create the Payment Request for a basket of goods.
The Postman collection in this repo can be used to make API calls to the Village "Merchant" API
to simulate a merchant. To use the collection, import both the collection and the environment details
into Postman. The collection is parameterised so it can be used against different environments.

Once the Payment Request has been created, the QR code can be retrieved as an image
(for use with a camera) or the QR code ID from the "Create Payment Request" response
can be copied into the app and the app run (use the FIXME markers as a guide for where
to update the code)