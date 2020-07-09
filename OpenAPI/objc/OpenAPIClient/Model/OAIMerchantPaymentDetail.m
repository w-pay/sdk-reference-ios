#import "OAIMerchantPaymentDetail.h"

@implementation OAIMerchantPaymentDetail

- (instancetype)init {
  self = [super init];
  if (self) {
    // initialize property's default value, if any
    
  }
  return self;
}


/**
 * Maps json key to property name.
 * This method is used by `JSONModel`.
 */
+ (JSONKeyMapper *)keyMapper {
  return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{ @"paymentRequestId": @"paymentRequestId", @"merchantReferenceId": @"merchantReferenceId", @"grossAmount": @"grossAmount", @"usesRemaining": @"usesRemaining", @"expiryTime": @"expiryTime", @"specificWalletId": @"specificWalletId", @"basket": @"basket", @"posPayload": @"posPayload", @"merchantPayload": @"merchantPayload" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"usesRemaining", @"expiryTime", @"specificWalletId", @"basket", @"posPayload", @"merchantPayload"];
  return [optionalProperties containsObject:propertyName];
}

@end
