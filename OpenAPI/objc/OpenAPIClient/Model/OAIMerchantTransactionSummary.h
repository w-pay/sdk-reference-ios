#import <Foundation/Foundation.h>
#import "OAIObject.h"

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


#import "OAICommonTransactionSummary.h"
#import "OAIMerchantTransactionSummaryAllOf.h"
@protocol OAICommonTransactionSummary;
@class OAICommonTransactionSummary;
@protocol OAIMerchantTransactionSummaryAllOf;
@class OAIMerchantTransactionSummaryAllOf;



@protocol OAIMerchantTransactionSummary
@end

@interface OAIMerchantTransactionSummary : OAIObject

/* The ID of the transaction 
 */
@property(nonatomic) NSString* transactionId;
/* The type of transaction: PAYMENT or REFUND 
 */
@property(nonatomic) NSString* type;
/* Date/time stamp of when the transaction occurred in ISO string format 
 */
@property(nonatomic) NSDate* executionTime;
/* The current status of the transactions 
 */
@property(nonatomic) NSString* status;
/* The reason provided for the refund.  Only provided for REFUND transactions [optional]
 */
@property(nonatomic) NSString* refundReason;
/* The ID of this payment request 
 */
@property(nonatomic) NSString* paymentRequestId;
/* The unique reference for the payment as defined by the Merchant 
 */
@property(nonatomic) NSString* merchantReferenceId;
/* The gross amount to be paid.  Must be positive except for refunds 
 */
@property(nonatomic) NSNumber* grossAmount;
/* The ID of the wallet associated with this transaction 
 */
@property(nonatomic) NSString* walletId;

@end