//
//  SearchFilter.m
//  oos4ios
//
//  Created by Matteo Fiandesio on 4/17/12.
//  Copyright (c) 2012 11870.com. All rights reserved.
//

#import "SearchFilter.h"



@implementation SearchFilter
    
@synthesize query = _query;
@synthesize latitude = _latitude;
@synthesize longitude = _longitude;
@synthesize radius = _radius;
@synthesize areaSlug = _areaSlug;
@synthesize tags = _tags;
@synthesize tagOperator = _tagOperator;

-(SearchFilter *) init {
    if(self = [super init]){
        
    }
    return self;
}

-(NSMutableSet *) tags{
    if(_tags == nil){
        _tags = [[NSMutableSet alloc] init];
    }
    return _tags;
}

-(NSMutableDictionary *) asParams{
    NSMutableArray *objs = [[NSMutableArray alloc] init ];
    NSMutableArray *keys = [[NSMutableArray alloc] init ];
    if(_query){
        [objs addObject:_query];
        [keys addObject:@"q"];
    }
    if(_latitude && _longitude && _radius){
        [objs addObject:_latitude];
        [keys addObject:@"lat"];
        [objs addObject:_longitude];
        [keys addObject:@"lon"];
        [objs addObject:_radius];
        [keys addObject:@"r"];
    }

    if(_areaSlug){
        [objs addObject:_areaSlug];
        [keys addObject:@"as"];
    }
    
    if(_tags){
        [objs addObject:_tags];
        [keys addObject:@"tags"];
        if(_tagOperator == 1){
            [objs addObject:@"or"];
        }else{
            [objs addObject:@"and"];
        }
        [keys addObject:@"tagOp"];
    }
    
    
    return [[NSMutableDictionary alloc]initWithObjects:objs forKeys:keys];

}


    
@end
