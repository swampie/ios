//
//  Venue.h
//  oos4ios
//
//  Created by Matteo Fiandesio on 4/12/12.
//  Copyright (c) 2012 11870.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+SBJson.h"
#import "Country.h"
#import "AdministrativeArea.h"
#import "SubAdministrativeArea.h"
#import "Locality.h"
#import "DependentLocality.h"
#import "SubDependentLocality.h"
@interface Venue : NSObject
    @property(nonatomic,strong)NSNumber* objectId;
    @property(nonatomic,weak) NSString* name;
    @property(nonatomic,strong)NSString* slug;
    @property(nonatomic,strong)NSString* userAddress;
    @property(nonatomic,strong)NSString* url;
    @property(nonatomic,strong)NSString* webAddress;
    @property(nonatomic,strong)NSNumber* latitude;
    @property(nonatomic,strong)NSNumber* longitude;
    @property(nonatomic,strong)NSMutableArray* categories;
    @property(nonatomic,strong)NSMutableArray* attributes;
    @property(nonatomic,strong)NSString* phone;
    @property(nonatomic,strong)NSArray* medias;
    @property(nonatomic,strong)NSMutableArray* rating;
    @property(nonatomic,strong)Country* country;
    @property(nonatomic,strong)AdministrativeArea* administrativeArea;
    @property(nonatomic,strong)SubAdministrativeArea* subAdministrativeArea;
    @property(nonatomic,strong)Locality* locality;
    @property(nonatomic,strong)DependentLocality* dependentLocality;
    @property(nonatomic,strong)SubDependentLocality *subDependentLocality;

-(id)proxyForJson;
@end
