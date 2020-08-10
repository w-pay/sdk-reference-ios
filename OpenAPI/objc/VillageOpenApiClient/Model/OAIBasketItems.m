#import "OAIBasketItems.h"

@implementation OAIBasketItems

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
  return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{ @"label": @"label", @"_description": @"description", @"quantity": @"quantity", @"unitPrice": @"unitPrice", @"unitMeasure": @"unitMeasure", @"totalPrice": @"totalPrice", @"tags": @"tags" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"_description", @"quantity", @"unitPrice", @"unitMeasure", @"totalPrice", @"tags"];
  return [optionalProperties containsObject:propertyName];
}

@end
