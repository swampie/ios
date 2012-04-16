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
    for(NSMutableDictionary *entry in entries){
        NSLog(@"%@",[entry objectForKey:@"id"] );
    }
    
    
         
}

@end
