//
//  RequestTest.m
//  oos4ios
//
//  Created by Matteo Fiandesio on 4/16/12.
//  Copyright (c) 2012 11870.com. All rights reserved.
//

#import "RequestTest.h"
#import "Request.h"
#import "RKTestResponseLoader+ResourceDelegate.h"
#import "SBJson.h"
#import "VenueJsonParser.h"
#import "NSObject+SBJson.h"
#import "Venue.h"
#import "SearchFilterBuilder.h"
#import "SearchFilter.h"
@implementation RequestTest

// All code under test must be linked into the Unit Test bundle
- (void)testSearchRequest
{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObject:@"q" forKey:@"vegetarianos en madrid"];
    [params setObject:@"20" forKey:@"count"];
    Request* request = [[Request alloc] requestWithBaseUrl:@"11870.org" andSubHost:@"api.apachex." andProtocol:@"http"];
    RKTestResponseLoader *waiter = [RKTestResponseLoader responseLoader];
    [request search:params withDelegate:waiter];
    [waiter waitForResponse];
    
    STAssertTrue([waiter wasSuccessful], @"Expected 200 response");
      
    SBJsonParser *parser = [[SBJsonParser alloc]init];
    NSMutableDictionary *json = [parser objectWithString:[[waiter response]bodyAsString]];
    NSArray *entries = [json objectForKey:@"entries"];
    STAssertTrue(entries!=nil, @"entries is not null");
    STAssertTrue([entries count] > 0, @"entries is not empty");
    VenueJsonParser* venueParser = [[VenueJsonParser alloc]init];
    NSMutableArray* vs = [[NSMutableArray alloc] init];
    for(NSMutableDictionary *entry in entries){
        Venue  *v = [venueParser parse:entry];
        [vs addObject:v];
        
    }
    NSLog(@"%@",[vs JSONRepresentation]);
    
         
}

- (void)testSearchRequestWithFilter
{
    
    SearchFilterBuilder* builder = [[SearchFilterBuilder alloc] init];
    SearchFilter* filter = [[[builder buildNewFilter] addQuery:@"La Cabaña Argentina"] filter];
        
    
    Request* request = [[Request alloc] requestWithBaseUrl:@"11870.org" andSubHost:@"api.apachex." andProtocol:@"http"];
    RKTestResponseLoader *waiter = [RKTestResponseLoader responseLoader];
    [request search:[filter asParams] withDelegate:waiter];
    [waiter waitForResponse];
    
    STAssertTrue([waiter wasSuccessful], @"Expected 200 response");
    
    SBJsonParser *parser = [[SBJsonParser alloc]init];
    NSMutableDictionary *json = [parser objectWithString:[[waiter response]bodyAsString]];
    NSArray *entries = [json objectForKey:@"entries"];
    STAssertTrue(entries!=nil, @"entries is not null");
    STAssertTrue([entries count] > 0, @"entries is not empty");
    VenueJsonParser* venueParser = [[VenueJsonParser alloc]init];
    NSMutableArray* vs = [[NSMutableArray alloc] init];
    for(NSMutableDictionary *entry in entries){
        Venue  *v = [venueParser parse:entry];
        [vs addObject:v];
        
    }
    NSLog(@"%@",[vs JSONRepresentation]);
    
    
    
}

- (void)testSearchRequestWithFilterAreaSlug
{
    
    SearchFilterBuilder* builder = [[SearchFilterBuilder alloc] init];
    SearchFilter* filter = [[[[builder buildNewFilter]addQuery:@"La Cabaña Argentina"] addAreaSlug:@"/es/madrid/centro"] filter];
    
    
    Request* request = [[Request alloc] requestWithBaseUrl:@"11870.org" andSubHost:@"api.apachex." andProtocol:@"http"];
    RKTestResponseLoader *waiter = [RKTestResponseLoader responseLoader];
    [request search:[filter asParams] withDelegate:waiter];
    [waiter waitForResponse];
    
    STAssertTrue([waiter wasSuccessful], @"Expected 200 response");
    
    SBJsonParser *parser = [[SBJsonParser alloc]init];
    NSMutableDictionary *json = [parser objectWithString:[[waiter response]bodyAsString]];
    NSArray *entries = [json objectForKey:@"entries"];
    STAssertTrue(entries!=nil, @"entries is not null");
    STAssertTrue([entries count] >1, @"entries has only one element");
    VenueJsonParser* venueParser = [[VenueJsonParser alloc]init];
    NSMutableArray* vs = [[NSMutableArray alloc] init];
    for(NSMutableDictionary *entry in entries){
        Venue  *v = [venueParser parse:entry];
        [vs addObject:v];
        
    }
    NSLog(@"%@",[vs JSONRepresentation]);
    
    
    
}

@end
