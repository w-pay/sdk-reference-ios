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
#import "OAIGetCustomerPaymentInstrumentsResultsDataEverydayPay.h"
#import "OAIGiftCard.h"
@protocol OAICreditCard;
@class OAICreditCard;
@protocol OAIGetCustomerPaymentInstrumentsResultsDataEverydayPay;
@class OAIGetCustomerPaymentInstrumentsResultsDataEverydayPay;
@protocol OAIGiftCard;
@class OAIGiftCard;



@protocol OAIGetCustomerPaymentInstrumentsResultsData
@end

@interface OAIGetCustomerPaymentInstrumentsResultsData : OAIObject


@property(nonatomic) NSArray<OAICreditCard>* creditCards;

@property(nonatomic) NSArray<OAIGiftCard>* giftCards;

@property(nonatomic) OAIGetCustomerPaymentInstrumentsResultsDataEverydayPay* everydayPay;

@end
