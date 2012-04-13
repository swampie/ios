//
//  oos4ios_test.m
//  oos4ios-test
//
//  Created by Matteo Fiandesio on 4/11/12.
//  Copyright (c) 2012 11870.com All rights reserved.
//

#import "oos4ios_test.h"
#import "ApiUrlProvider.h"
@implementation oos4ios_test
@synthesize provider = _provider;

-(ApiUrlProvider *) provider
{
    if(!_provider){
        _provider = [ApiUrlProvider provider];
    }
    return _provider;
}

- (void)setUp
{
    [super setUp];
    
    
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{
    STAssertNotNil(self.provider, @"Assert object initialization");
    STAssertEqualObjects([self.provider getUrl], @"https://api.11870.com/api/v2", @"Test building address");
    [self.provider empty];
    _provider = nil;

}

- (void)testChangingValue{
    self.provider.server = @"11870.org";
    self.provider.protocol = @"http";
    self.provider.subdomain = @"matteo.";
    STAssertEqualObjects([self.provider getUrl], @"http://matteo.11870.org/api/v2", @"Test building address");
    [self.provider empty];
    _provider = nil;
}

- (void)testURLS{
    self.provider.server = @"11870.org";
    self.provider.protocol = @"http";
    self.provider.subdomain = @"matteo.";
    STAssertEqualObjects([self.provider getUrl], @"http://matteo.11870.org/api/v2", @"Test building address");
    STAssertEqualObjects([self.provider search], @"http://matteo.11870.org/api/v2/search", @"Test building address for search");
    STAssertEqualObjects([self.provider user:@"swampie"], @"http://matteo.11870.org/api/v2/users/swampie", @"Test building address for user");
    STAssertEqualObjects([self.provider site:@"11870"], @"http://matteo.11870.org/api/v2/sites/11870", @"Test building address for site");
    STAssertEqualObjects([self.provider review:@"swampie" forSite:@"11870"], @"http://matteo.11870.org/api/v2/sites/swampie/11870", @"Test building address for review by user for site");
    STAssertEqualObjects([self.provider siteDetails:@"11870"], @"http://matteo.11870.org/api/v2/site-details/11870", @"Test building address for site details");
    STAssertEqualObjects([self.provider userMedia:@"swampie" forSite:@"11870"], @"http://matteo.11870.org/api/v2/sites/swampie/11870/media", @"Test building address for user media");
    STAssertEqualObjects([self.provider siteMedia:@"11870"], @"http://matteo.11870.org/api/v2/site-media/11870", @"Test building address for site media details");
    STAssertEqualObjects([self.provider media:@"swampie" forSite:@"11870" fnv:@"fakefnv"], @"http://matteo.11870.org/api/v2/sites/swampie/11870/media/fakefnv", @"Test building address for site media with fnv");
    STAssertEqualObjects([self.provider users], @"http://matteo.11870.org/api/v2/users", @"Test building address for users");
    STAssertEqualObjects([self.provider contacts:@"swampie"], @"http://matteo.11870.org/api/v2/contacts/swampie", @"Test building contacts for users");
    STAssertEqualObjects([self.provider contact:@"swampie" contactSlug:@"fakecontact"], @"http://matteo.11870.org/api/v2/contacts/swampie/fakecontact", @"Test building single contact for users");
    STAssertEqualObjects([self.provider userCheckins:@"swampie"], @"http://matteo.11870.org/api/v2/checkins/user/swampie", @"Test building user checkins url");
    STAssertEqualObjects([self.provider siteCheckins:@"11870"], @"http://matteo.11870.org/api/v2/checkins/site/11870", @"Test building site checkins url");
    STAssertEqualObjects([self.provider featuredSite], @"http://matteo.11870.org/api/v2/featured-site", @"Test building featured site url");
    STAssertEqualObjects([self.provider categories], @"http://matteo.11870.org/api/v2/categories", @"Test building categories url");
    STAssertEqualObjects([self.provider attributes], @"http://matteo.11870.org/api/v2/attributes", @"Test building attributes url");
    [self.provider empty];
    _provider = nil;
}

@end
