//
//  List.h
//  oos4ios
//
//  Created by Matteo Fiandesio on 4/17/12.
//  Copyright (c) 2012 11870.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface List : NSObject
   @property (nonatomic,strong)NSArray* entries;
   @property (nonatomic,strong)NSNumber* page;
   @property (nonatomic,strong)NSNumber* totalObjectsCount; 
   @property (nonatomic,strong)NSNumber* pageObjectsCount;
@end
