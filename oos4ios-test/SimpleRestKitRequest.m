//
//  SimpleRestKitRequest.m
//  oos4ios
//
//  Created by Matteo Fiandesio on 4/12/12.
//  Copyright (c) 2012 11870.com. All rights reserved.
//

#import "SimpleRestKitRequest.h"
#import <RestKit/RestKit.h> 
#import <RestKit/RKTestResponseLoader.h>
@implementation SimpleRestKitRequest

-(void) testSimpleRequestToGoogle{
    RKClient* client = [RKClient clientWithBaseURLString:@"http://www.google.com"];
    NSDictionary* params = [NSDictionary dictionaryWithObject:@"11870" forKey:@"q"];
    RKTestResponseLoader *loader = [RKTestResponseLoader new];
    [client get:@"/search" queryParameters:params delegate:loader];
    [loader waitForResponse];
    STAssertTrue([loader wasSuccessful], @"Expected 200 response");
    NSLog(@"%@",[[loader response]bodyAsString]);
}




@end