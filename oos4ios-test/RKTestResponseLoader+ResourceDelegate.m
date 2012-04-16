//
//  RKTestResponseLoader+ResourceDelegate.m
//  oos4ios
//
//  Created by Matteo Fiandesio on 4/16/12.
//  Copyright (c) 2012 11870.com. All rights reserved.
//

#import "RKTestResponseLoader+ResourceDelegate.h"

@implementation RKTestResponseLoader(ResourceDelegate)
-(void)beforeApiCall:(NSMutableDictionary *)params{
    [params setObject:@"d53da6f7bfdeafdfb32a7677c5cc9c22" forKey:@"appToken"];
    [params setObject:@"json" forKey:@"alt"];
}

-(void)request:(RKRequest *)request didFailLoadWithError:(NSError *)error{
    NSLog(@"%@",[error description]);
}


@end
