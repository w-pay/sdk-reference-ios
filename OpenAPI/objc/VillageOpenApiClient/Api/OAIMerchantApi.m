#import "OAIMerchantApi.h"
#import "OAIQueryParamCollection.h"
#import "OAIApiClient.h"
#import "OAICreateMerchantPaymentSessionResponse.h"
#import "OAICreateMerchantSchemaResults.h"
#import "OAICreatePaymentQRCodeResults.h"
#import "OAICreatePaymentRequestResults.h"
#import "OAICreatePaymentSessionRequest.h"
#import "OAICustomerPaymentSessionResult.h"
#import "OAICustomerPreferencesResult.h"
#import "OAIError.h"
#import "OAIGetMerchantPaymentDetailsResults.h"
#import "OAIGetMerchantPaymentsResults.h"
#import "OAIGetMerchantTransactionDetailsResults.h"
#import "OAIGetMerchantTransactionsResults.h"
#import "OAIMerchantPaymentRequest.h"
#import "OAIMerchantPreferences.h"
#import "OAIMerchantSchema.h"
#import "OAIMerchantSchemaDetailsResult.h"
#import "OAIMerchantSchemaResult.h"
#import "OAIPaymentQRCodeDetails.h"
#import "OAIRefundMerchantTransactionRequest.h"
#import "OAIRefundMerchantTransactionResults.h"
#import "OAIUpdatePaymentSessionRequest1.h"


@interface OAIMerchantApi ()

@property (nonatomic, strong, readwrite) NSMutableDictionary *mutableDefaultHeaders;

@end

@implementation OAIMerchantApi

NSString* kOAIMerchantApiErrorDomain = @"OAIMerchantApiErrorDomain";
NSInteger kOAIMerchantApiMissingParamErrorCode = 234513;

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
/// Invalidate QR Code
/// Cancel an existing QC code.  Effectively expires the QR code
///  @param xMerchantID  
///
///  @param qrId The ID of the specific QR Code 
///
///  @returns void
///
-(NSURLSessionTask*) cancelPaymentQRCodeWithXMerchantID: (NSString*) xMerchantID
    qrId: (NSString*) qrId
    completionHandler: (void (^)(NSError* error)) handler {
    // verify the required parameter 'xMerchantID' is set
    if (xMerchantID == nil) {
        NSParameterAssert(xMerchantID);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"xMerchantID"] };
            NSError* error = [NSError errorWithDomain:kOAIMerchantApiErrorDomain code:kOAIMerchantApiMissingParamErrorCode userInfo:userInfo];
            handler(error);
        }
        return nil;
    }

    // verify the required parameter 'qrId' is set
    if (qrId == nil) {
        NSParameterAssert(qrId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"qrId"] };
            NSError* error = [NSError errorWithDomain:kOAIMerchantApiErrorDomain code:kOAIMerchantApiMissingParamErrorCode userInfo:userInfo];
            handler(error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/merchant/qr/{qrId}"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (qrId != nil) {
        pathParams[@"qrId"] = qrId;
    }

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (xMerchantID != nil) {
        headerParams[@"X-Merchant-ID"] = xMerchantID;
    }
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
    NSArray *authSettings = @[@"ApiKeyAuth"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"DELETE"
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

///
/// Create Payment Session
/// Create a new payment session
///  @param xMerchantID  
///
///  @param createPaymentSessionRequest  
///
///  @returns OAICreateMerchantPaymentSessionResponse*
///
-(NSURLSessionTask*) createCustomerPaymentSessionWithXMerchantID: (NSString*) xMerchantID
    createPaymentSessionRequest: (OAICreatePaymentSessionRequest*) createPaymentSessionRequest
    completionHandler: (void (^)(OAICreateMerchantPaymentSessionResponse* output, NSError* error)) handler {
    // verify the required parameter 'xMerchantID' is set
    if (xMerchantID == nil) {
        NSParameterAssert(xMerchantID);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"xMerchantID"] };
            NSError* error = [NSError errorWithDomain:kOAIMerchantApiErrorDomain code:kOAIMerchantApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'createPaymentSessionRequest' is set
    if (createPaymentSessionRequest == nil) {
        NSParameterAssert(createPaymentSessionRequest);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"createPaymentSessionRequest"] };
            NSError* error = [NSError errorWithDomain:kOAIMerchantApiErrorDomain code:kOAIMerchantApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/merchant/payment/session"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (xMerchantID != nil) {
        headerParams[@"X-Merchant-ID"] = xMerchantID;
    }
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
    NSArray *authSettings = @[@"ApiKeyAuth"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];
    bodyParam = createPaymentSessionRequest;

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
                              responseType: @"OAICreateMerchantPaymentSessionResponse*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((OAICreateMerchantPaymentSessionResponse*)data, error);
                                }
                            }];
}

///
/// Add Schema
/// Add a new schema that can be used in schema based payloads for this merchant
///  @param xMerchantID  
///
///  @param merchantSchema  
///
///  @returns OAICreateMerchantSchemaResults*
///
-(NSURLSessionTask*) createMerchantSchemaWithXMerchantID: (NSString*) xMerchantID
    merchantSchema: (OAIMerchantSchema*) merchantSchema
    completionHandler: (void (^)(OAICreateMerchantSchemaResults* output, NSError* error)) handler {
    // verify the required parameter 'xMerchantID' is set
    if (xMerchantID == nil) {
        NSParameterAssert(xMerchantID);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"xMerchantID"] };
            NSError* error = [NSError errorWithDomain:kOAIMerchantApiErrorDomain code:kOAIMerchantApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'merchantSchema' is set
    if (merchantSchema == nil) {
        NSParameterAssert(merchantSchema);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"merchantSchema"] };
            NSError* error = [NSError errorWithDomain:kOAIMerchantApiErrorDomain code:kOAIMerchantApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/merchant/schema"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (xMerchantID != nil) {
        headerParams[@"X-Merchant-ID"] = xMerchantID;
    }
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
    NSArray *authSettings = @[@"ApiKeyAuth"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];
    bodyParam = merchantSchema;

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
                              responseType: @"OAICreateMerchantSchemaResults*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((OAICreateMerchantSchemaResults*)data, error);
                                }
                            }];
}

///
/// Create QR Code
/// Create a new QR code for an existing payment
///  @param xMerchantID  
///
///  @param paymentQRCodeDetails  
///
///  @returns OAICreatePaymentQRCodeResults*
///
-(NSURLSessionTask*) createPaymentQRCodeWithXMerchantID: (NSString*) xMerchantID
    paymentQRCodeDetails: (OAIPaymentQRCodeDetails*) paymentQRCodeDetails
    completionHandler: (void (^)(OAICreatePaymentQRCodeResults* output, NSError* error)) handler {
    // verify the required parameter 'xMerchantID' is set
    if (xMerchantID == nil) {
        NSParameterAssert(xMerchantID);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"xMerchantID"] };
            NSError* error = [NSError errorWithDomain:kOAIMerchantApiErrorDomain code:kOAIMerchantApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'paymentQRCodeDetails' is set
    if (paymentQRCodeDetails == nil) {
        NSParameterAssert(paymentQRCodeDetails);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"paymentQRCodeDetails"] };
            NSError* error = [NSError errorWithDomain:kOAIMerchantApiErrorDomain code:kOAIMerchantApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/merchant/qr"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (xMerchantID != nil) {
        headerParams[@"X-Merchant-ID"] = xMerchantID;
    }
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
    NSArray *authSettings = @[@"ApiKeyAuth"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];
    bodyParam = paymentQRCodeDetails;

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
                              responseType: @"OAICreatePaymentQRCodeResults*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((OAICreatePaymentQRCodeResults*)data, error);
                                }
                            }];
}

///
/// Create Payment
/// Create a new payment request that can then be presented to a customer for payment
///  @param xMerchantID  
///
///  @param merchantPaymentRequest  
///
///  @returns OAICreatePaymentRequestResults*
///
-(NSURLSessionTask*) createPaymentRequestWithXMerchantID: (NSString*) xMerchantID
    merchantPaymentRequest: (OAIMerchantPaymentRequest*) merchantPaymentRequest
    completionHandler: (void (^)(OAICreatePaymentRequestResults* output, NSError* error)) handler {
    // verify the required parameter 'xMerchantID' is set
    if (xMerchantID == nil) {
        NSParameterAssert(xMerchantID);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"xMerchantID"] };
            NSError* error = [NSError errorWithDomain:kOAIMerchantApiErrorDomain code:kOAIMerchantApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'merchantPaymentRequest' is set
    if (merchantPaymentRequest == nil) {
        NSParameterAssert(merchantPaymentRequest);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"merchantPaymentRequest"] };
            NSError* error = [NSError errorWithDomain:kOAIMerchantApiErrorDomain code:kOAIMerchantApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/merchant/payments"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (xMerchantID != nil) {
        headerParams[@"X-Merchant-ID"] = xMerchantID;
    }
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
    NSArray *authSettings = @[@"ApiKeyAuth"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];
    bodyParam = merchantPaymentRequest;

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
                              responseType: @"OAICreatePaymentRequestResults*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((OAICreatePaymentRequestResults*)data, error);
                                }
                            }];
}

///
/// Delete Payment
/// Cancel an existing payment by setting the expiration date/time to now and setting the remaining uses to 0.  Will only be successful if the payment is still pending.  Completed payments need to be refunded using the dedicated API for that purpose
///  @param xMerchantID  
///
///  @param paymentRequestId The ID of the specific payment request 
///
///  @returns void
///
-(NSURLSessionTask*) deleteMerchantPaymentWithXMerchantID: (NSString*) xMerchantID
    paymentRequestId: (NSString*) paymentRequestId
    completionHandler: (void (^)(NSError* error)) handler {
    // verify the required parameter 'xMerchantID' is set
    if (xMerchantID == nil) {
        NSParameterAssert(xMerchantID);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"xMerchantID"] };
            NSError* error = [NSError errorWithDomain:kOAIMerchantApiErrorDomain code:kOAIMerchantApiMissingParamErrorCode userInfo:userInfo];
            handler(error);
        }
        return nil;
    }

    // verify the required parameter 'paymentRequestId' is set
    if (paymentRequestId == nil) {
        NSParameterAssert(paymentRequestId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"paymentRequestId"] };
            NSError* error = [NSError errorWithDomain:kOAIMerchantApiErrorDomain code:kOAIMerchantApiMissingParamErrorCode userInfo:userInfo];
            handler(error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/merchant/payments/{paymentRequestId}"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (paymentRequestId != nil) {
        pathParams[@"paymentRequestId"] = paymentRequestId;
    }

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (xMerchantID != nil) {
        headerParams[@"X-Merchant-ID"] = xMerchantID;
    }
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
    NSArray *authSettings = @[@"ApiKeyAuth"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"DELETE"
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

///
/// Delete Payment Session
/// Deletes a payment session by setting its expiration date/time to now
///  @param xMerchantID  
///
///  @param paymentSessionId The ID of the specific payment session to delete 
///
///  @returns void
///
-(NSURLSessionTask*) deleteMerchantPaymentSessionWithXMerchantID: (NSString*) xMerchantID
    paymentSessionId: (NSString*) paymentSessionId
    completionHandler: (void (^)(NSError* error)) handler {
    // verify the required parameter 'xMerchantID' is set
    if (xMerchantID == nil) {
        NSParameterAssert(xMerchantID);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"xMerchantID"] };
            NSError* error = [NSError errorWithDomain:kOAIMerchantApiErrorDomain code:kOAIMerchantApiMissingParamErrorCode userInfo:userInfo];
            handler(error);
        }
        return nil;
    }

    // verify the required parameter 'paymentSessionId' is set
    if (paymentSessionId == nil) {
        NSParameterAssert(paymentSessionId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"paymentSessionId"] };
            NSError* error = [NSError errorWithDomain:kOAIMerchantApiErrorDomain code:kOAIMerchantApiMissingParamErrorCode userInfo:userInfo];
            handler(error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/merchant/payment/session/{paymentSessionId}"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (paymentSessionId != nil) {
        pathParams[@"paymentSessionId"] = paymentSessionId;
    }

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (xMerchantID != nil) {
        headerParams[@"X-Merchant-ID"] = xMerchantID;
    }
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[@"ApiKeyAuth"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"DELETE"
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

///
/// Get Payment Details
/// Get the details for a specific payment.  Provides all types of payments and all payment content
///  @param xMerchantID  
///
///  @param paymentRequestId The ID of the specific payment request 
///
///  @returns OAIGetMerchantPaymentDetailsResults*
///
-(NSURLSessionTask*) getMerchantPaymentDetailsWithXMerchantID: (NSString*) xMerchantID
    paymentRequestId: (NSString*) paymentRequestId
    completionHandler: (void (^)(OAIGetMerchantPaymentDetailsResults* output, NSError* error)) handler {
    // verify the required parameter 'xMerchantID' is set
    if (xMerchantID == nil) {
        NSParameterAssert(xMerchantID);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"xMerchantID"] };
            NSError* error = [NSError errorWithDomain:kOAIMerchantApiErrorDomain code:kOAIMerchantApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'paymentRequestId' is set
    if (paymentRequestId == nil) {
        NSParameterAssert(paymentRequestId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"paymentRequestId"] };
            NSError* error = [NSError errorWithDomain:kOAIMerchantApiErrorDomain code:kOAIMerchantApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/merchant/payments/{paymentRequestId}"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (paymentRequestId != nil) {
        pathParams[@"paymentRequestId"] = paymentRequestId;
    }

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (xMerchantID != nil) {
        headerParams[@"X-Merchant-ID"] = xMerchantID;
    }
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
    NSArray *authSettings = @[@"ApiKeyAuth"];

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
                              responseType: @"OAIGetMerchantPaymentDetailsResults*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((OAIGetMerchantPaymentDetailsResults*)data, error);
                                }
                            }];
}

///
/// Get Payment Session
/// Get the details of a payment session
///  @param xMerchantID  
///
///  @param paymentSessionId The ID of the specific payment session to retrieve 
///
///  @returns OAICustomerPaymentSessionResult*
///
-(NSURLSessionTask*) getMerchantPaymentSessionWithXMerchantID: (NSString*) xMerchantID
    paymentSessionId: (NSString*) paymentSessionId
    completionHandler: (void (^)(OAICustomerPaymentSessionResult* output, NSError* error)) handler {
    // verify the required parameter 'xMerchantID' is set
    if (xMerchantID == nil) {
        NSParameterAssert(xMerchantID);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"xMerchantID"] };
            NSError* error = [NSError errorWithDomain:kOAIMerchantApiErrorDomain code:kOAIMerchantApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'paymentSessionId' is set
    if (paymentSessionId == nil) {
        NSParameterAssert(paymentSessionId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"paymentSessionId"] };
            NSError* error = [NSError errorWithDomain:kOAIMerchantApiErrorDomain code:kOAIMerchantApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/merchant/payment/session/{paymentSessionId}"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (paymentSessionId != nil) {
        pathParams[@"paymentSessionId"] = paymentSessionId;
    }

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (xMerchantID != nil) {
        headerParams[@"X-Merchant-ID"] = xMerchantID;
    }
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
    NSArray *authSettings = @[@"ApiKeyAuth"];

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
                              responseType: @"OAICustomerPaymentSessionResult*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((OAICustomerPaymentSessionResult*)data, error);
                                }
                            }];
}

///
/// Get Payment List
/// Get a list of the payments initiated by the merchant, both pending and complete
///  @param xMerchantID  
///
///  @param type The type of payment requests to return: active, inactive or both (optional, default to @"ACTIVE")
///
///  @param pageSize The number of records to return for this page.  Defaults to 25 if absent (optional, default to @25)
///
///  @param page The page of results to return with 1 indicating the first page.  Defaults to 1 if absent (optional, default to @1)
///
///  @returns OAIGetMerchantPaymentsResults*
///
-(NSURLSessionTask*) getMerchantPaymentsWithXMerchantID: (NSString*) xMerchantID
    type: (NSString*) type
    pageSize: (NSNumber*) pageSize
    page: (NSNumber*) page
    completionHandler: (void (^)(OAIGetMerchantPaymentsResults* output, NSError* error)) handler {
    // verify the required parameter 'xMerchantID' is set
    if (xMerchantID == nil) {
        NSParameterAssert(xMerchantID);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"xMerchantID"] };
            NSError* error = [NSError errorWithDomain:kOAIMerchantApiErrorDomain code:kOAIMerchantApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/merchant/payments"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (type != nil) {
        queryParams[@"type"] = type;
    }
    if (pageSize != nil) {
        queryParams[@"page-size"] = pageSize;
    }
    if (page != nil) {
        queryParams[@"page"] = page;
    }
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (xMerchantID != nil) {
        headerParams[@"X-Merchant-ID"] = xMerchantID;
    }
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
    NSArray *authSettings = @[@"ApiKeyAuth"];

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
                              responseType: @"OAIGetMerchantPaymentsResults*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((OAIGetMerchantPaymentsResults*)data, error);
                                }
                            }];
}

///
/// Get Preferences
/// Get the preferences previously set by the customer or merchant (depending on calling identity)
///  @param xMerchantID  
///
///  @returns OAICustomerPreferencesResult*
///
-(NSURLSessionTask*) getMerchantPreferencesWithXMerchantID: (NSString*) xMerchantID
    completionHandler: (void (^)(OAICustomerPreferencesResult* output, NSError* error)) handler {
    // verify the required parameter 'xMerchantID' is set
    if (xMerchantID == nil) {
        NSParameterAssert(xMerchantID);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"xMerchantID"] };
            NSError* error = [NSError errorWithDomain:kOAIMerchantApiErrorDomain code:kOAIMerchantApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/merchant/preferences"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (xMerchantID != nil) {
        headerParams[@"X-Merchant-ID"] = xMerchantID;
    }
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
    NSArray *authSettings = @[@"ApiKeyAuth"];

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
/// Get Schema Details
/// Get the list of currently usable schema previously added for the merchant
///  @param xMerchantID  
///
///  @param schemaId The ID of the specific schema to get details for 
///
///  @returns OAIMerchantSchemaDetailsResult*
///
-(NSURLSessionTask*) getMerchantSchemaDetailsWithXMerchantID: (NSString*) xMerchantID
    schemaId: (NSString*) schemaId
    completionHandler: (void (^)(OAIMerchantSchemaDetailsResult* output, NSError* error)) handler {
    // verify the required parameter 'xMerchantID' is set
    if (xMerchantID == nil) {
        NSParameterAssert(xMerchantID);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"xMerchantID"] };
            NSError* error = [NSError errorWithDomain:kOAIMerchantApiErrorDomain code:kOAIMerchantApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'schemaId' is set
    if (schemaId == nil) {
        NSParameterAssert(schemaId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"schemaId"] };
            NSError* error = [NSError errorWithDomain:kOAIMerchantApiErrorDomain code:kOAIMerchantApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/merchant/schema/{schemaId}"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (schemaId != nil) {
        pathParams[@"schemaId"] = schemaId;
    }

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (xMerchantID != nil) {
        headerParams[@"X-Merchant-ID"] = xMerchantID;
    }
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
    NSArray *authSettings = @[@"ApiKeyAuth"];

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
                              responseType: @"OAIMerchantSchemaDetailsResult*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((OAIMerchantSchemaDetailsResult*)data, error);
                                }
                            }];
}

///
/// Get Schema List
/// Get the list of currently usable schema previously added for the merchant
///  @param xMerchantID  
///
///  @returns OAIMerchantSchemaResult*
///
-(NSURLSessionTask*) getMerchantSchemasWithXMerchantID: (NSString*) xMerchantID
    completionHandler: (void (^)(OAIMerchantSchemaResult* output, NSError* error)) handler {
    // verify the required parameter 'xMerchantID' is set
    if (xMerchantID == nil) {
        NSParameterAssert(xMerchantID);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"xMerchantID"] };
            NSError* error = [NSError errorWithDomain:kOAIMerchantApiErrorDomain code:kOAIMerchantApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/merchant/schema"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (xMerchantID != nil) {
        headerParams[@"X-Merchant-ID"] = xMerchantID;
    }
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
    NSArray *authSettings = @[@"ApiKeyAuth"];

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
                              responseType: @"OAIMerchantSchemaResult*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((OAIMerchantSchemaResult*)data, error);
                                }
                            }];
}

///
/// Get Transaction Details
/// Get the details for a specific transaction previously executed with the merchant.  Note that amounts are relative to the merchant.  A positive amount is a positive amount transferred to a merchant
///  @param xMerchantID  
///
///  @param transactionId The ID of the specific transaction 
///
///  @returns OAIGetMerchantTransactionDetailsResults*
///
-(NSURLSessionTask*) getMerchantTransactionDetailsWithXMerchantID: (NSString*) xMerchantID
    transactionId: (NSString*) transactionId
    completionHandler: (void (^)(OAIGetMerchantTransactionDetailsResults* output, NSError* error)) handler {
    // verify the required parameter 'xMerchantID' is set
    if (xMerchantID == nil) {
        NSParameterAssert(xMerchantID);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"xMerchantID"] };
            NSError* error = [NSError errorWithDomain:kOAIMerchantApiErrorDomain code:kOAIMerchantApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'transactionId' is set
    if (transactionId == nil) {
        NSParameterAssert(transactionId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"transactionId"] };
            NSError* error = [NSError errorWithDomain:kOAIMerchantApiErrorDomain code:kOAIMerchantApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/merchant/transactions/{transactionId}"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (transactionId != nil) {
        pathParams[@"transactionId"] = transactionId;
    }

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (xMerchantID != nil) {
        headerParams[@"X-Merchant-ID"] = xMerchantID;
    }
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
    NSArray *authSettings = @[@"ApiKeyAuth"];

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
                              responseType: @"OAIGetMerchantTransactionDetailsResults*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((OAIGetMerchantTransactionDetailsResults*)data, error);
                                }
                            }];
}

///
/// Get Transaction List
/// Get a list of the previously executed transactions with the merchant.  Note that amounts are relative to the merchant.  A positive amount is a positive amount transferred to a merchant
///  @param xMerchantID  
///
///  @param startTime If present, the date/time to limit transactions returned.  Transactions older than this time will not be returned (optional)
///
///  @param endTime If present, the date/time to limit transactions returned.  Transactions newer than this time will not be returned (optional)
///
///  @param pageSize The number of records to return for this page.  Defaults to 25 if absent (optional, default to @25)
///
///  @param page The page of results to return with 1 indicating the first page.  Defaults to 1 if absent (optional, default to @1)
///
///  @returns OAIGetMerchantTransactionsResults*
///
-(NSURLSessionTask*) getMerchantTransactionsWithXMerchantID: (NSString*) xMerchantID
    startTime: (NSDate*) startTime
    endTime: (NSDate*) endTime
    pageSize: (NSNumber*) pageSize
    page: (NSNumber*) page
    completionHandler: (void (^)(OAIGetMerchantTransactionsResults* output, NSError* error)) handler {
    // verify the required parameter 'xMerchantID' is set
    if (xMerchantID == nil) {
        NSParameterAssert(xMerchantID);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"xMerchantID"] };
            NSError* error = [NSError errorWithDomain:kOAIMerchantApiErrorDomain code:kOAIMerchantApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/merchant/transactions"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
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
    if (xMerchantID != nil) {
        headerParams[@"X-Merchant-ID"] = xMerchantID;
    }
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
    NSArray *authSettings = @[@"ApiKeyAuth"];

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
                              responseType: @"OAIGetMerchantTransactionsResults*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((OAIGetMerchantTransactionsResults*)data, error);
                                }
                            }];
}

///
/// Get QR Code Content
/// Obtain the content or an image for an existing QR code.  If requested content type is application/json then a payload will be returned.  if requested content is image/png an image will be returned
///  @param xMerchantID  
///
///  @param qrId The ID of the specific QR Code 
///
///  @returns OAICreatePaymentQRCodeResults*
///
-(NSURLSessionTask*) getPaymentQRCodeContentWithXMerchantID: (NSString*) xMerchantID
    qrId: (NSString*) qrId
    completionHandler: (void (^)(OAICreatePaymentQRCodeResults* output, NSError* error)) handler {
    // verify the required parameter 'xMerchantID' is set
    if (xMerchantID == nil) {
        NSParameterAssert(xMerchantID);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"xMerchantID"] };
            NSError* error = [NSError errorWithDomain:kOAIMerchantApiErrorDomain code:kOAIMerchantApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'qrId' is set
    if (qrId == nil) {
        NSParameterAssert(qrId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"qrId"] };
            NSError* error = [NSError errorWithDomain:kOAIMerchantApiErrorDomain code:kOAIMerchantApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/merchant/qr/{qrId}"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (qrId != nil) {
        pathParams[@"qrId"] = qrId;
    }

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (xMerchantID != nil) {
        headerParams[@"X-Merchant-ID"] = xMerchantID;
    }
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"application/json", @"image/png"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[@"ApiKeyAuth"];

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
                              responseType: @"OAICreatePaymentQRCodeResults*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((OAICreatePaymentQRCodeResults*)data, error);
                                }
                            }];
}

///
/// Refund Transaction
/// Refund a previously executed transaction
///  @param xMerchantID  
///
///  @param transactionId The ID of the specific transaction to reverse 
///
///  @param refundMerchantTransactionRequest  
///
///  @returns OAIRefundMerchantTransactionResults*
///
-(NSURLSessionTask*) refundMerchantTransactionWithXMerchantID: (NSString*) xMerchantID
    transactionId: (NSString*) transactionId
    refundMerchantTransactionRequest: (OAIRefundMerchantTransactionRequest*) refundMerchantTransactionRequest
    completionHandler: (void (^)(OAIRefundMerchantTransactionResults* output, NSError* error)) handler {
    // verify the required parameter 'xMerchantID' is set
    if (xMerchantID == nil) {
        NSParameterAssert(xMerchantID);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"xMerchantID"] };
            NSError* error = [NSError errorWithDomain:kOAIMerchantApiErrorDomain code:kOAIMerchantApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'transactionId' is set
    if (transactionId == nil) {
        NSParameterAssert(transactionId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"transactionId"] };
            NSError* error = [NSError errorWithDomain:kOAIMerchantApiErrorDomain code:kOAIMerchantApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'refundMerchantTransactionRequest' is set
    if (refundMerchantTransactionRequest == nil) {
        NSParameterAssert(refundMerchantTransactionRequest);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"refundMerchantTransactionRequest"] };
            NSError* error = [NSError errorWithDomain:kOAIMerchantApiErrorDomain code:kOAIMerchantApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/merchant/transactions/{transactionId}/refund"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (transactionId != nil) {
        pathParams[@"transactionId"] = transactionId;
    }

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (xMerchantID != nil) {
        headerParams[@"X-Merchant-ID"] = xMerchantID;
    }
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
    NSArray *authSettings = @[@"ApiKeyAuth"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];
    bodyParam = refundMerchantTransactionRequest;

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
                              responseType: @"OAIRefundMerchantTransactionResults*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((OAIRefundMerchantTransactionResults*)data, error);
                                }
                            }];
}

///
/// Set Preferences
/// Change the preferences for the customer or merchant (depending on calling identity)
///  @param xMerchantID  
///
///  @param merchantPreferences  
///
///  @returns void
///
-(NSURLSessionTask*) setMerchantPreferencesWithXMerchantID: (NSString*) xMerchantID
    merchantPreferences: (OAIMerchantPreferences*) merchantPreferences
    completionHandler: (void (^)(NSError* error)) handler {
    // verify the required parameter 'xMerchantID' is set
    if (xMerchantID == nil) {
        NSParameterAssert(xMerchantID);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"xMerchantID"] };
            NSError* error = [NSError errorWithDomain:kOAIMerchantApiErrorDomain code:kOAIMerchantApiMissingParamErrorCode userInfo:userInfo];
            handler(error);
        }
        return nil;
    }

    // verify the required parameter 'merchantPreferences' is set
    if (merchantPreferences == nil) {
        NSParameterAssert(merchantPreferences);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"merchantPreferences"] };
            NSError* error = [NSError errorWithDomain:kOAIMerchantApiErrorDomain code:kOAIMerchantApiMissingParamErrorCode userInfo:userInfo];
            handler(error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/merchant/preferences"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (xMerchantID != nil) {
        headerParams[@"X-Merchant-ID"] = xMerchantID;
    }
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
    NSArray *authSettings = @[@"ApiKeyAuth"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];
    bodyParam = merchantPreferences;

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

///
/// Update Payment Session
/// Update the payment session details
///  @param xMerchantID  
///
///  @param paymentSessionId The ID of the specific payment session to retrieve 
///
///  @param updatePaymentSessionRequest1  
///
///  @returns void
///
-(NSURLSessionTask*) updateMerchantPaymentSessionWithXMerchantID: (NSString*) xMerchantID
    paymentSessionId: (NSString*) paymentSessionId
    updatePaymentSessionRequest1: (OAIUpdatePaymentSessionRequest1*) updatePaymentSessionRequest1
    completionHandler: (void (^)(NSError* error)) handler {
    // verify the required parameter 'xMerchantID' is set
    if (xMerchantID == nil) {
        NSParameterAssert(xMerchantID);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"xMerchantID"] };
            NSError* error = [NSError errorWithDomain:kOAIMerchantApiErrorDomain code:kOAIMerchantApiMissingParamErrorCode userInfo:userInfo];
            handler(error);
        }
        return nil;
    }

    // verify the required parameter 'paymentSessionId' is set
    if (paymentSessionId == nil) {
        NSParameterAssert(paymentSessionId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"paymentSessionId"] };
            NSError* error = [NSError errorWithDomain:kOAIMerchantApiErrorDomain code:kOAIMerchantApiMissingParamErrorCode userInfo:userInfo];
            handler(error);
        }
        return nil;
    }

    // verify the required parameter 'updatePaymentSessionRequest1' is set
    if (updatePaymentSessionRequest1 == nil) {
        NSParameterAssert(updatePaymentSessionRequest1);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"updatePaymentSessionRequest1"] };
            NSError* error = [NSError errorWithDomain:kOAIMerchantApiErrorDomain code:kOAIMerchantApiMissingParamErrorCode userInfo:userInfo];
            handler(error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/merchant/payment/session/{paymentSessionId}"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (paymentSessionId != nil) {
        pathParams[@"paymentSessionId"] = paymentSessionId;
    }

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (xMerchantID != nil) {
        headerParams[@"X-Merchant-ID"] = xMerchantID;
    }
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
    NSArray *authSettings = @[@"ApiKeyAuth"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];
    bodyParam = updatePaymentSessionRequest1;

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
