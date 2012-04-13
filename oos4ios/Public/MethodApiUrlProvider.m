//
//  MethodApiUrlProvider.m
//  oos4ios
//
//  Created by Matteo Fiandesio on 4/12/12.
//  Copyright (c) 2012 11870.com. All rights reserved.
//

#import "MethodApiUrlProvider.h"
#import "Constants.h"

static MethodApiUrlProvider * _instance = nil; 
@implementation MethodApiUrlProvider

+ (MethodApiUrlProvider *) provider{
    if(!_instance){
        _instance = [[MethodApiUrlProvider alloc] init];
        [_instance build];
    }
    return _instance;
}

-(NSString *) search{
    return [[super getUrl] stringByAppendingFormat:@"/%@",SEARCH];
}

-(NSString *) user:(NSString *)slug{
    return [[super getUrl] stringByAppendingFormat:@"/%@/%@",USER,slug];
}

-(NSString *) site:(NSString *)slug{
    return [[super getUrl] stringByAppendingFormat:@"/%@/%@",SITE,slug];
}


-(NSString *) review:(NSString *)userSlug forSite:(NSString *)siteSlug
{
    return [[super getUrl] stringByAppendingFormat:@"/%@/%@/%@",SITE,userSlug,siteSlug];
}

-(NSString *) siteDetails:(NSString *)slug{
    return [[super getUrl] stringByAppendingFormat:@"/%@/%@",SITE_DETAILS,slug];
}

-(NSString *) userMedia:(NSString *)userSlug forSite:(NSString *)siteSlug
{
    return [[super getUrl] stringByAppendingFormat:@"/%@/%@/%@/%@",SITE,userSlug,siteSlug,MEDIA];
}

-(NSString *) siteMedia:(NSString *)slug{
    return [[super getUrl] stringByAppendingFormat:@"/%@/%@",SITE_MEDIA,slug];
}

-(NSString *) media:(NSString *)userSlug forSite:(NSString *)siteSlug fnv:(NSString *)fnv{
    return [[super getUrl] stringByAppendingFormat:@"/%@/%@/%@/%@/%@/",SITE,userSlug,siteSlug,MEDIA,fnv];
}

-(NSString *) users{
    return [[super getUrl] stringByAppendingFormat:@"/%@",USER];
}

-(NSString *) contacts:(NSString *)slug{
    return [[super getUrl] stringByAppendingFormat:@"/%@/%@",CONTACTS,slug];
}

- (NSString *) contact:(NSString *)userSlug contactSlug:(NSString *)contactSlug{
    return [[self contacts:userSlug] stringByAppendingFormat:@"/%@",contactSlug];
}

-(NSString *) userCheckins:(NSString *)userSlug{
    return [[super getUrl] stringByAppendingFormat:@"/%@/user/%@",CHECKINS,userSlug];
}

-(NSString *) siteCheckins:(NSString *)siteSlug{
    return [[super getUrl] stringByAppendingFormat:@"/%@/site/%@",CHECKINS,siteSlug];
}

-(NSString *) featuredSite{
    return [[super getUrl] stringByAppendingFormat:@"/%@",FEATURED_SITE];
}

-(NSString *) categories{
    return [[super getUrl] stringByAppendingFormat:@"/%@",CATEGORIES];
}

-(NSString *) attributes{
    return [[super getUrl] stringByAppendingFormat:@"/%@",ATTRIBUTES];
}

-(NSString *)myActivities:(NSString *)slug{
    return [[super getUrl] stringByAppendingFormat:@"/%@/%@",ACTIVITY,slug];
}

-(NSString *)socialActivities:(NSString *)slug{
    return [[super getUrl] stringByAppendingFormat:@"/%@/%@",SOCIAL_ACTIVITY,slug];
}


@end
