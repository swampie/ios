//
//  SearchFilter.h
//  oos4ios
//
//  Created by Matteo Fiandesio on 4/17/12.
//  Copyright (c) 2012 11870.com. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum OosTagOperator{
    operator_NIL = 0,
    operator_OR = 1,
    operator_AND = 2
}OosTagOperator;

@interface SearchFilter : NSObject
    
    @property(nonatomic,strong) NSString* query;
    @property(nonatomic,strong) NSNumber* latitude;
    @property(nonatomic,strong) NSNumber* longitude;
    @property(nonatomic,strong) NSNumber* radius;
    @property(nonatomic,strong) NSString* areaSlug;
    @property(nonatomic,strong) NSMutableSet* tags;
    @property OosTagOperator tagOperator;
    

    -(NSDictionary *) asParams;
    
    
@end
