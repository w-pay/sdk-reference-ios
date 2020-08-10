#import "OAICreditCard.h"

@implementation OAICreditCard

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
  return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{ @"paymentInstrumentId": @"paymentInstrumentId", @"paymentToken": @"paymentToken", @"status": @"status", @"lastUpdated": @"lastUpdated", @"lastUsed": @"lastUsed", @"primary": @"primary", @"allowed": @"allowed", @"expiryYear": @"expiryYear", @"expiryMonth": @"expiryMonth", @"scheme": @"scheme", @"cardSuffix": @"cardSuffix", @"cvvValidated": @"cvvValidated", @"cardName": @"cardName", @"expired": @"expired", @"requiresCVV": @"requiresCVV", @"updateURL": @"updateURL", @"stepUp": @"stepUp" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"lastUsed", ];
  return [optionalProperties containsObject:propertyName];
}

@end
