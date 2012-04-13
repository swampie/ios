//
//  ApiUrlProvider.m
//  oos4ios
//
//  Created by Matteo Fiandesio on 4/11/12.
//  Copyright (c) 2012 11870.com. All rights reserved.
//

#import "ApiUrlProvider.h"
#import "Constants.h"
@interface ApiUrlProvider()
- (NSString *) setValue:(NSString *)checkForNull 
            orOtherwise:(NSString *) defaultValue;

@end

@implementation ApiUrlProvider

@synthesize basePath = _basePath;
@synthesize server = _server;
@synthesize search = _search;
@synthesize protocol = _protocol;
@synthesize subdomain = _subdomain;

static ApiUrlProvider *instance;

+(ApiUrlProvider *) provider
{
    if(!instance){
        instance = [[ApiUrlProvider alloc] init];
        [instance build];
    }
    return instance;
}

-(void) build{
    NSDictionary *environment = [[NSProcessInfo processInfo]environment];
    NSString *protocolFromEnvironment = [environment objectForKey:@"PROTOCOL"];
    NSString *serverFromEnvironment = [environment objectForKey:@"SERVER"];
    NSString *subDomainFromEnvironment = [environment objectForKey:@"SUBDOMAIN"];
    NSString *basePathFromEnvironment = [environment objectForKey:@"BASE_PATH"];
    //Initialize protocol based on environment
    
    self.protocol = [self setValue:protocolFromEnvironment orOtherwise:HTTPS];
    
    //Initialize server value from environment
    self.server = [self setValue:serverFromEnvironment orOtherwise:SERVER];
    //Initialize subdomain value from environment
    self.subdomain = [self setValue:subDomainFromEnvironment orOtherwise:SUBDOMAIN];
    //Initialize base path from environment
    self.basePath = [self  setValue:basePathFromEnvironment orOtherwise:BASE_PATH];
    
    
}

-(NSString *) setValue:(NSString *)checkForNull orOtherwise:(NSString *)defaultValue{
    if(!checkForNull){
        return defaultValue;
    }else{
        return checkForNull;
    }
}

-(NSString *) getUrl {
    return [NSString stringWithFormat:@"%@://%@%@%@",self.protocol,self.subdomain,self.server,self.basePath];
}

-(void) empty{
    instance = nil;
}

-(NSString *) search{
    return [[self getUrl] stringByAppendingFormat:@"/%@",SEARCH];
}

-(NSString *) user:(NSString *)slug{
    return [[self getUrl] stringByAppendingFormat:@"/%@/%@",USER,slug];
}

-(NSString *) site:(NSString *)slug{
    return [[self getUrl] stringByAppendingFormat:@"/%@/%@",SITE,slug];
}


-(NSString *) review:(NSString *)userSlug forSite:(NSString *)siteSlug
{
    return [[self getUrl] stringByAppendingFormat:@"/%@/%@/%@",SITE,userSlug,siteSlug];
}

-(NSString *) siteDetails:(NSString *)slug{
    return [[self getUrl] stringByAppendingFormat:@"/%@/%@",SITE_DETAILS,slug];
}

-(NSString *) userMedia:(NSString *)userSlug forSite:(NSString *)siteSlug
{
    return [[self getUrl] stringByAppendingFormat:@"/%@/%@/%@/%@",SITE,userSlug,siteSlug,MEDIA];
}

-(NSString *) siteMedia:(NSString *)slug{
    return [[self getUrl] stringByAppendingFormat:@"/%@/%@",SITE_MEDIA,slug];
}

-(NSString *) media:(NSString *)userSlug forSite:(NSString *)siteSlug fnv:(NSString *)fnv{
    return [[self getUrl] stringByAppendingFormat:@"/%@/%@/%@/%@/%@",SITE,userSlug,siteSlug,MEDIA,fnv];
}

-(NSString *) users{
    return [[self getUrl] stringByAppendingFormat:@"/%@",USER];
}

-(NSString *) contacts:(NSString *)slug{
    return [[self getUrl] stringByAppendingFormat:@"/%@/%@",CONTACTS,slug];
}

- (NSString *) contact:(NSString *)userSlug contactSlug:(NSString *)contactSlug{
    return [[self contacts:userSlug] stringByAppendingFormat:@"/%@",contactSlug];
}

-(NSString *) userCheckins:(NSString *)userSlug{
    return [[self getUrl] stringByAppendingFormat:@"/%@/user/%@",CHECKINS,userSlug];
}

-(NSString *) siteCheckins:(NSString *)siteSlug{
    return [[self getUrl] stringByAppendingFormat:@"/%@/site/%@",CHECKINS,siteSlug];
}

-(NSString *) featuredSite{
    return [[self getUrl] stringByAppendingFormat:@"/%@",FEATURED_SITE];
}

-(NSString *) categories{
    return [[self getUrl] stringByAppendingFormat:@"/%@",CATEGORIES];
}

-(NSString *) attributes{
    return [[self getUrl] stringByAppendingFormat:@"/%@",ATTRIBUTES];
}

-(NSString *)myActivities:(NSString *)slug{
    return [[self getUrl] stringByAppendingFormat:@"/%@/%@",ACTIVITY,slug];
}

-(NSString *)socialActivities:(NSString *)slug{
    return [[self getUrl] stringByAppendingFormat:@"/%@/%@",SOCIAL_ACTIVITY,slug];
}



@end

