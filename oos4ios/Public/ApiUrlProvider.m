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
    return [NSString stringWithFormat:@"/%@",SEARCH];
}

-(NSString *) user:(NSString *)slug{
    return [NSString stringWithFormat:@"/%@/%@",USER,slug];
}

-(NSString *) site:(NSString *)slug{
    return [NSString stringWithFormat:@"/%@/%@",SITE,slug];
}


-(NSString *) review:(NSString *)userSlug forSite:(NSString *)siteSlug
{
    return [NSString stringWithFormat:@"/%@/%@/%@",SITE,userSlug,siteSlug];
}

-(NSString *) siteDetails:(NSString *)slug{
    return [NSString stringWithFormat:@"/%@/%@",SITE_DETAILS,slug];
}

-(NSString *) userMedia:(NSString *)userSlug forSite:(NSString *)siteSlug
{
    return [NSString stringWithFormat:@"/%@/%@/%@/%@",SITE,userSlug,siteSlug,MEDIA];
}

-(NSString *) siteMedia:(NSString *)slug{
    return [NSString stringWithFormat:@"/%@/%@",SITE_MEDIA,slug];
}

-(NSString *) media:(NSString *)userSlug forSite:(NSString *)siteSlug fnv:(NSString *)fnv{
    return [NSString stringWithFormat:@"/%@/%@/%@/%@/%@",SITE,userSlug,siteSlug,MEDIA,fnv];
}

-(NSString *) users{
    return [NSString stringWithFormat:@"/%@",USER];
}

-(NSString *) contacts:(NSString *)slug{
    return [NSString stringWithFormat:@"/%@/%@",CONTACTS,slug];
}

- (NSString *) contact:(NSString *)userSlug contactSlug:(NSString *)contactSlug{
    return [[self contacts:userSlug] stringByAppendingFormat:@"/%@",contactSlug];
}

-(NSString *) userCheckins:(NSString *)userSlug{
    return [NSString stringWithFormat:@"/%@/user/%@",CHECKINS,userSlug];
}

-(NSString *) siteCheckins:(NSString *)siteSlug{
    return [NSString stringWithFormat:@"/%@/site/%@",CHECKINS,siteSlug];
}

-(NSString *) featuredSite{
    return [NSString stringWithFormat:@"/%@",FEATURED_SITE];
}

-(NSString *) categories{
    return [NSString stringWithFormat:@"/%@",CATEGORIES];
}

-(NSString *) attributes{
    return [NSString stringWithFormat:@"/%@",ATTRIBUTES];
}

-(NSString *)myActivities:(NSString *)slug{
    return [NSString stringWithFormat:@"/%@/%@",ACTIVITY,slug];
}

-(NSString *)socialActivities:(NSString *)slug{
    return [NSString stringWithFormat:@"/%@/%@",SOCIAL_ACTIVITY,slug];
}



@end

