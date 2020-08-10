#import "OAIMerchantTransactionDetail.h"

@implementation OAIMerchantTransactionDetail

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
  return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{ @"transactionId": @"transactionId", @"type": @"type", @"executionTime": @"executionTime", @"status": @"status", @"statusDetail": @"statusDetail", @"refundReason": @"refundReason", @"paymentRequestId": @"paymentRequestId", @"merchantReferenceId": @"merchantReferenceId", @"grossAmount": @"grossAmount", @"walletId": @"walletId", @"basket": @"basket", @"posPayload": @"posPayload", @"merchantPayload": @"merchantPayload" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"statusDetail", @"refundReason", @"basket", @"posPayload", @"merchantPayload"];
  return [optionalProperties containsObject:propertyName];
}

@end
