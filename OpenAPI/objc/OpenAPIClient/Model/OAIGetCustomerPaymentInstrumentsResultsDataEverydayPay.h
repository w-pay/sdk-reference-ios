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


#import "OAICreditCard.h"
#import "OAIGiftCard.h"
@protocol OAICreditCard;
@class OAICreditCard;
@protocol OAIGiftCard;
@class OAIGiftCard;



@protocol OAIGetCustomerPaymentInstrumentsResultsDataEverydayPay
@end

@interface OAIGetCustomerPaymentInstrumentsResultsDataEverydayPay : OAIObject


@property(nonatomic) NSArray<OAICreditCard>* creditCards;

@property(nonatomic) NSArray<OAIGiftCard>* giftCards;

@end