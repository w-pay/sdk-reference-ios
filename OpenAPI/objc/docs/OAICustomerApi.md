# OAICustomerApi

All URIs are relative to *http://localhost:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getCustomerPaymentDetailsByPaymentId**](OAICustomerApi.md#getcustomerpaymentdetailsbypaymentid) | **GET** /customer/payments/{paymentRequestId} | Get Payment Details
[**getCustomerPaymentDetailsByQRCodeId**](OAICustomerApi.md#getcustomerpaymentdetailsbyqrcodeid) | **GET** /customer/qr/{qrId} | Get Payment From QR
[**getCustomerPaymentInstruments**](OAICustomerApi.md#getcustomerpaymentinstruments) | **GET** /customer/instruments | Get Payment Instruments
[**getCustomerPaymentSession**](OAICustomerApi.md#getcustomerpaymentsession) | **GET** /customer/payment/session/{paymentSessionId} | Get Payment Session
[**getCustomerPaymentSessionByQr**](OAICustomerApi.md#getcustomerpaymentsessionbyqr) | **GET** /customer/payment/session/qr/{qrId} | Get Payment Session
[**getCustomerPreferences**](OAICustomerApi.md#getcustomerpreferences) | **GET** /customer/preferences | Get Preferences
[**getCustomerTransactionDetails**](OAICustomerApi.md#getcustomertransactiondetails) | **GET** /customer/transactions/{transactionId} | Get Transaction Details
[**getCustomerTransactions**](OAICustomerApi.md#getcustomertransactions) | **GET** /customer/transactions | Get Transaction List
[**initiatePaymentInstrumentAddition**](OAICustomerApi.md#initiatepaymentinstrumentaddition) | **POST** /customer/instruments | Initiate Instrument Addition
[**makeCustomerPayment**](OAICustomerApi.md#makecustomerpayment) | **PUT** /customer/payments/{paymentRequestId} | Pay Payment
[**setCustomerPreferences**](OAICustomerApi.md#setcustomerpreferences) | **POST** /customer/preferences | Set Preferences
[**updateCustomerPaymentSession**](OAICustomerApi.md#updatecustomerpaymentsession) | **POST** /customer/payment/session/{paymentSessionId} | Update Payment Session


# **getCustomerPaymentDetailsByPaymentId**
```objc
-(NSURLSessionTask*) getCustomerPaymentDetailsByPaymentIdWithXWalletID: (NSString*) xWalletID
    paymentRequestId: (NSString*) paymentRequestId
        completionHandler: (void (^)(OAIGetCustomerPaymentResult* output, NSError* error)) handler;
```

Get Payment Details

Get the details for a specific payment request so that the customer can pay using it

### Example 
```objc
OAIDefaultConfiguration *apiConfig = [OAIDefaultConfiguration sharedConfig];

// Configure API key authorization: (authentication scheme: ApiKeyAuth)
[apiConfig setApiKey:@"YOUR_API_KEY" forApiKeyIdentifier:@"X-Api-Key"];
// Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//[apiConfig setApiKeyPrefix:@"Bearer" forApiKeyIdentifier:@"X-Api-Key"];
// Configure HTTP basic authorization (authentication scheme: bearerAuth)
[apiConfig setUsername:@"YOUR_USERNAME"];
[apiConfig setPassword:@"YOUR_PASSWORD"];


NSString* xWalletID = bb8f86af-9e7b-4659-85d5-346b5e99d500; // 
NSString* paymentRequestId = @"paymentRequestId_example"; // The ID of the specific payment request

OAICustomerApi*apiInstance = [[OAICustomerApi alloc] init];

// Get Payment Details
[apiInstance getCustomerPaymentDetailsByPaymentIdWithXWalletID:xWalletID
              paymentRequestId:paymentRequestId
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
 **xWalletID** | **NSString***|  | 
 **paymentRequestId** | **NSString***| The ID of the specific payment request | 

### Return type

[**OAIGetCustomerPaymentResult***](OAIGetCustomerPaymentResult.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCustomerPaymentDetailsByQRCodeId**
```objc
-(NSURLSessionTask*) getCustomerPaymentDetailsByQRCodeIdWithXWalletID: (NSString*) xWalletID
    qrId: (NSString*) qrId
        completionHandler: (void (^)(OAIGetCustomerPaymentResult* output, NSError* error)) handler;
```

Get Payment From QR

Get the details for a specific payment from a QR Code ID so that the customer can pay using it

### Example 
```objc
OAIDefaultConfiguration *apiConfig = [OAIDefaultConfiguration sharedConfig];

// Configure API key authorization: (authentication scheme: ApiKeyAuth)
[apiConfig setApiKey:@"YOUR_API_KEY" forApiKeyIdentifier:@"X-Api-Key"];
// Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//[apiConfig setApiKeyPrefix:@"Bearer" forApiKeyIdentifier:@"X-Api-Key"];
// Configure HTTP basic authorization (authentication scheme: bearerAuth)
[apiConfig setUsername:@"YOUR_USERNAME"];
[apiConfig setPassword:@"YOUR_PASSWORD"];


NSString* xWalletID = bb8f86af-9e7b-4659-85d5-346b5e99d500; // 
NSString* qrId = @"qrId_example"; // The ID of the specific QR Code

OAICustomerApi*apiInstance = [[OAICustomerApi alloc] init];

// Get Payment From QR
[apiInstance getCustomerPaymentDetailsByQRCodeIdWithXWalletID:xWalletID
              qrId:qrId
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
 **xWalletID** | **NSString***|  | 
 **qrId** | **NSString***| The ID of the specific QR Code | 

### Return type

[**OAIGetCustomerPaymentResult***](OAIGetCustomerPaymentResult.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCustomerPaymentInstruments**
```objc
-(NSURLSessionTask*) getCustomerPaymentInstrumentsWithXWalletID: (NSString*) xWalletID
    xEverdayPayWallet: (NSNumber*) xEverdayPayWallet
        completionHandler: (void (^)(OAIGetCustomerPaymentInstrumentsResults* output, NSError* error)) handler;
```

Get Payment Instruments

Get the list of payment instruments currently configured for the customer.  Returns an array of instrument records that can be used to execute payments

### Example 
```objc
OAIDefaultConfiguration *apiConfig = [OAIDefaultConfiguration sharedConfig];

// Configure API key authorization: (authentication scheme: ApiKeyAuth)
[apiConfig setApiKey:@"YOUR_API_KEY" forApiKeyIdentifier:@"X-Api-Key"];
// Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//[apiConfig setApiKeyPrefix:@"Bearer" forApiKeyIdentifier:@"X-Api-Key"];
// Configure HTTP basic authorization (authentication scheme: bearerAuth)
[apiConfig setUsername:@"YOUR_USERNAME"];
[apiConfig setPassword:@"YOUR_PASSWORD"];


NSString* xWalletID = bb8f86af-9e7b-4659-85d5-346b5e99d500; // 
NSNumber* xEverdayPayWallet = @(NO); // Includes everyday pay wallet in the list of payment instruments (optional) (default to @(NO))

OAICustomerApi*apiInstance = [[OAICustomerApi alloc] init];

// Get Payment Instruments
[apiInstance getCustomerPaymentInstrumentsWithXWalletID:xWalletID
              xEverdayPayWallet:xEverdayPayWallet
          completionHandler: ^(OAIGetCustomerPaymentInstrumentsResults* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling OAICustomerApi->getCustomerPaymentInstruments: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **xWalletID** | **NSString***|  | 
 **xEverdayPayWallet** | **NSNumber***| Includes everyday pay wallet in the list of payment instruments | [optional] [default to @(NO)]

### Return type

[**OAIGetCustomerPaymentInstrumentsResults***](OAIGetCustomerPaymentInstrumentsResults.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCustomerPaymentSession**
```objc
-(NSURLSessionTask*) getCustomerPaymentSessionWithXWalletID: (NSString*) xWalletID
    paymentSessionId: (NSString*) paymentSessionId
        completionHandler: (void (^)(OAICustomerPaymentSessionResult* output, NSError* error)) handler;
```

Get Payment Session

Get the details of a payment session

### Example 
```objc
OAIDefaultConfiguration *apiConfig = [OAIDefaultConfiguration sharedConfig];

// Configure API key authorization: (authentication scheme: ApiKeyAuth)
[apiConfig setApiKey:@"YOUR_API_KEY" forApiKeyIdentifier:@"X-Api-Key"];
// Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//[apiConfig setApiKeyPrefix:@"Bearer" forApiKeyIdentifier:@"X-Api-Key"];
// Configure HTTP basic authorization (authentication scheme: bearerAuth)
[apiConfig setUsername:@"YOUR_USERNAME"];
[apiConfig setPassword:@"YOUR_PASSWORD"];


NSString* xWalletID = bb8f86af-9e7b-4659-85d5-346b5e99d500; // 
NSString* paymentSessionId = @"paymentSessionId_example"; // The ID of the specific payment session to retrieve

OAICustomerApi*apiInstance = [[OAICustomerApi alloc] init];

// Get Payment Session
[apiInstance getCustomerPaymentSessionWithXWalletID:xWalletID
              paymentSessionId:paymentSessionId
          completionHandler: ^(OAICustomerPaymentSessionResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling OAICustomerApi->getCustomerPaymentSession: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **xWalletID** | **NSString***|  | 
 **paymentSessionId** | **NSString***| The ID of the specific payment session to retrieve | 

### Return type

[**OAICustomerPaymentSessionResult***](OAICustomerPaymentSessionResult.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCustomerPaymentSessionByQr**
```objc
-(NSURLSessionTask*) getCustomerPaymentSessionByQrWithXWalletID: (NSString*) xWalletID
    qrId: (NSString*) qrId
        completionHandler: (void (^)(OAICustomerPaymentSessionResult* output, NSError* error)) handler;
```

Get Payment Session

Get the payment session associated with the qrId

### Example 
```objc
OAIDefaultConfiguration *apiConfig = [OAIDefaultConfiguration sharedConfig];

// Configure API key authorization: (authentication scheme: ApiKeyAuth)
[apiConfig setApiKey:@"YOUR_API_KEY" forApiKeyIdentifier:@"X-Api-Key"];
// Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//[apiConfig setApiKeyPrefix:@"Bearer" forApiKeyIdentifier:@"X-Api-Key"];
// Configure HTTP basic authorization (authentication scheme: bearerAuth)
[apiConfig setUsername:@"YOUR_USERNAME"];
[apiConfig setPassword:@"YOUR_PASSWORD"];


NSString* xWalletID = bb8f86af-9e7b-4659-85d5-346b5e99d500; // 
NSString* qrId = @"qrId_example"; // The ID of the qr relating to the payment session

OAICustomerApi*apiInstance = [[OAICustomerApi alloc] init];

// Get Payment Session
[apiInstance getCustomerPaymentSessionByQrWithXWalletID:xWalletID
              qrId:qrId
          completionHandler: ^(OAICustomerPaymentSessionResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling OAICustomerApi->getCustomerPaymentSessionByQr: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **xWalletID** | **NSString***|  | 
 **qrId** | **NSString***| The ID of the qr relating to the payment session | 

### Return type

[**OAICustomerPaymentSessionResult***](OAICustomerPaymentSessionResult.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCustomerPreferences**
```objc
-(NSURLSessionTask*) getCustomerPreferencesWithXWalletID: (NSString*) xWalletID
        completionHandler: (void (^)(OAICustomerPreferencesResult* output, NSError* error)) handler;
```

Get Preferences

Get the preferences previously set by the customer or merchant (depending on calling identity)

### Example 
```objc
OAIDefaultConfiguration *apiConfig = [OAIDefaultConfiguration sharedConfig];

// Configure API key authorization: (authentication scheme: ApiKeyAuth)
[apiConfig setApiKey:@"YOUR_API_KEY" forApiKeyIdentifier:@"X-Api-Key"];
// Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//[apiConfig setApiKeyPrefix:@"Bearer" forApiKeyIdentifier:@"X-Api-Key"];
// Configure HTTP basic authorization (authentication scheme: bearerAuth)
[apiConfig setUsername:@"YOUR_USERNAME"];
[apiConfig setPassword:@"YOUR_PASSWORD"];


NSString* xWalletID = bb8f86af-9e7b-4659-85d5-346b5e99d500; // 

OAICustomerApi*apiInstance = [[OAICustomerApi alloc] init];

// Get Preferences
[apiInstance getCustomerPreferencesWithXWalletID:xWalletID
          completionHandler: ^(OAICustomerPreferencesResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling OAICustomerApi->getCustomerPreferences: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **xWalletID** | **NSString***|  | 

### Return type

[**OAICustomerPreferencesResult***](OAICustomerPreferencesResult.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCustomerTransactionDetails**
```objc
-(NSURLSessionTask*) getCustomerTransactionDetailsWithXWalletID: (NSString*) xWalletID
    transactionId: (NSString*) transactionId
        completionHandler: (void (^)(OAIGetCustomerTransactionDetailsResults* output, NSError* error)) handler;
```

Get Transaction Details

Get the details for a specific transaction previously executed by the customer.  Note that amounts are relative to the merchant.  A positive amount is a positive amount transferred to a merchant

### Example 
```objc
OAIDefaultConfiguration *apiConfig = [OAIDefaultConfiguration sharedConfig];

// Configure API key authorization: (authentication scheme: ApiKeyAuth)
[apiConfig setApiKey:@"YOUR_API_KEY" forApiKeyIdentifier:@"X-Api-Key"];
// Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//[apiConfig setApiKeyPrefix:@"Bearer" forApiKeyIdentifier:@"X-Api-Key"];
// Configure HTTP basic authorization (authentication scheme: bearerAuth)
[apiConfig setUsername:@"YOUR_USERNAME"];
[apiConfig setPassword:@"YOUR_PASSWORD"];


NSString* xWalletID = bb8f86af-9e7b-4659-85d5-346b5e99d500; // 
NSString* transactionId = 75ba5b0b-7e5d-47fe-9508-29ca69fdb1d5; // The ID of the specific transaction

OAICustomerApi*apiInstance = [[OAICustomerApi alloc] init];

// Get Transaction Details
[apiInstance getCustomerTransactionDetailsWithXWalletID:xWalletID
              transactionId:transactionId
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
 **xWalletID** | **NSString***|  | 
 **transactionId** | **NSString***| The ID of the specific transaction | 

### Return type

[**OAIGetCustomerTransactionDetailsResults***](OAIGetCustomerTransactionDetailsResults.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCustomerTransactions**
```objc
-(NSURLSessionTask*) getCustomerTransactionsWithXWalletID: (NSString*) xWalletID
    paymentRequestId: (NSString*) paymentRequestId
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

// Configure API key authorization: (authentication scheme: ApiKeyAuth)
[apiConfig setApiKey:@"YOUR_API_KEY" forApiKeyIdentifier:@"X-Api-Key"];
// Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//[apiConfig setApiKeyPrefix:@"Bearer" forApiKeyIdentifier:@"X-Api-Key"];
// Configure HTTP basic authorization (authentication scheme: bearerAuth)
[apiConfig setUsername:@"YOUR_USERNAME"];
[apiConfig setPassword:@"YOUR_PASSWORD"];


NSString* xWalletID = bb8f86af-9e7b-4659-85d5-346b5e99d500; // 
NSString* paymentRequestId = f27b0189-3449-4215-ab95-31c24e775a48; // If present, limits the list of transactions to those that relate to the payment request (optional)
NSDate* startTime = 2017-11-06T19:38:09.890+11:00; // If present, the date/time to limit transactions returned.  Transactions older than this time will not be returned (optional)
NSDate* endTime = 2017-11-06T19:38:09.890+11:00; // If present, the date/time to limit transactions returned.  Transactions newer than this time will not be returned (optional)
NSNumber* pageSize = @25; // The number of records to return for this page.  Defaults to 25 if absent (optional) (default to @25)
NSNumber* page = @1; // The page of results to return with 1 indicating the first page.  Defaults to 1 if absent (optional) (default to @1)

OAICustomerApi*apiInstance = [[OAICustomerApi alloc] init];

// Get Transaction List
[apiInstance getCustomerTransactionsWithXWalletID:xWalletID
              paymentRequestId:paymentRequestId
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
 **xWalletID** | **NSString***|  | 
 **paymentRequestId** | **NSString***| If present, limits the list of transactions to those that relate to the payment request | [optional] 
 **startTime** | **NSDate***| If present, the date/time to limit transactions returned.  Transactions older than this time will not be returned | [optional] 
 **endTime** | **NSDate***| If present, the date/time to limit transactions returned.  Transactions newer than this time will not be returned | [optional] 
 **pageSize** | **NSNumber***| The number of records to return for this page.  Defaults to 25 if absent | [optional] [default to @25]
 **page** | **NSNumber***| The page of results to return with 1 indicating the first page.  Defaults to 1 if absent | [optional] [default to @1]

### Return type

[**OAIGetCustomerTransactionsResult***](OAIGetCustomerTransactionsResult.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **initiatePaymentInstrumentAddition**
```objc
-(NSURLSessionTask*) initiatePaymentInstrumentAdditionWithXWalletID: (NSString*) xWalletID
    instrumentAdditionDetails: (OAIInstrumentAdditionDetails*) instrumentAdditionDetails
    xEverdayPayWallet: (NSNumber*) xEverdayPayWallet
        completionHandler: (void (^)(OAIInitiatePaymentInstrumentAdditionResults* output, NSError* error)) handler;
```

Initiate Instrument Addition

Initiate the addition of a new payment instrument for this customer.  This API returns a URL to be used to access the DigiPay IFrame based interface to request the customer to enter a payment instrument details.

### Example 
```objc
OAIDefaultConfiguration *apiConfig = [OAIDefaultConfiguration sharedConfig];

// Configure API key authorization: (authentication scheme: ApiKeyAuth)
[apiConfig setApiKey:@"YOUR_API_KEY" forApiKeyIdentifier:@"X-Api-Key"];
// Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//[apiConfig setApiKeyPrefix:@"Bearer" forApiKeyIdentifier:@"X-Api-Key"];
// Configure HTTP basic authorization (authentication scheme: bearerAuth)
[apiConfig setUsername:@"YOUR_USERNAME"];
[apiConfig setPassword:@"YOUR_PASSWORD"];


NSString* xWalletID = bb8f86af-9e7b-4659-85d5-346b5e99d500; // 
OAIInstrumentAdditionDetails* instrumentAdditionDetails = [[OAIInstrumentAdditionDetails alloc] init]; // 
NSNumber* xEverdayPayWallet = @(NO); // The payment instrument should be stored in the everyday pay wallet (optional) (default to @(NO))

OAICustomerApi*apiInstance = [[OAICustomerApi alloc] init];

// Initiate Instrument Addition
[apiInstance initiatePaymentInstrumentAdditionWithXWalletID:xWalletID
              instrumentAdditionDetails:instrumentAdditionDetails
              xEverdayPayWallet:xEverdayPayWallet
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
 **xWalletID** | **NSString***|  | 
 **instrumentAdditionDetails** | [**OAIInstrumentAdditionDetails***](OAIInstrumentAdditionDetails.md)|  | 
 **xEverdayPayWallet** | **NSNumber***| The payment instrument should be stored in the everyday pay wallet | [optional] [default to @(NO)]

### Return type

[**OAIInitiatePaymentInstrumentAdditionResults***](OAIInitiatePaymentInstrumentAdditionResults.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **makeCustomerPayment**
```objc
-(NSURLSessionTask*) makeCustomerPaymentWithXWalletID: (NSString*) xWalletID
    paymentRequestId: (NSString*) paymentRequestId
    customerPaymentDetails: (OAICustomerPaymentDetails*) customerPaymentDetails
    xEverdayPayWallet: (NSNumber*) xEverdayPayWallet
        completionHandler: (void (^)(OAIMakeCustomerPaymentResults* output, NSError* error)) handler;
```

Pay Payment

Pay a specific payment using the instrument details provided

### Example 
```objc
OAIDefaultConfiguration *apiConfig = [OAIDefaultConfiguration sharedConfig];

// Configure API key authorization: (authentication scheme: ApiKeyAuth)
[apiConfig setApiKey:@"YOUR_API_KEY" forApiKeyIdentifier:@"X-Api-Key"];
// Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//[apiConfig setApiKeyPrefix:@"Bearer" forApiKeyIdentifier:@"X-Api-Key"];
// Configure HTTP basic authorization (authentication scheme: bearerAuth)
[apiConfig setUsername:@"YOUR_USERNAME"];
[apiConfig setPassword:@"YOUR_PASSWORD"];


NSString* xWalletID = bb8f86af-9e7b-4659-85d5-346b5e99d500; // 
NSString* paymentRequestId = @"paymentRequestId_example"; // The ID of the specific payment request
OAICustomerPaymentDetails* customerPaymentDetails = [[OAICustomerPaymentDetails alloc] init]; // 
NSNumber* xEverdayPayWallet = @(NO); // The makes instruments available in the everyday pay wallet available for payments (optional) (default to @(NO))

OAICustomerApi*apiInstance = [[OAICustomerApi alloc] init];

// Pay Payment
[apiInstance makeCustomerPaymentWithXWalletID:xWalletID
              paymentRequestId:paymentRequestId
              customerPaymentDetails:customerPaymentDetails
              xEverdayPayWallet:xEverdayPayWallet
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
 **xWalletID** | **NSString***|  | 
 **paymentRequestId** | **NSString***| The ID of the specific payment request | 
 **customerPaymentDetails** | [**OAICustomerPaymentDetails***](OAICustomerPaymentDetails.md)|  | 
 **xEverdayPayWallet** | **NSNumber***| The makes instruments available in the everyday pay wallet available for payments | [optional] [default to @(NO)]

### Return type

[**OAIMakeCustomerPaymentResults***](OAIMakeCustomerPaymentResults.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **setCustomerPreferences**
```objc
-(NSURLSessionTask*) setCustomerPreferencesWithXWalletID: (NSString*) xWalletID
    customerPreferences: (OAICustomerPreferences*) customerPreferences
        completionHandler: (void (^)(NSError* error)) handler;
```

Set Preferences

Change the preferences for the customer or merchant (depending on calling identity)

### Example 
```objc
OAIDefaultConfiguration *apiConfig = [OAIDefaultConfiguration sharedConfig];

// Configure API key authorization: (authentication scheme: ApiKeyAuth)
[apiConfig setApiKey:@"YOUR_API_KEY" forApiKeyIdentifier:@"X-Api-Key"];
// Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//[apiConfig setApiKeyPrefix:@"Bearer" forApiKeyIdentifier:@"X-Api-Key"];
// Configure HTTP basic authorization (authentication scheme: bearerAuth)
[apiConfig setUsername:@"YOUR_USERNAME"];
[apiConfig setPassword:@"YOUR_PASSWORD"];


NSString* xWalletID = bb8f86af-9e7b-4659-85d5-346b5e99d500; // 
OAICustomerPreferences* customerPreferences = [[OAICustomerPreferences alloc] init]; // 

OAICustomerApi*apiInstance = [[OAICustomerApi alloc] init];

// Set Preferences
[apiInstance setCustomerPreferencesWithXWalletID:xWalletID
              customerPreferences:customerPreferences
          completionHandler: ^(NSError* error) {
                        if (error) {
                            NSLog(@"Error calling OAICustomerApi->setCustomerPreferences: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **xWalletID** | **NSString***|  | 
 **customerPreferences** | [**OAICustomerPreferences***](OAICustomerPreferences.md)|  | 

### Return type

void (empty response body)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateCustomerPaymentSession**
```objc
-(NSURLSessionTask*) updateCustomerPaymentSessionWithXWalletID: (NSString*) xWalletID
    paymentSessionId: (NSString*) paymentSessionId
    updatePaymentSessionRequest: (OAIUpdatePaymentSessionRequest*) updatePaymentSessionRequest
        completionHandler: (void (^)(NSError* error)) handler;
```

Update Payment Session

Update the payment session details

### Example 
```objc
OAIDefaultConfiguration *apiConfig = [OAIDefaultConfiguration sharedConfig];

// Configure API key authorization: (authentication scheme: ApiKeyAuth)
[apiConfig setApiKey:@"YOUR_API_KEY" forApiKeyIdentifier:@"X-Api-Key"];
// Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//[apiConfig setApiKeyPrefix:@"Bearer" forApiKeyIdentifier:@"X-Api-Key"];
// Configure HTTP basic authorization (authentication scheme: bearerAuth)
[apiConfig setUsername:@"YOUR_USERNAME"];
[apiConfig setPassword:@"YOUR_PASSWORD"];


NSString* xWalletID = bb8f86af-9e7b-4659-85d5-346b5e99d500; // 
NSString* paymentSessionId = @"paymentSessionId_example"; // The ID of the specific payment session to retrieve
OAIUpdatePaymentSessionRequest* updatePaymentSessionRequest = [[OAIUpdatePaymentSessionRequest alloc] init]; // 

OAICustomerApi*apiInstance = [[OAICustomerApi alloc] init];

// Update Payment Session
[apiInstance updateCustomerPaymentSessionWithXWalletID:xWalletID
              paymentSessionId:paymentSessionId
              updatePaymentSessionRequest:updatePaymentSessionRequest
          completionHandler: ^(NSError* error) {
                        if (error) {
                            NSLog(@"Error calling OAICustomerApi->updateCustomerPaymentSession: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **xWalletID** | **NSString***|  | 
 **paymentSessionId** | **NSString***| The ID of the specific payment session to retrieve | 
 **updatePaymentSessionRequest** | [**OAIUpdatePaymentSessionRequest***](OAIUpdatePaymentSessionRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

