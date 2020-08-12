#import <Foundation/Foundation.h>
#import "OAIObject.h"

/**
* Village Wallet
* APIs for Village Wallet
*
* The version of the OpenAPI document: 0.0.5
* 
*
* NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
* https://openapi-generator.tech
* Do not edit the class manually.
*/


#import "OAICustomerPaymentsPaymentRequestIdDataSecondaryInstruments.h"
@protocol OAICustomerPaymentsPaymentRequestIdDataSecondaryInstruments;
@class OAICustomerPaymentsPaymentRequestIdDataSecondaryInstruments;



@protocol OAICustomerPaymentsPaymentRequestIdData
@end

@interface OAICustomerPaymentsPaymentRequestIdData : OAIObject

/* The Id of the primary instrument.  Will be used as the balance of the transaction 
 */
@property(nonatomic) NSString* primaryInstrumentId;
/* The secondary instruments (if any) used to partially make the payment 
 */
@property(nonatomic) NSArray<OAICustomerPaymentsPaymentRequestIdDataSecondaryInstruments>* secondaryInstruments;

@end