//
//  Attribute.m
//  oos4ios
//
//  Created by Matteo Fiandesio on 4/12/12.
//  Copyright (c) 2012 11870.com. All rights reserved.
//

#import "Attribute.h"

@implementation Attribute
    @synthesize attributeGroup = _attributeGroup; 
    @synthesize parentCategory =_parentCategory;

-(id)proxyForJson{
    
    return [NSDictionary dictionaryWithObjectsAndKeys:
            [super term],@"term",
            [super label],@"label",
            _attributeGroup, @"attributeGroup",
            _parentCategory,@"parentCategory",
            nil ];
}
@end
