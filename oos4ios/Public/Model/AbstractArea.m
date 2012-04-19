//
//  AbstractArea.m
//  oos4ios
//
//  Created by Matteo Fiandesio on 4/18/12.
//  Copyright (c) 2012 11870.com. All rights reserved.
//

#import "AbstractArea.h"
#import "NSObject+SBJson.h"
@implementation AbstractArea

@synthesize name = _name;
@synthesize slug = _slug;
@synthesize type = _type;

-(id<AbstractAreaProtocol>) initWithName:(NSString*) name 
                      andSlug:(NSString*) slug{
    self = [super init];
    _name = name;
    _slug = slug;
    return self;
}

-(id)proxyForJson{
    return [NSDictionary dictionaryWithObjectsAndKeys:
                                                _name,@"name",
                                                _slug,@"slug",
            nil ];
}


@end
