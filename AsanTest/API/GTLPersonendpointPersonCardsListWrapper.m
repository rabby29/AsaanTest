/* This file was generated by the ServiceGenerator.
 * The ServiceGenerator is Copyright (c) 2014 Google Inc.
 */

//
//  GTLPersonendpointPersonCardsListWrapper.m
//

// ----------------------------------------------------------------------------
// NOTE: This file is generated from Google APIs Discovery Service.
// Service:
//   personendpoint/v1
// Description:
//   This is an API
// Classes:
//   GTLPersonendpointPersonCardsListWrapper (0 custom class methods, 1 custom properties)

#import "GTLPersonendpointPersonCardsListWrapper.h"

#import "GTLPersonendpointPersonCards.h"

// ----------------------------------------------------------------------------
//
//   GTLPersonendpointPersonCardsListWrapper
//

@implementation GTLPersonendpointPersonCardsListWrapper
@dynamic cardList;

+ (NSDictionary *)arrayPropertyToClassMap {
  NSDictionary *map =
    [NSDictionary dictionaryWithObject:[GTLPersonendpointPersonCards class]
                                forKey:@"cardList"];
  return map;
}

@end
