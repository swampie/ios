//
//  SubAdministrativeArea.m
//  oos4ios
//
//  Created by Matteo Fiandesio on 4/18/12.
//  Copyright (c) 2012 11870.com. All rights reserved.
//

#import "SubAdministrativeArea.h"

@implementation SubAdministrativeArea

-(id<AbstractAreaProtocol>)initWithName:(NSString *)name andSlug:(NSString *)slug{
    self = [super initWithName:name andSlug:slug];
    self.type = @"SubAdministrativeArea";
    return self;
}
@end
