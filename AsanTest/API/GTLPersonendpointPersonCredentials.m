/* This file was generated by the ServiceGenerator.
 * The ServiceGenerator is Copyright (c) 2014 Google Inc.
 */

//
//  GTLPersonendpointPersonCredentials.m
//

// ----------------------------------------------------------------------------
// NOTE: This file is generated from Google APIs Discovery Service.
// Service:
//   personendpoint/v1
// Description:
//   This is an API
// Classes:
//   GTLPersonendpointPersonCredentials (0 custom class methods, 9 custom properties)

#import "GTLPersonendpointPersonCredentials.h"

#import "GTLPersonendpointPersonProfile.h"

// ----------------------------------------------------------------------------
//
//   GTLPersonendpointPersonCredentials
//

@implementation GTLPersonendpointPersonCredentials
@dynamic createdDate, email, identifier, loginProviderType, modifiedDate, owner,
         profilePhotoUrl, token, userId;

+ (NSDictionary *)propertyToJSONKeyMap {
  NSDictionary *map =
    [NSDictionary dictionaryWithObject:@"id"
                                forKey:@"identifier"];
  return map;
}

@end