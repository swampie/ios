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

/**
 * TODO: method breaks if one of Venue's component is nil...
 * FIXME: refactor
 **/
-(id)proxyForJson{
    return [NSDictionary dictionaryWithObjectsAndKeys:
            _objectId, @"id",
            _name  , @"name",
            _slug  , @"slug",
            _userAddress, @"address",
            _webAddress,@"webaddress",
            _url,@"url",
            _latitude,@"latitude",
            _longitude,@"longitude",
            _phone,@"phone",
            _attributes ,@"attributes",
            nil ];
}

@end
