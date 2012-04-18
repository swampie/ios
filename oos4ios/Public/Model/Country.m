//
//  Country.m
//  oos4ios
//
//  Created by Matteo Fiandesio on 4/18/12.
//  Copyright (c) 2012 11870.com. All rights reserved.
//

#import "Country.h"

@implementation Country
-(Country*) initWithName:(NSString*) name 
                 andSlug:(NSString*) slug{
    self = [super initWithName:name andSlug:slug];
    self.type = @"Country";
    return self;
}
@end
