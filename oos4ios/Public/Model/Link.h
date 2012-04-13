//
//  Link.h
//  oos4ios
//
//  Created by Matteo Fiandesio on 4/12/12.
//  Copyright (c) 2012 11870.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Link : NSObject
    
@property(nonatomic,strong,readonly) NSString* href;
@property(nonatomic,strong,readonly) NSString* rel;
    
@end
