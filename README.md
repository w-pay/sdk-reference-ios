# Woolies Village Wallet iOS SDK Reference App

This app show cases the use of the Village Customer APIs.

# Usage

The reference application is designed to make a payment to a merchant with the details of the
`Payment Request` to be loaded from a QR Code.

In order to retrieve the `Payment Request` details, the `Payment Instruments` and to actually make
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

In order to use the app, a merchant has to create the `Payment Request` for a basket of goods.
The Postman collection in this repo can be used to make API calls to the Village "Merchant" API
to simulate a merchant. To use the collection, import both the collection and the environment details
into Postman. The collection is parameterised so it can be used against different environments.

In order to create a `Payment Request` the `Create Payment Request` request
in the Postman collection can be used. To get the QR code (as an image)
for the `Payment Request` the collection's `Get QR Code` request can be used
(with the `qrId` from the `Create Payment Request` response).

Once the Payment Request has been created, the QR code can be retrieved as an image
(for use with a camera) or the QR code ID from the "Create Payment Request" response
can be copied into the app and the app run (use the FIXME markers as a guide for where
to update the code)

## Building

This project can be used with [Cocoa Pods](https://cocoapods.org/)

```bash
$ sudo gem install cocoapods
$ pod install
```

Open the workspace in XCode/[AppCode](https://www.jetbrains.com/objc/).