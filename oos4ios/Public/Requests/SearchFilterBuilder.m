//
//  SearchFilterBuilder.m
//  oos4ios
//
//  Created by Matteo Fiandesio on 4/18/12.
//  Copyright (c) 2012 11870.com. All rights reserved.
//

#import "SearchFilterBuilder.h"
#import "SearchFilter.h"

@implementation SearchFilterBuilder

@synthesize filter = _filter;

-(SearchFilterBuilder *) buildNewFilter{
    _filter = nil;
    _filter = [[SearchFilter alloc]init ];
    return self;
}

-(SearchFilter *) filter {
    if(_filter == nil){
        [self buildNewFilter];
    }
    return _filter;
}

-(SearchFilterBuilder *) addQuery:(NSString *)searchQuery{
    _filter.query = searchQuery;
    return self;
}

-(SearchFilterBuilder *) addLatitude:(NSNumber *)latitude longitude:(NSNumber *)longitude radius:(NSNumber *)radius{
    _filter.latitude = latitude;
    _filter.longitude = longitude;
    _filter.radius = radius;
    return self;
}

-(SearchFilterBuilder *) addAreaSlug:(NSString *)areaSlug{
    _filter.areaSlug = areaSlug;
    return self;
}

-(SearchFilterBuilder *) addTag:(NSString *)tag withOperator:(OosTagOperator)op{
    if(op==0){
        _filter.tagOperator = operator_OR;   
    }else{
        _filter.tagOperator = op;
    }
    [_filter.tags addObject:tag];
    return self;
}


@end
