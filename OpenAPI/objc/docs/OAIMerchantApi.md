# OAIMerchantApi

All URIs are relative to *http://localhost:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**cancelPaymentQRCode**](OAIMerchantApi.md#cancelpaymentqrcode) | **DELETE** /merchant/qr/{qrId} | Invalidate QR Code
[**createMerchantSchema**](OAIMerchantApi.md#createmerchantschema) | **POST** /merchant/schema | Add Schema
[**createPaymentQRCode**](OAIMerchantApi.md#createpaymentqrcode) | **POST** /merchant/qr | Create QR Code
[**createPaymentRequest**](OAIMerchantApi.md#createpaymentrequest) | **POST** /merchant/payments | Create Payment
[**deleteMerchantPayment**](OAIMerchantApi.md#deletemerchantpayment) | **DELETE** /merchant/payments/{paymentRequestId} | Delete Payment
[**getMerchantPaymentDetails**](OAIMerchantApi.md#getmerchantpaymentdetails) | **GET** /merchant/payments/{paymentRequestId} | Get Payment Details
[**getMerchantPayments**](OAIMerchantApi.md#getmerchantpayments) | **GET** /merchant/payments | Get Payment List
[**getMerchantPreferences**](OAIMerchantApi.md#getmerchantpreferences) | **GET** /merchant/preferences | Get Preferences
[**getMerchantSchemaDetails**](OAIMerchantApi.md#getmerchantschemadetails) | **GET** /merchant/schema/{schemaId} | Get Schema Details
[**getMerchantSchemas**](OAIMerchantApi.md#getmerchantschemas) | **GET** /merchant/schema | Get Schema List
[**getMerchantTransactionDetails**](OAIMerchantApi.md#getmerchanttransactiondetails) | **GET** /merchant/transactions/{transactionId} | Get Transaction Details
[**getMerchantTransactions**](OAIMerchantApi.md#getmerchanttransactions) | **GET** /merchant/transactions | Get Transaction List
[**getPaymentQRCodeContent**](OAIMerchantApi.md#getpaymentqrcodecontent) | **GET** /merchant/qr/{qrId} | Get QR Code Content
[**refundMerchantTransaction**](OAIMerchantApi.md#refundmerchanttransaction) | **POST** /merchant/transactions/{transactionId}/refund | Refund Transaction
[**setMerchantPreferences**](OAIMerchantApi.md#setmerchantpreferences) | **POST** /merchant/preferences | Set Preferences


# **cancelPaymentQRCode**
```objc
-(NSURLSessionTask*) cancelPaymentQRCodeWithQrId: (NSString*) qrId
        completionHandler: (void (^)(NSError* error)) handler;
```

Invalidate QR Code

Cancel an existing QC code.  Effectively expires the QR code

### Example 
```objc
OAIDefaultConfiguration *apiConfig = [OAIDefaultConfiguration sharedConfig];
// Configure HTTP basic authorization (authentication scheme: bearerAuth)
[apiConfig setUsername:@"YOUR_USERNAME"];
[apiConfig setPassword:@"YOUR_PASSWORD"];


NSString* qrId = dca8edc5-bbb7-44c0-8056-a5daf4327601; // The ID of the specific QR Code

OAIMerchantApi*apiInstance = [[OAIMerchantApi alloc] init];

// Invalidate QR Code
[apiInstance cancelPaymentQRCodeWithQrId:qrId
          completionHandler: ^(NSError* error) {
                        if (error) {
                            NSLog(@"Error calling OAIMerchantApi->cancelPaymentQRCode: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **qrId** | **NSString***| The ID of the specific QR Code | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createMerchantSchema**
```objc
-(NSURLSessionTask*) createMerchantSchemaWithMerchantSchema: (OAIMerchantSchema*) merchantSchema
        completionHandler: (void (^)(OAICreateMerchantSchemaResults* output, NSError* error)) handler;
```

Add Schema

Add a new schema that can be used in schema based payloads for this merchant

### Example 
```objc
OAIDefaultConfiguration *apiConfig = [OAIDefaultConfiguration sharedConfig];
// Configure HTTP basic authorization (authentication scheme: bearerAuth)
[apiConfig setUsername:@"YOUR_USERNAME"];
[apiConfig setPassword:@"YOUR_PASSWORD"];


OAIMerchantSchema* merchantSchema = [[OAIMerchantSchema alloc] init]; // 

OAIMerchantApi*apiInstance = [[OAIMerchantApi alloc] init];

// Add Schema
[apiInstance createMerchantSchemaWithMerchantSchema:merchantSchema
          completionHandler: ^(OAICreateMerchantSchemaResults* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling OAIMerchantApi->createMerchantSchema: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **merchantSchema** | [**OAIMerchantSchema***](OAIMerchantSchema.md)|  | 

### Return type

[**OAICreateMerchantSchemaResults***](OAICreateMerchantSchemaResults.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createPaymentQRCode**
```objc
-(NSURLSessionTask*) createPaymentQRCodeWithPaymentQRCodeDetails: (OAIPaymentQRCodeDetails*) paymentQRCodeDetails
        completionHandler: (void (^)(OAICreatePaymentQRCodeResults* output, NSError* error)) handler;
```

Create QR Code

Create a new QR code for an existing payment

### Example 
```objc
OAIDefaultConfiguration *apiConfig = [OAIDefaultConfiguration sharedConfig];
// Configure HTTP basic authorization (authentication scheme: bearerAuth)
[apiConfig setUsername:@"YOUR_USERNAME"];
[apiConfig setPassword:@"YOUR_PASSWORD"];


OAIPaymentQRCodeDetails* paymentQRCodeDetails = [[OAIPaymentQRCodeDetails alloc] init]; // 

OAIMerchantApi*apiInstance = [[OAIMerchantApi alloc] init];

// Create QR Code
[apiInstance createPaymentQRCodeWithPaymentQRCodeDetails:paymentQRCodeDetails
          completionHandler: ^(OAICreatePaymentQRCodeResults* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling OAIMerchantApi->createPaymentQRCode: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **paymentQRCodeDetails** | [**OAIPaymentQRCodeDetails***](OAIPaymentQRCodeDetails.md)|  | 

### Return type

[**OAICreatePaymentQRCodeResults***](OAICreatePaymentQRCodeResults.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createPaymentRequest**
```objc
-(NSURLSessionTask*) createPaymentRequestWithMerchantPaymentRequest: (OAIMerchantPaymentRequest*) merchantPaymentRequest
        completionHandler: (void (^)(OAICreatePaymentRequestResults* output, NSError* error)) handler;
```

Create Payment

Create a new payment request that can then be presented to a customer for payment

### Example 
```objc
OAIDefaultConfiguration *apiConfig = [OAIDefaultConfiguration sharedConfig];
// Configure HTTP basic authorization (authentication scheme: bearerAuth)
[apiConfig setUsername:@"YOUR_USERNAME"];
[apiConfig setPassword:@"YOUR_PASSWORD"];


OAIMerchantPaymentRequest* merchantPaymentRequest = [[OAIMerchantPaymentRequest alloc] init]; // 

OAIMerchantApi*apiInstance = [[OAIMerchantApi alloc] init];

// Create Payment
[apiInstance createPaymentRequestWithMerchantPaymentRequest:merchantPaymentRequest
          completionHandler: ^(OAICreatePaymentRequestResults* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling OAIMerchantApi->createPaymentRequest: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **merchantPaymentRequest** | [**OAIMerchantPaymentRequest***](OAIMerchantPaymentRequest.md)|  | 

### Return type

[**OAICreatePaymentRequestResults***](OAICreatePaymentRequestResults.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteMerchantPayment**
```objc
-(NSURLSessionTask*) deleteMerchantPaymentWithPaymentRequestId: (NSString*) paymentRequestId
        completionHandler: (void (^)(NSError* error)) handler;
```

Delete Payment

Cancel an existing payment by setting the expiration date/time to now and setting the remaining uses to 0.  Will only be successful if the payment is still pending.  Completed payments need to be refunded using the dedicated API for that purpose

### Example 
```objc
OAIDefaultConfiguration *apiConfig = [OAIDefaultConfiguration sharedConfig];
// Configure HTTP basic authorization (authentication scheme: bearerAuth)
[apiConfig setUsername:@"YOUR_USERNAME"];
[apiConfig setPassword:@"YOUR_PASSWORD"];


NSString* paymentRequestId = @"paymentRequestId_example"; // The ID of the specific payment request

OAIMerchantApi*apiInstance = [[OAIMerchantApi alloc] init];

// Delete Payment
[apiInstance deleteMerchantPaymentWithPaymentRequestId:paymentRequestId
          completionHandler: ^(NSError* error) {
                        if (error) {
                            NSLog(@"Error calling OAIMerchantApi->deleteMerchantPayment: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **paymentRequestId** | **NSString***| The ID of the specific payment request | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMerchantPaymentDetails**
```objc
-(NSURLSessionTask*) getMerchantPaymentDetailsWithPaymentRequestId: (NSString*) paymentRequestId
        completionHandler: (void (^)(OAIGetMerchantPaymentDetailsResults* output, NSError* error)) handler;
```

Get Payment Details

Get the details for a specific payment.  Provides all types of payments and all payment content

### Example 
```objc
OAIDefaultConfiguration *apiConfig = [OAIDefaultConfiguration sharedConfig];
// Configure HTTP basic authorization (authentication scheme: bearerAuth)
[apiConfig setUsername:@"YOUR_USERNAME"];
[apiConfig setPassword:@"YOUR_PASSWORD"];


NSString* paymentRequestId = @"paymentRequestId_example"; // The ID of the specific payment request

OAIMerchantApi*apiInstance = [[OAIMerchantApi alloc] init];

// Get Payment Details
[apiInstance getMerchantPaymentDetailsWithPaymentRequestId:paymentRequestId
          completionHandler: ^(OAIGetMerchantPaymentDetailsResults* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling OAIMerchantApi->getMerchantPaymentDetails: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **paymentRequestId** | **NSString***| The ID of the specific payment request | 

### Return type

[**OAIGetMerchantPaymentDetailsResults***](OAIGetMerchantPaymentDetailsResults.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMerchantPayments**
```objc
-(NSURLSessionTask*) getMerchantPaymentsWithType: (NSString*) type
    pageSize: (NSNumber*) pageSize
    page: (NSNumber*) page
        completionHandler: (void (^)(OAIGetMerchantPaymentsResults* output, NSError* error)) handler;
```

Get Payment List

Get a list of the payments initiated by the merchant, both pending and complete

### Example 
```objc
OAIDefaultConfiguration *apiConfig = [OAIDefaultConfiguration sharedConfig];
// Configure HTTP basic authorization (authentication scheme: bearerAuth)
[apiConfig setUsername:@"YOUR_USERNAME"];
[apiConfig setPassword:@"YOUR_PASSWORD"];


NSString* type = ACTIVE; // The type of payment requests to return: active, inactive or both (optional) (default to @"ACTIVE")
NSNumber* pageSize = @25; // The number of records to return for this page.  Defaults to 25 if absent (optional) (default to @25)
NSNumber* page = @1; // The page of results to return with 1 indicating the first page.  Defaults to 1 if absent (optional) (default to @1)

OAIMerchantApi*apiInstance = [[OAIMerchantApi alloc] init];

// Get Payment List
[apiInstance getMerchantPaymentsWithType:type
              pageSize:pageSize
              page:page
          completionHandler: ^(OAIGetMerchantPaymentsResults* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling OAIMerchantApi->getMerchantPayments: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **type** | **NSString***| The type of payment requests to return: active, inactive or both | [optional] [default to @&quot;ACTIVE&quot;]
 **pageSize** | **NSNumber***| The number of records to return for this page.  Defaults to 25 if absent | [optional] [default to @25]
 **page** | **NSNumber***| The page of results to return with 1 indicating the first page.  Defaults to 1 if absent | [optional] [default to @1]

### Return type

[**OAIGetMerchantPaymentsResults***](OAIGetMerchantPaymentsResults.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMerchantPreferences**
```objc
-(NSURLSessionTask*) getMerchantPreferencesWithCompletionHandler: 
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



OAIMerchantApi*apiInstance = [[OAIMerchantApi alloc] init];

// Get Preferences
[apiInstance getMerchantPreferencesWithCompletionHandler: 
          ^(OAICustomerPreferencesResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling OAIMerchantApi->getMerchantPreferences: %@", error);
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

# **getMerchantSchemaDetails**
```objc
-(NSURLSessionTask*) getMerchantSchemaDetailsWithSchemaId: (NSString*) schemaId
        completionHandler: (void (^)(OAIMerchantSchemaDetailsResult* output, NSError* error)) handler;
```

Get Schema Details

Get the list of currently usable schema previously added for the merchant

### Example 
```objc
OAIDefaultConfiguration *apiConfig = [OAIDefaultConfiguration sharedConfig];
// Configure HTTP basic authorization (authentication scheme: bearerAuth)
[apiConfig setUsername:@"YOUR_USERNAME"];
[apiConfig setPassword:@"YOUR_PASSWORD"];


NSString* schemaId = @"schemaId_example"; // The ID of the specific schema to get details for

OAIMerchantApi*apiInstance = [[OAIMerchantApi alloc] init];

// Get Schema Details
[apiInstance getMerchantSchemaDetailsWithSchemaId:schemaId
          completionHandler: ^(OAIMerchantSchemaDetailsResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling OAIMerchantApi->getMerchantSchemaDetails: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **schemaId** | **NSString***| The ID of the specific schema to get details for | 

### Return type

[**OAIMerchantSchemaDetailsResult***](OAIMerchantSchemaDetailsResult.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMerchantSchemas**
```objc
-(NSURLSessionTask*) getMerchantSchemasWithCompletionHandler: 
        (void (^)(OAIMerchantSchemaResult* output, NSError* error)) handler;
```

Get Schema List

Get the list of currently usable schema previously added for the merchant

### Example 
```objc
OAIDefaultConfiguration *apiConfig = [OAIDefaultConfiguration sharedConfig];
// Configure HTTP basic authorization (authentication scheme: bearerAuth)
[apiConfig setUsername:@"YOUR_USERNAME"];
[apiConfig setPassword:@"YOUR_PASSWORD"];



OAIMerchantApi*apiInstance = [[OAIMerchantApi alloc] init];

// Get Schema List
[apiInstance getMerchantSchemasWithCompletionHandler: 
          ^(OAIMerchantSchemaResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling OAIMerchantApi->getMerchantSchemas: %@", error);
                        }
                    }];
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**OAIMerchantSchemaResult***](OAIMerchantSchemaResult.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMerchantTransactionDetails**
```objc
-(NSURLSessionTask*) getMerchantTransactionDetailsWithTransactionId: (NSString*) transactionId
        completionHandler: (void (^)(OAIGetMerchantTransactionDetailsResults* output, NSError* error)) handler;
```

Get Transaction Details

Get the details for a specific transaction previously executed with the merchant.  Note that amounts are relative to the merchant.  A positive amount is a positive amount transferred to a merchant

### Example 
```objc
OAIDefaultConfiguration *apiConfig = [OAIDefaultConfiguration sharedConfig];
// Configure HTTP basic authorization (authentication scheme: bearerAuth)
[apiConfig setUsername:@"YOUR_USERNAME"];
[apiConfig setPassword:@"YOUR_PASSWORD"];


NSString* transactionId = @"transactionId_example"; // The ID of the specific transaction

OAIMerchantApi*apiInstance = [[OAIMerchantApi alloc] init];

// Get Transaction Details
[apiInstance getMerchantTransactionDetailsWithTransactionId:transactionId
          completionHandler: ^(OAIGetMerchantTransactionDetailsResults* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling OAIMerchantApi->getMerchantTransactionDetails: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **transactionId** | **NSString***| The ID of the specific transaction | 

### Return type

[**OAIGetMerchantTransactionDetailsResults***](OAIGetMerchantTransactionDetailsResults.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMerchantTransactions**
```objc
-(NSURLSessionTask*) getMerchantTransactionsWithStartTime: (NSDate*) startTime
    endTime: (NSDate*) endTime
    pageSize: (NSNumber*) pageSize
    page: (NSNumber*) page
        completionHandler: (void (^)(OAIGetMerchantTransactionsResults* output, NSError* error)) handler;
```

Get Transaction List

Get a list of the previously executed transactions with the merchant.  Note that amounts are relative to the merchant.  A positive amount is a positive amount transferred to a merchant

### Example 
```objc
OAIDefaultConfiguration *apiConfig = [OAIDefaultConfiguration sharedConfig];
// Configure HTTP basic authorization (authentication scheme: bearerAuth)
[apiConfig setUsername:@"YOUR_USERNAME"];
[apiConfig setPassword:@"YOUR_PASSWORD"];


NSDate* startTime = 2017-11-06T19:38:09.890+11:00; // If present, the date/time to limit transactions returned.  Transactions older than this time will not be returned (optional)
NSDate* endTime = 2017-11-06T19:38:09.890+11:00; // If present, the date/time to limit transactions returned.  Transactions newer than this time will not be returned (optional)
NSNumber* pageSize = @25; // The number of records to return for this page.  Defaults to 25 if absent (optional) (default to @25)
NSNumber* page = @1; // The page of results to return with 1 indicating the first page.  Defaults to 1 if absent (optional) (default to @1)

OAIMerchantApi*apiInstance = [[OAIMerchantApi alloc] init];

// Get Transaction List
[apiInstance getMerchantTransactionsWithStartTime:startTime
              endTime:endTime
              pageSize:pageSize
              page:page
          completionHandler: ^(OAIGetMerchantTransactionsResults* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling OAIMerchantApi->getMerchantTransactions: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **startTime** | **NSDate***| If present, the date/time to limit transactions returned.  Transactions older than this time will not be returned | [optional] 
 **endTime** | **NSDate***| If present, the date/time to limit transactions returned.  Transactions newer than this time will not be returned | [optional] 
 **pageSize** | **NSNumber***| The number of records to return for this page.  Defaults to 25 if absent | [optional] [default to @25]
 **page** | **NSNumber***| The page of results to return with 1 indicating the first page.  Defaults to 1 if absent | [optional] [default to @1]

### Return type

[**OAIGetMerchantTransactionsResults***](OAIGetMerchantTransactionsResults.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPaymentQRCodeContent**
```objc
-(NSURLSessionTask*) getPaymentQRCodeContentWithQrId: (NSString*) qrId
        completionHandler: (void (^)(OAICreatePaymentQRCodeResults* output, NSError* error)) handler;
```

Get QR Code Content

Obtain the content or an image for an existing QR code.  If requested content type is application/json then a payload will be returned.  if requested content is image/png an image will be returned

### Example 
```objc
OAIDefaultConfiguration *apiConfig = [OAIDefaultConfiguration sharedConfig];
// Configure HTTP basic authorization (authentication scheme: bearerAuth)
[apiConfig setUsername:@"YOUR_USERNAME"];
[apiConfig setPassword:@"YOUR_PASSWORD"];


NSString* qrId = @"qrId_example"; // The ID of the specific QR Code

OAIMerchantApi*apiInstance = [[OAIMerchantApi alloc] init];

// Get QR Code Content
[apiInstance getPaymentQRCodeContentWithQrId:qrId
          completionHandler: ^(OAICreatePaymentQRCodeResults* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling OAIMerchantApi->getPaymentQRCodeContent: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **qrId** | **NSString***| The ID of the specific QR Code | 

### Return type

[**OAICreatePaymentQRCodeResults***](OAICreatePaymentQRCodeResults.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, image/png

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **refundMerchantTransaction**
```objc
-(NSURLSessionTask*) refundMerchantTransactionWithTransactionId: (NSString*) transactionId
    refundMerchantTransactionRequest: (OAIRefundMerchantTransactionRequest*) refundMerchantTransactionRequest
        completionHandler: (void (^)(OAIRefundMerchantTransactionResults* output, NSError* error)) handler;
```

Refund Transaction

Refund a previously executed transaction

### Example 
```objc
OAIDefaultConfiguration *apiConfig = [OAIDefaultConfiguration sharedConfig];
// Configure HTTP basic authorization (authentication scheme: bearerAuth)
[apiConfig setUsername:@"YOUR_USERNAME"];
[apiConfig setPassword:@"YOUR_PASSWORD"];


NSString* transactionId = @"transactionId_example"; // The ID of the specific transaction to reverse
OAIRefundMerchantTransactionRequest* refundMerchantTransactionRequest = [[OAIRefundMerchantTransactionRequest alloc] init]; // 

OAIMerchantApi*apiInstance = [[OAIMerchantApi alloc] init];

// Refund Transaction
[apiInstance refundMerchantTransactionWithTransactionId:transactionId
              refundMerchantTransactionRequest:refundMerchantTransactionRequest
          completionHandler: ^(OAIRefundMerchantTransactionResults* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling OAIMerchantApi->refundMerchantTransaction: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **transactionId** | **NSString***| The ID of the specific transaction to reverse | 
 **refundMerchantTransactionRequest** | [**OAIRefundMerchantTransactionRequest***](OAIRefundMerchantTransactionRequest.md)|  | 

### Return type

[**OAIRefundMerchantTransactionResults***](OAIRefundMerchantTransactionResults.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **setMerchantPreferences**
```objc
-(NSURLSessionTask*) setMerchantPreferencesWithMerchantPreferences: (OAIMerchantPreferences*) merchantPreferences
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


OAIMerchantPreferences* merchantPreferences = [[OAIMerchantPreferences alloc] init]; // 

OAIMerchantApi*apiInstance = [[OAIMerchantApi alloc] init];

// Set Preferences
[apiInstance setMerchantPreferencesWithMerchantPreferences:merchantPreferences
          completionHandler: ^(NSError* error) {
                        if (error) {
                            NSLog(@"Error calling OAIMerchantApi->setMerchantPreferences: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **merchantPreferences** | [**OAIMerchantPreferences***](OAIMerchantPreferences.md)|  | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

