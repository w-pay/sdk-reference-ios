#import "OAIGiftCard.h"

@implementation OAIGiftCard

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
  return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{ @"paymentInstrumentId": @"paymentInstrumentId", @"paymentToken": @"paymentToken", @"status": @"status", @"lastUpdated": @"lastUpdated", @"lastUsed": @"lastUsed", @"primary": @"primary", @"allowed": @"allowed", @"programName": @"programName", @"cardSuffix": @"cardSuffix", @"stepUp": @"stepUp" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"lastUsed", @"stepUp"];
  return [optionalProperties containsObject:propertyName];
}

@end
