#import "OAICustomerApi.h"
#import "OAIQueryParamCollection.h"
#import "OAIApiClient.h"
#import "OAICustomerPaymentDetails.h"
#import "OAICustomerPreferences.h"
#import "OAICustomerPreferencesResult.h"
#import "OAIError.h"
#import "OAIGetCustomerPaymentInstrumentsResults.h"
#import "OAIGetCustomerPaymentResult.h"
#import "OAIGetCustomerTransactionDetailsResults.h"
#import "OAIGetCustomerTransactionsResult.h"
#import "OAIInitiatePaymentInstrumentAdditionResults.h"
#import "OAIInstrumentAdditionDetails.h"
#import "OAIMakeCustomerPaymentResults.h"


@interface OAICustomerApi ()

@property (nonatomic, strong, readwrite) NSMutableDictionary *mutableDefaultHeaders;

@end

@implementation OAICustomerApi

NSString* kOAICustomerApiErrorDomain = @"OAICustomerApiErrorDomain";
NSInteger kOAICustomerApiMissingParamErrorCode = 234513;

@synthesize apiClient = _apiClient;

#pragma mark - Initialize methods

- (instancetype) init {
    return [self initWithApiClient:[OAIApiClient sharedClient]];
}


-(instancetype) initWithApiClient:(OAIApiClient *)apiClient {
    self = [super init];
    if (self) {
        _apiClient = apiClient;
        _mutableDefaultHeaders = [NSMutableDictionary dictionary];
    }
    return self;
}

#pragma mark -

-(NSString*) defaultHeaderForKey:(NSString*)key {
    return self.mutableDefaultHeaders[key];
}

-(void) setDefaultHeaderValue:(NSString*) value forKey:(NSString*)key {
    [self.mutableDefaultHeaders setValue:value forKey:key];
}

-(NSDictionary *)defaultHeaders {
    return self.mutableDefaultHeaders;
}

#pragma mark - Api Methods

///
/// Get Payment Details
/// Get the details for a specific payment request so that the customer can pay using it
///  @param paymentRequestId The ID of the specific payment request 
///
///  @returns OAIGetCustomerPaymentResult*
///
-(NSURLSessionTask*) getCustomerPaymentDetailsByPaymentIdWithPaymentRequestId: (NSString*) paymentRequestId
    completionHandler: (void (^)(OAIGetCustomerPaymentResult* output, NSError* error)) handler {
    // verify the required parameter 'paymentRequestId' is set
    if (paymentRequestId == nil) {
        NSParameterAssert(paymentRequestId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"paymentRequestId"] };
            NSError* error = [NSError errorWithDomain:kOAICustomerApiErrorDomain code:kOAICustomerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/customer/payments/{paymentRequestId}"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (paymentRequestId != nil) {
        pathParams[@"paymentRequestId"] = paymentRequestId;
    }

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"application/json"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[@"bearerAuth"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"GET"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"OAIGetCustomerPaymentResult*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((OAIGetCustomerPaymentResult*)data, error);
                                }
                            }];
}

///
/// Get Payment From QR
/// Get the details for a specific payment from a QR Code ID so that the customer can pay using it
///  @param qrId The ID of the specific QR Code 
///
///  @returns OAIGetCustomerPaymentResult*
///
-(NSURLSessionTask*) getCustomerPaymentDetailsByQRCodeIdWithQrId: (NSString*) qrId
    completionHandler: (void (^)(OAIGetCustomerPaymentResult* output, NSError* error)) handler {
    // verify the required parameter 'qrId' is set
    if (qrId == nil) {
        NSParameterAssert(qrId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"qrId"] };
            NSError* error = [NSError errorWithDomain:kOAICustomerApiErrorDomain code:kOAICustomerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/customer/qr/{qrId}"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (qrId != nil) {
        pathParams[@"qrId"] = qrId;
    }

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"application/json"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[@"bearerAuth"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"GET"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"OAIGetCustomerPaymentResult*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((OAIGetCustomerPaymentResult*)data, error);
                                }
                            }];
}

///
/// Get Payment Instruments
/// Get the list of payment instruments currently configured for the customer.  Returns an array of instrument records that can be used to execute payments
///  @returns OAIGetCustomerPaymentInstrumentsResults*
///
-(NSURLSessionTask*) getCustomerPaymentInstrumentsWithCompletionHandler: 
    (void (^)(OAIGetCustomerPaymentInstrumentsResults* output, NSError* error)) handler {
    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/customer/instruments"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"application/json"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[@"bearerAuth"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"GET"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"OAIGetCustomerPaymentInstrumentsResults*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((OAIGetCustomerPaymentInstrumentsResults*)data, error);
                                }
                            }];
}

///
/// Get Preferences
/// Get the preferences previously set by the customer or merchant (depending on calling identity)
///  @returns OAICustomerPreferencesResult*
///
-(NSURLSessionTask*) getCustomerPreferencesWithCompletionHandler: 
    (void (^)(OAICustomerPreferencesResult* output, NSError* error)) handler {
    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/customer/preferences"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"application/json"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[@"bearerAuth"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"GET"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"OAICustomerPreferencesResult*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((OAICustomerPreferencesResult*)data, error);
                                }
                            }];
}

///
/// Get Transaction Details
/// Get the details for a specific transaction previously executed by the customer.  Note that amounts are relative to the merchant.  A positive amount is a positive amount transferred to a merchant
///  @param transactionId The ID of the specific transaction 
///
///  @returns OAIGetCustomerTransactionDetailsResults*
///
-(NSURLSessionTask*) getCustomerTransactionDetailsWithTransactionId: (NSString*) transactionId
    completionHandler: (void (^)(OAIGetCustomerTransactionDetailsResults* output, NSError* error)) handler {
    // verify the required parameter 'transactionId' is set
    if (transactionId == nil) {
        NSParameterAssert(transactionId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"transactionId"] };
            NSError* error = [NSError errorWithDomain:kOAICustomerApiErrorDomain code:kOAICustomerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/customer/transactions/{transactionId}"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (transactionId != nil) {
        pathParams[@"transactionId"] = transactionId;
    }

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"application/json"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[@"bearerAuth"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"GET"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"OAIGetCustomerTransactionDetailsResults*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((OAIGetCustomerTransactionDetailsResults*)data, error);
                                }
                            }];
}

///
/// Get Transaction List
/// Get a list of the previously executed transactions for the customer.  Note that amounts are relative to the merchant.  A positive amount is a positive amount transferred to a merchant
///  @param paymentRequestId If present, limits the list of transactions to those that relate to the payment request (optional)
///
///  @param startTime If present, the date/time to limit transactions returned.  Transactions older than this time will not be returned (optional)
///
///  @param endTime If present, the date/time to limit transactions returned.  Transactions newer than this time will not be returned (optional)
///
///  @param pageSize The number of records to return for this page.  Defaults to 25 if absent (optional, default to @25)
///
///  @param page The page of results to return with 1 indicating the first page.  Defaults to 1 if absent (optional, default to @1)
///
///  @returns OAIGetCustomerTransactionsResult*
///
-(NSURLSessionTask*) getCustomerTransactionsWithPaymentRequestId: (NSString*) paymentRequestId
    startTime: (NSDate*) startTime
    endTime: (NSDate*) endTime
    pageSize: (NSNumber*) pageSize
    page: (NSNumber*) page
    completionHandler: (void (^)(OAIGetCustomerTransactionsResult* output, NSError* error)) handler {
    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/customer/transactions"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (paymentRequestId != nil) {
        queryParams[@"paymentRequestId"] = paymentRequestId;
    }
    if (startTime != nil) {
        queryParams[@"start-time"] = startTime;
    }
    if (endTime != nil) {
        queryParams[@"end-time"] = endTime;
    }
    if (pageSize != nil) {
        queryParams[@"page-size"] = pageSize;
    }
    if (page != nil) {
        queryParams[@"page"] = page;
    }
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"application/json"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[@"bearerAuth"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"GET"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"OAIGetCustomerTransactionsResult*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((OAIGetCustomerTransactionsResult*)data, error);
                                }
                            }];
}

///
/// Initiate Instrument Addition
/// Initiate the addition of a new payment instrument for this customer.  This API returns a URL to be used to access the DigiPay IFrame based interface to request the customer to enter a payment instrument details.
///  @param instrumentAdditionDetails  
///
///  @returns OAIInitiatePaymentInstrumentAdditionResults*
///
-(NSURLSessionTask*) initiatePaymentInstrumentAdditionWithInstrumentAdditionDetails: (OAIInstrumentAdditionDetails*) instrumentAdditionDetails
    completionHandler: (void (^)(OAIInitiatePaymentInstrumentAdditionResults* output, NSError* error)) handler {
    // verify the required parameter 'instrumentAdditionDetails' is set
    if (instrumentAdditionDetails == nil) {
        NSParameterAssert(instrumentAdditionDetails);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"instrumentAdditionDetails"] };
            NSError* error = [NSError errorWithDomain:kOAICustomerApiErrorDomain code:kOAICustomerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/customer/instruments"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"application/json"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[@"application/json"]];

    // Authentication setting
    NSArray *authSettings = @[@"bearerAuth"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];
    bodyParam = instrumentAdditionDetails;

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"POST"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"OAIInitiatePaymentInstrumentAdditionResults*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((OAIInitiatePaymentInstrumentAdditionResults*)data, error);
                                }
                            }];
}

///
/// Pay Payment
/// Pay a specific payment using the instrument details provided
///  @param paymentRequestId The ID of the specific payment request 
///
///  @param customerPaymentDetails  
///
///  @returns OAIMakeCustomerPaymentResults*
///
-(NSURLSessionTask*) makeCustomerPaymentWithPaymentRequestId: (NSString*) paymentRequestId
    customerPaymentDetails: (OAICustomerPaymentDetails*) customerPaymentDetails
    completionHandler: (void (^)(OAIMakeCustomerPaymentResults* output, NSError* error)) handler {
    // verify the required parameter 'paymentRequestId' is set
    if (paymentRequestId == nil) {
        NSParameterAssert(paymentRequestId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"paymentRequestId"] };
            NSError* error = [NSError errorWithDomain:kOAICustomerApiErrorDomain code:kOAICustomerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'customerPaymentDetails' is set
    if (customerPaymentDetails == nil) {
        NSParameterAssert(customerPaymentDetails);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"customerPaymentDetails"] };
            NSError* error = [NSError errorWithDomain:kOAICustomerApiErrorDomain code:kOAICustomerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/customer/payments/{paymentRequestId}"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (paymentRequestId != nil) {
        pathParams[@"paymentRequestId"] = paymentRequestId;
    }

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"application/json"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[@"application/json"]];

    // Authentication setting
    NSArray *authSettings = @[@"bearerAuth"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];
    bodyParam = customerPaymentDetails;

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"PUT"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"OAIMakeCustomerPaymentResults*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((OAIMakeCustomerPaymentResults*)data, error);
                                }
                            }];
}

///
/// Set Preferences
/// Change the preferences for the customer or merchant (depending on calling identity)
///  @param customerPreferences  
///
///  @returns void
///
-(NSURLSessionTask*) setCustomerPreferencesWithCustomerPreferences: (OAICustomerPreferences*) customerPreferences
    completionHandler: (void (^)(NSError* error)) handler {
    // verify the required parameter 'customerPreferences' is set
    if (customerPreferences == nil) {
        NSParameterAssert(customerPreferences);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"customerPreferences"] };
            NSError* error = [NSError errorWithDomain:kOAICustomerApiErrorDomain code:kOAICustomerApiMissingParamErrorCode userInfo:userInfo];
            handler(error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/customer/preferences"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[@"application/json"]];

    // Authentication setting
    NSArray *authSettings = @[@"bearerAuth"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];
    bodyParam = customerPreferences;

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"POST"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: nil
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler(error);
                                }
                            }];
}



@end
