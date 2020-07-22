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


#import "OAIQr.h"
@protocol OAIQr;
@class OAIQr;



@protocol OAICreateMerchantPaymentSessionResponseData
@end

@interface OAICreateMerchantPaymentSessionResponseData : OAIObject

/* The ID of the new payment session 
 */
@property(nonatomic) NSString* paymentSessionId;

@property(nonatomic) OAIQr* qr;

@end
