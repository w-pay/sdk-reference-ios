# OAICustomerApi

All URIs are relative to *http://localhost:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getCustomerPaymentDetailsByPaymentId**](OAICustomerApi.md#getcustomerpaymentdetailsbypaymentid) | **GET** /customer/payments/{paymentRequestId} | Get Payment Details
[**getCustomerPaymentDetailsByQRCodeId**](OAICustomerApi.md#getcustomerpaymentdetailsbyqrcodeid) | **GET** /customer/qr/{qrId} | Get Payment From QR
[**getCustomerPaymentInstruments**](OAICustomerApi.md#getcustomerpaymentinstruments) | **GET** /customer/instruments | Get Payment Instruments
[**getCustomerPreferences**](OAICustomerApi.md#getcustomerpreferences) | **GET** /customer/preferences | Get Preferences
[**getCustomerTransactionDetails**](OAICustomerApi.md#getcustomertransactiondetails) | **GET** /customer/transactions/{transactionId} | Get Transaction Details
[**getCustomerTransactions**](OAICustomerApi.md#getcustomertransactions) | **GET** /customer/transactions | Get Transaction List
[**initiatePaymentInstrumentAddition**](OAICustomerApi.md#initiatepaymentinstrumentaddition) | **POST** /customer/instruments | Initiate Instrument Addition
[**makeCustomerPayment**](OAICustomerApi.md#makecustomerpayment) | **PUT** /customer/payments/{paymentRequestId} | Pay Payment
[**setCustomerPreferences**](OAICustomerApi.md#setcustomerpreferences) | **POST** /customer/preferences | Set Preferences


# **getCustomerPaymentDetailsByPaymentId**
```objc
-(NSURLSessionTask*) getCustomerPaymentDetailsByPaymentIdWithPaymentRequestId: (NSString*) paymentRequestId
        completionHandler: (void (^)(OAIGetCustomerPaymentResult* output, NSError* error)) handler;
```

Get Payment Details

Get the details for a specific payment request so that the customer can pay using it

### Example 
```objc
OAIDefaultConfiguration *apiConfig = [OAIDefaultConfiguration sharedConfig];
// Configure HTTP basic authorization (authentication scheme: bearerAuth)
[apiConfig setUsername:@"YOUR_USERNAME"];
[apiConfig setPassword:@"YOUR_PASSWORD"];


NSString* paymentRequestId = @"paymentRequestId_example"; // The ID of the specific payment request

OAICustomerApi*apiInstance = [[OAICustomerApi alloc] init];

// Get Payment Details
[apiInstance getCustomerPaymentDetailsByPaymentIdWithPaymentRequestId:paymentRequestId
          completionHandler: ^(OAIGetCustomerPaymentResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling OAICustomerApi->getCustomerPaymentDetailsByPaymentId: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **paymentRequestId** | **NSString***| The ID of the specific payment request | 

### Return type

[**OAIGetCustomerPaymentResult***](OAIGetCustomerPaymentResult.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCustomerPaymentDetailsByQRCodeId**
```objc
-(NSURLSessionTask*) getCustomerPaymentDetailsByQRCodeIdWithQrId: (NSString*) qrId
        completionHandler: (void (^)(OAIGetCustomerPaymentResult* output, NSError* error)) handler;
```

Get Payment From QR

Get the details for a specific payment from a QR Code ID so that the customer can pay using it

### Example 
```objc
OAIDefaultConfiguration *apiConfig = [OAIDefaultConfiguration sharedConfig];
// Configure HTTP basic authorization (authentication scheme: bearerAuth)
[apiConfig setUsername:@"YOUR_USERNAME"];
[apiConfig setPassword:@"YOUR_PASSWORD"];


NSString* qrId = @"qrId_example"; // The ID of the specific QR Code

OAICustomerApi*apiInstance = [[OAICustomerApi alloc] init];

// Get Payment From QR
[apiInstance getCustomerPaymentDetailsByQRCodeIdWithQrId:qrId
          completionHandler: ^(OAIGetCustomerPaymentResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling OAICustomerApi->getCustomerPaymentDetailsByQRCodeId: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **qrId** | **NSString***| The ID of the specific QR Code | 

### Return type

[**OAIGetCustomerPaymentResult***](OAIGetCustomerPaymentResult.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCustomerPaymentInstruments**
```objc
-(NSURLSessionTask*) getCustomerPaymentInstrumentsWithCompletionHandler: 
        (void (^)(OAIGetCustomerPaymentInstrumentsResults* output, NSError* error)) handler;
```

Get Payment Instruments

Get the list of payment instruments currently configured for the customer.  Returns an array of instrument records that can be used to execute payments

### Example 
```objc
OAIDefaultConfiguration *apiConfig = [OAIDefaultConfiguration sharedConfig];
// Configure HTTP basic authorization (authentication scheme: bearerAuth)
[apiConfig setUsername:@"YOUR_USERNAME"];
[apiConfig setPassword:@"YOUR_PASSWORD"];



OAICustomerApi*apiInstance = [[OAICustomerApi alloc] init];

// Get Payment Instruments
[apiInstance getCustomerPaymentInstrumentsWithCompletionHandler: 
          ^(OAIGetCustomerPaymentInstrumentsResults* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling OAICustomerApi->getCustomerPaymentInstruments: %@", error);
                        }
                    }];
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**OAIGetCustomerPaymentInstrumentsResults***](OAIGetCustomerPaymentInstrumentsResults.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCustomerPreferences**
```objc
-(NSURLSessionTask*) getCustomerPreferencesWithCompletionHandler: 
        (void (^)(OAICustomerPreferencesResult* output, NSError* error)) handler;
```

Get Preferences

Get the preferences previously set by the customer or merchant (depending on calling identity)

### Example 
```objc
OAIDefaultConfiguration *apiConfig = [OAIDefaultConfiguration sharedConfig];
// Configure HTTP basic authorization (authentication scheme: bearerAuth)
[apiConfig setUsername:@"YOUR_USERNAME"];
[apiConfig setPassword:@"YOUR_PASSWORD"];



OAICustomerApi*apiInstance = [[OAICustomerApi alloc] init];

// Get Preferences
[apiInstance getCustomerPreferencesWithCompletionHandler: 
          ^(OAICustomerPreferencesResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling OAICustomerApi->getCustomerPreferences: %@", error);
                        }
                    }];
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**OAICustomerPreferencesResult***](OAICustomerPreferencesResult.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCustomerTransactionDetails**
```objc
-(NSURLSessionTask*) getCustomerTransactionDetailsWithTransactionId: (NSString*) transactionId
        completionHandler: (void (^)(OAIGetCustomerTransactionDetailsResults* output, NSError* error)) handler;
```

Get Transaction Details

Get the details for a specific transaction previously executed by the customer.  Note that amounts are relative to the merchant.  A positive amount is a positive amount transferred to a merchant

### Example 
```objc
OAIDefaultConfiguration *apiConfig = [OAIDefaultConfiguration sharedConfig];
// Configure HTTP basic authorization (authentication scheme: bearerAuth)
[apiConfig setUsername:@"YOUR_USERNAME"];
[apiConfig setPassword:@"YOUR_PASSWORD"];


NSString* transactionId = 75ba5b0b-7e5d-47fe-9508-29ca69fdb1d5; // The ID of the specific transaction

OAICustomerApi*apiInstance = [[OAICustomerApi alloc] init];

// Get Transaction Details
[apiInstance getCustomerTransactionDetailsWithTransactionId:transactionId
          completionHandler: ^(OAIGetCustomerTransactionDetailsResults* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling OAICustomerApi->getCustomerTransactionDetails: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **transactionId** | **NSString***| The ID of the specific transaction | 

### Return type

[**OAIGetCustomerTransactionDetailsResults***](OAIGetCustomerTransactionDetailsResults.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCustomerTransactions**
```objc
-(NSURLSessionTask*) getCustomerTransactionsWithPaymentRequestId: (NSString*) paymentRequestId
    startTime: (NSDate*) startTime
    endTime: (NSDate*) endTime
    pageSize: (NSNumber*) pageSize
    page: (NSNumber*) page
        completionHandler: (void (^)(OAIGetCustomerTransactionsResult* output, NSError* error)) handler;
```

Get Transaction List

Get a list of the previously executed transactions for the customer.  Note that amounts are relative to the merchant.  A positive amount is a positive amount transferred to a merchant

### Example 
```objc
OAIDefaultConfiguration *apiConfig = [OAIDefaultConfiguration sharedConfig];
// Configure HTTP basic authorization (authentication scheme: bearerAuth)
[apiConfig setUsername:@"YOUR_USERNAME"];
[apiConfig setPassword:@"YOUR_PASSWORD"];


NSString* paymentRequestId = f27b0189-3449-4215-ab95-31c24e775a48; // If present, limits the list of transactions to those that relate to the payment request (optional)
NSDate* startTime = 2017-11-06T19:38:09.890+11:00; // If present, the date/time to limit transactions returned.  Transactions older than this time will not be returned (optional)
NSDate* endTime = 2017-11-06T19:38:09.890+11:00; // If present, the date/time to limit transactions returned.  Transactions newer than this time will not be returned (optional)
NSNumber* pageSize = @25; // The number of records to return for this page.  Defaults to 25 if absent (optional) (default to @25)
NSNumber* page = @1; // The page of results to return with 1 indicating the first page.  Defaults to 1 if absent (optional) (default to @1)

OAICustomerApi*apiInstance = [[OAICustomerApi alloc] init];

// Get Transaction List
[apiInstance getCustomerTransactionsWithPaymentRequestId:paymentRequestId
              startTime:startTime
              endTime:endTime
              pageSize:pageSize
              page:page
          completionHandler: ^(OAIGetCustomerTransactionsResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling OAICustomerApi->getCustomerTransactions: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **paymentRequestId** | **NSString***| If present, limits the list of transactions to those that relate to the payment request | [optional] 
 **startTime** | **NSDate***| If present, the date/time to limit transactions returned.  Transactions older than this time will not be returned | [optional] 
 **endTime** | **NSDate***| If present, the date/time to limit transactions returned.  Transactions newer than this time will not be returned | [optional] 
 **pageSize** | **NSNumber***| The number of records to return for this page.  Defaults to 25 if absent | [optional] [default to @25]
 **page** | **NSNumber***| The page of results to return with 1 indicating the first page.  Defaults to 1 if absent | [optional] [default to @1]

### Return type

[**OAIGetCustomerTransactionsResult***](OAIGetCustomerTransactionsResult.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **initiatePaymentInstrumentAddition**
```objc
-(NSURLSessionTask*) initiatePaymentInstrumentAdditionWithInstrumentAdditionDetails: (OAIInstrumentAdditionDetails*) instrumentAdditionDetails
        completionHandler: (void (^)(OAIInitiatePaymentInstrumentAdditionResults* output, NSError* error)) handler;
```

Initiate Instrument Addition

Initiate the addition of a new payment instrument for this customer.  This API returns a URL to be used to access the DigiPay IFrame based interface to request the customer to enter a payment instrument details.

### Example 
```objc
OAIDefaultConfiguration *apiConfig = [OAIDefaultConfiguration sharedConfig];
// Configure HTTP basic authorization (authentication scheme: bearerAuth)
[apiConfig setUsername:@"YOUR_USERNAME"];
[apiConfig setPassword:@"YOUR_PASSWORD"];


OAIInstrumentAdditionDetails* instrumentAdditionDetails = [[OAIInstrumentAdditionDetails alloc] init]; // 

OAICustomerApi*apiInstance = [[OAICustomerApi alloc] init];

// Initiate Instrument Addition
[apiInstance initiatePaymentInstrumentAdditionWithInstrumentAdditionDetails:instrumentAdditionDetails
          completionHandler: ^(OAIInitiatePaymentInstrumentAdditionResults* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling OAICustomerApi->initiatePaymentInstrumentAddition: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **instrumentAdditionDetails** | [**OAIInstrumentAdditionDetails***](OAIInstrumentAdditionDetails.md)|  | 

### Return type

[**OAIInitiatePaymentInstrumentAdditionResults***](OAIInitiatePaymentInstrumentAdditionResults.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **makeCustomerPayment**
```objc
-(NSURLSessionTask*) makeCustomerPaymentWithPaymentRequestId: (NSString*) paymentRequestId
    customerPaymentDetails: (OAICustomerPaymentDetails*) customerPaymentDetails
        completionHandler: (void (^)(OAIMakeCustomerPaymentResults* output, NSError* error)) handler;
```

Pay Payment

Pay a specific payment using the instrument details provided

### Example 
```objc
OAIDefaultConfiguration *apiConfig = [OAIDefaultConfiguration sharedConfig];
// Configure HTTP basic authorization (authentication scheme: bearerAuth)
[apiConfig setUsername:@"YOUR_USERNAME"];
[apiConfig setPassword:@"YOUR_PASSWORD"];


NSString* paymentRequestId = @"paymentRequestId_example"; // The ID of the specific payment request
OAICustomerPaymentDetails* customerPaymentDetails = [[OAICustomerPaymentDetails alloc] init]; // 

OAICustomerApi*apiInstance = [[OAICustomerApi alloc] init];

// Pay Payment
[apiInstance makeCustomerPaymentWithPaymentRequestId:paymentRequestId
              customerPaymentDetails:customerPaymentDetails
          completionHandler: ^(OAIMakeCustomerPaymentResults* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling OAICustomerApi->makeCustomerPayment: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **paymentRequestId** | **NSString***| The ID of the specific payment request | 
 **customerPaymentDetails** | [**OAICustomerPaymentDetails***](OAICustomerPaymentDetails.md)|  | 

### Return type

[**OAIMakeCustomerPaymentResults***](OAIMakeCustomerPaymentResults.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **setCustomerPreferences**
```objc
-(NSURLSessionTask*) setCustomerPreferencesWithCustomerPreferences: (OAICustomerPreferences*) customerPreferences
        completionHandler: (void (^)(NSError* error)) handler;
```

Set Preferences

Change the preferences for the customer or merchant (depending on calling identity)

### Example 
```objc
OAIDefaultConfiguration *apiConfig = [OAIDefaultConfiguration sharedConfig];
// Configure HTTP basic authorization (authentication scheme: bearerAuth)
[apiConfig setUsername:@"YOUR_USERNAME"];
[apiConfig setPassword:@"YOUR_PASSWORD"];


OAICustomerPreferences* customerPreferences = [[OAICustomerPreferences alloc] init]; // 

OAICustomerApi*apiInstance = [[OAICustomerApi alloc] init];

// Set Preferences
[apiInstance setCustomerPreferencesWithCustomerPreferences:customerPreferences
          completionHandler: ^(NSError* error) {
                        if (error) {
                            NSLog(@"Error calling OAICustomerApi->setCustomerPreferences: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **customerPreferences** | [**OAICustomerPreferences***](OAICustomerPreferences.md)|  | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

