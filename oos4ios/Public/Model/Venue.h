//
//  Venue.h
//  oos4ios
//
//  Created by Matteo Fiandesio on 4/12/12.
//  Copyright (c) 2012 11870.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Venue : NSObject
    @property(nonatomic,strong,readonly)NSNumber* objectId;
    @property(nonatomic,strong)NSString* slug;
    @property(nonatomic,strong)NSString* userAddress;
    @property(nonatomic)double latitude;
    @property(nonatomic)double longitude;
    @property(nonatomic,strong)NSSet* categories;
    @property(nonatomic,strong)NSSet* attributes;
    @property(nonatomic,strong)NSString* phone;
    @property(nonatomic,strong)NSSet* medias;
@end
