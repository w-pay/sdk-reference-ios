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


#import "OAICustomerTransactionSummary.h"
@protocol OAICustomerTransactionSummary;
@class OAICustomerTransactionSummary;



@protocol OAIGetCustomerTransactionsResultData
@end

@interface OAIGetCustomerTransactionsResultData : OAIObject

/* The resulting list of transactions.  If no results match the request then an empty array will be returned 
 */
@property(nonatomic) NSArray<OAICustomerTransactionSummary>* transactions;

@end