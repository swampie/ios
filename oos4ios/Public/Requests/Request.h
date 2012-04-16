//
//  Request.h
//  oos4ios
//
//  Created by Matteo Fiandesio on 4/12/12.
//  Copyright (c) 2012 11870.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>
@protocol OOSResourceDelegate;

typedef enum {
    OOSGetMethod,
    OOSPostMethod
} OOSMethod;


    


@interface Request : NSObject
    - (Request *) request;
- (Request *) requestWithBaseUrl:(NSString *)baseUrl 
                      andSubHost:(NSString* )subHost
                     andProtocol:(NSString *)protocol;
    - (void)search:(NSMutableDictionary*) params 
       withDelegate:(id<OOSResourceDelegate>) delegate;
@end

@protocol OOSResourceDelegate <RKRequestDelegate>
@optional
-(void) beforeApiCall:(NSMutableDictionary *) params;
-(void) apiCallComplete;
-(void) apiCallFailed;
-(void) unauthorizedApiCall;
@end
