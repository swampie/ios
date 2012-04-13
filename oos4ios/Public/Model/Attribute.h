//
//  Attribute.h
//  oos4ios
//
//  Created by Matteo Fiandesio on 4/12/12.
//  Copyright (c) 2012 11870.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Category.h"
@interface Attribute : Category
    @property(nonatomic,readonly,strong) NSString* attributeGroup;
    @property(nonatomic,readonly,strong) NSString* parentCategory;
@end
