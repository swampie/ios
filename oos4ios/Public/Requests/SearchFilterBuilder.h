//
//  SearchFilterBuilder.h
//  oos4ios
//
//  Created by Matteo Fiandesio on 4/18/12.
//  Copyright (c) 2012 11870.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchFilter.h"
@interface SearchFilterBuilder : NSObject

@property(nonatomic,readonly,strong) SearchFilter* filter;
-(SearchFilterBuilder *) buildNewFilter;
-(SearchFilterBuilder *) addQuery:(NSString* )searchQuery;
-(SearchFilterBuilder *) addLatitude:(NSNumber*) latitude
                    longitude:(NSNumber*)longitude
                       radius:(NSNumber *) radius;
-(SearchFilterBuilder *) addAreaSlug:(NSString *) areaSlug;
-(SearchFilterBuilder *) addTag:(NSString *) tag 
            withOperator:(OosTagOperator) op;

@end
