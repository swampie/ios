//
//  MethodApiUrlProvider.h
//  oos4ios
//
//  Created by Matteo Fiandesio on 4/12/12.
//  Copyright (c) 2012 11870.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ApiUrlProvider.h"

@interface MethodApiUrlProvider : ApiUrlProvider

-(NSString *) search;
-(NSString *) user:(NSString *) slug;
-(NSString *) site:(NSString *) slug;
-(NSString *) review:(NSString *) userSlug 
             forSite:(NSString *) siteSlug;
-(NSString *) siteDetails:(NSString *) slug;
-(NSString *) userMedia:(NSString *)userSlug 
                forSite:(NSString *) siteSlug;
-(NSString *) siteMedia:(NSString *) slug;
-(NSString *) media:(NSString *) userSlug 
            forSite:(NSString *)siteSlug 
                fnv:(NSString *) fnv;
-(NSString *) users;
-(NSString *) contacts:(NSString *) slug;
-(NSString *) contact:(NSString *) userSlug 
          contactSlug:(NSString *) contactSlug;
-(NSString *) userCheckins:(NSString *) userSlug;
-(NSString *) siteCheckins:(NSString *) siteSlug;
-(NSString *) featuredSite;
-(NSString *) categories;
-(NSString *) attributes;
//-(NSString *) attributes:(NSString *)parentCategory;
-(NSString *) myActivities:(NSString *) slug;
-(NSString *) socialActivities:(NSString *) slug;
@end
