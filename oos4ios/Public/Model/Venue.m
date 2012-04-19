//
//  Venue.m
//  oos4ios
//
//  Created by Matteo Fiandesio on 4/12/12.
//  Copyright (c) 2012 11870.com. All rights reserved.
//

#import "Venue.h"

@implementation Venue
@synthesize objectId = _objectId;
@synthesize name = _name;
@synthesize slug = _slug;
@synthesize userAddress = _userAddress;
@synthesize url = _url;
@synthesize webAddress = _webAddress;
@synthesize latitude = _latitude;
@synthesize longitude = _longitude;
@synthesize categories = _categories;
@synthesize attributes = _attributes;
@synthesize phone = _phone;
@synthesize medias = _medias;
@synthesize rating = _rating;
@synthesize country = _country;
@synthesize administrativeArea = _administrativeArea;
@synthesize subAdministrativeArea = _subAdministrativeArea;
@synthesize locality = _locality;
@synthesize dependentLocality = _dependentLocality;
@synthesize subDependentLocality = _subDependentLocality;

#pragma mark LAAAZYYYY
-(NSMutableArray*)attributes{
    if(!_attributes){
        _attributes = [[NSMutableArray alloc] init];
    }
    return _attributes;
}

-(void)addNotNull:(id) property
                       withKey:(NSString*) key
     toDictionary:(NSMutableDictionary *)dict{
    if(property){
        [dict setObject:property forKey:key];
    }

}

/**
 * TODO: method breaks if one of Venue's component is nil...
 * FIXME: refactor
 **/
-(id)proxyForJson{
    NSMutableDictionary* params =  [NSMutableDictionary dictionaryWithObjectsAndKeys:
            _objectId, @"id",
            _name  , @"name",
            _slug  , @"slug",
            _url, @"url",nil];
    [self addNotNull:_latitude withKey:@"latitude" toDictionary:params];
    [self addNotNull:_longitude withKey:@"longitude" toDictionary:params];
    [self addNotNull:_phone withKey:@"phone" toDictionary:params];
    [self addNotNull:_attributes withKey:@"attributes" toDictionary:params];
    [self addNotNull:_country withKey:@"country" toDictionary:params];
    [self addNotNull:_administrativeArea withKey:@"administrativearea" toDictionary:params];
    [self addNotNull:_subAdministrativeArea withKey:@"subadministrativearea" toDictionary:params];
    [self addNotNull:_locality withKey:@"locality" toDictionary:params];
    [self addNotNull:_dependentLocality withKey:@"dependentlocality" toDictionary:params];
    [self addNotNull:_subDependentLocality withKey:@"subDependentlocality" toDictionary:params];
    [self addNotNull:_userAddress withKey:@"address" toDictionary:params];
    [self addNotNull:_webAddress withKey:@"web" toDictionary:params];
    return [NSDictionary dictionaryWithDictionary:params];
}



@end
