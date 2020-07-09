#import "OAIMerchantPaymentsData.h"

@implementation OAIMerchantPaymentsData

- (instancetype)init {
  self = [super init];
  if (self) {
    // initialize property's default value, if any
    self.generateQR = @(NO);
    self.maxUses = @1;
    self.timeToLivePayment = @0;
    self.timeToLiveQR = @0;
    
  }
  return self;
}


/**
 * Maps json key to property name.
 * This method is used by `JSONModel`.
 */
+ (JSONKeyMapper *)keyMapper {
  return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{ @"merchantReferenceId": @"merchantReferenceId", @"grossAmount": @"grossAmount", @"generateQR": @"generateQR", @"maxUses": @"maxUses", @"timeToLivePayment": @"timeToLivePayment", @"timeToLiveQR": @"timeToLiveQR", @"specificWalletId": @"specificWalletId", @"basket": @"basket", @"posPayload": @"posPayload", @"merchantPayload": @"merchantPayload" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"generateQR", @"maxUses", @"timeToLivePayment", @"timeToLiveQR", @"specificWalletId", @"basket", @"posPayload", @"merchantPayload"];
  return [optionalProperties containsObject:propertyName];
}

@end
