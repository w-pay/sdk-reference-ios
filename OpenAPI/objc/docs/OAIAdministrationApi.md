# OAIAdministrationApi

All URIs are relative to *http://localhost:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**checkHealth**](OAIAdministrationApi.md#checkhealth) | **GET** / | Health Check


# **checkHealth**
```objc
-(NSURLSessionTask*) checkHealthWithCompletionHandler: 
        (void (^)(OAIHealthCheckResult* output, NSError* error)) handler;
```

Health Check

Perform a health check on the Village Wallet implementation

### Example 
```objc
OAIDefaultConfiguration *apiConfig = [OAIDefaultConfiguration sharedConfig];
// Configure HTTP basic authorization (authentication scheme: bearerAuth)
[apiConfig setUsername:@"YOUR_USERNAME"];
[apiConfig setPassword:@"YOUR_PASSWORD"];



OAIAdministrationApi*apiInstance = [[OAIAdministrationApi alloc] init];

// Health Check
[apiInstance checkHealthWithCompletionHandler: 
          ^(OAIHealthCheckResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling OAIAdministrationApi->checkHealth: %@", error);
                        }
                    }];
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**OAIHealthCheckResult***](OAIHealthCheckResult.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

