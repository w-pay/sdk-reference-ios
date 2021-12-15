# WPay Wallet iOS SDK Reference App

This app is designed to show how to use the WPay APIs and SDKs

(Before WPay was released, the initial version was called "Village". Over time, "Village" will be
removed and replaced)

# Usage

The app shows the usage of the WPay
- [iOS SDK](https://github.com/w-pay/sdk-wpay-ios)
- [iOS Frames SDK](https://github.com/w-pay/sdk-wpay-ios-frames/)

The workflow the app demonstrates is the creation of a payment request by a given merchant, and
allowing a customer to make a payment. When the customer makes the payment they have the option
to use a preexisting card in their wallet, or capture a new credit card using the WPay Frames
API/SDKs.

The settings screen allows for different settings to be applied such as which merchant to use,
customer details and payment details.

The second screen allows the management of payment instruments and the making of a payment.

## Places of interest

The `PaymentDetails` screen is the most interesting for new developers. It contains the 
orchestration logic for capturing cards (including 3DS challenges), making payments, etc.

The `AppDelegate` holds the logic for the initial SDK instantiation and payment request creation.

## Building

This project can be used with [Cocoa Pods](https://cocoapods.org/)

```bash
$ sudo gem install cocoapods
$ pod install
```

Open the workspace in XCode/[AppCode](https://www.jetbrains.com/objc/) and run the app.