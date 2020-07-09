#import <Foundation/Foundation.h>
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
#import "OAIApi.h"

/**
* Village Wallet
* APIs for Village Wallet
*
* The version of the OpenAPI document: 0.0.4
* 
*
* NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
* https://openapi-generator.tech
* Do not edit the class manually.
*/



@interface OAICustomerApi: NSObject <OAIApi>

extern NSString* kOAICustomerApiErrorDomain;
extern NSInteger kOAICustomerApiMissingParamErrorCode;

-(instancetype) initWithApiClient:(OAIApiClient *)apiClient NS_DESIGNATED_INITIALIZER;

/// Get Payment Details
/// Get the details for a specific payment request so that the customer can pay using it
///
/// @param paymentRequestId The ID of the specific payment request
/// 
///  code:200 message:"Successful response",
///  code:400 message:"The specified Payment Request ID doesn't exist, has been used or is expired"
///
/// @return OAIGetCustomerPaymentResult*
-(NSURLSessionTask*) getCustomerPaymentDetailsByPaymentIdWithPaymentRequestId: (NSString*) paymentRequestId
    completionHandler: (void (^)(OAIGetCustomerPaymentResult* output, NSError* error)) handler;


/// Get Payment From QR
/// Get the details for a specific payment from a QR Code ID so that the customer can pay using it
///
/// @param qrId The ID of the specific QR Code
/// 
///  code:200 message:"Successful response",
///  code:400 message:"The specified QR Code ID doesn't exist or has been expired or the underlying payment request is no longer usable"
///
/// @return OAIGetCustomerPaymentResult*
-(NSURLSessionTask*) getCustomerPaymentDetailsByQRCodeIdWithQrId: (NSString*) qrId
    completionHandler: (void (^)(OAIGetCustomerPaymentResult* output, NSError* error)) handler;


/// Get Payment Instruments
/// Get the list of payment instruments currently configured for the customer.  Returns an array of instrument records that can be used to execute payments
///
/// 
///  code:200 message:"Successful response"
///
/// @return OAIGetCustomerPaymentInstrumentsResults*
-(NSURLSessionTask*) getCustomerPaymentInstrumentsWithCompletionHandler: 
    (void (^)(OAIGetCustomerPaymentInstrumentsResults* output, NSError* error)) handler;


/// Get Preferences
/// Get the preferences previously set by the customer or merchant (depending on calling identity)
///
/// 
///  code:200 message:"Successful response"
///
/// @return OAICustomerPreferencesResult*
-(NSURLSessionTask*) getCustomerPreferencesWithCompletionHandler: 
    (void (^)(OAICustomerPreferencesResult* output, NSError* error)) handler;


/// Get Transaction Details
/// Get the details for a specific transaction previously executed by the customer.  Note that amounts are relative to the merchant.  A positive amount is a positive amount transferred to a merchant
///
/// @param transactionId The ID of the specific transaction
/// 
///  code:200 message:"Successful response"
///
/// @return OAIGetCustomerTransactionDetailsResults*
-(NSURLSessionTask*) getCustomerTransactionDetailsWithTransactionId: (NSString*) transactionId
    completionHandler: (void (^)(OAIGetCustomerTransactionDetailsResults* output, NSError* error)) handler;


/// Get Transaction List
/// Get a list of the previously executed transactions for the customer.  Note that amounts are relative to the merchant.  A positive amount is a positive amount transferred to a merchant
///
/// @param paymentRequestId If present, limits the list of transactions to those that relate to the payment request (optional)
/// @param startTime If present, the date/time to limit transactions returned.  Transactions older than this time will not be returned (optional)
/// @param endTime If present, the date/time to limit transactions returned.  Transactions newer than this time will not be returned (optional)
/// @param pageSize The number of records to return for this page.  Defaults to 25 if absent (optional) (default to @25)
/// @param page The page of results to return with 1 indicating the first page.  Defaults to 1 if absent (optional) (default to @1)
/// 
///  code:200 message:"Successful response"
///
/// @return OAIGetCustomerTransactionsResult*
-(NSURLSessionTask*) getCustomerTransactionsWithPaymentRequestId: (NSString*) paymentRequestId
    startTime: (NSDate*) startTime
    endTime: (NSDate*) endTime
    pageSize: (NSNumber*) pageSize
    page: (NSNumber*) page
    completionHandler: (void (^)(OAIGetCustomerTransactionsResult* output, NSError* error)) handler;


/// Initiate Instrument Addition
/// Initiate the addition of a new payment instrument for this customer.  This API returns a URL to be used to access the DigiPay IFrame based interface to request the customer to enter a payment instrument details.
///
/// @param instrumentAdditionDetails 
/// 
///  code:200 message:"Successful response"
///
/// @return OAIInitiatePaymentInstrumentAdditionResults*
-(NSURLSessionTask*) initiatePaymentInstrumentAdditionWithInstrumentAdditionDetails: (OAIInstrumentAdditionDetails*) instrumentAdditionDetails
    completionHandler: (void (^)(OAIInitiatePaymentInstrumentAdditionResults* output, NSError* error)) handler;


/// Pay Payment
/// Pay a specific payment using the instrument details provided
///
/// @param paymentRequestId The ID of the specific payment request
/// @param customerPaymentDetails 
/// 
///  code:200 message:"Successful response"
///
/// @return OAIMakeCustomerPaymentResults*
-(NSURLSessionTask*) makeCustomerPaymentWithPaymentRequestId: (NSString*) paymentRequestId
    customerPaymentDetails: (OAICustomerPaymentDetails*) customerPaymentDetails
    completionHandler: (void (^)(OAIMakeCustomerPaymentResults* output, NSError* error)) handler;


/// Set Preferences
/// Change the preferences for the customer or merchant (depending on calling identity)
///
/// @param customerPreferences 
/// 
///  code:204 message:"Preferences successfully updated.  No content returned"
///
/// @return void
-(NSURLSessionTask*) setCustomerPreferencesWithCustomerPreferences: (OAICustomerPreferences*) customerPreferences
    completionHandler: (void (^)(NSError* error)) handler;



@end