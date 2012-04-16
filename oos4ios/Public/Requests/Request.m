//
//  Request.m
//  oos4ios
//
//  Created by Matteo Fiandesio on 4/12/12.
//  Copyright (c) 2012 11870.com. All rights reserved.
//

#import "Request.h"
#import <RestKit/RestKit.h>
#import "ApiUrlProvider.h"
#import "Constants.h"
static RKClient* _httpClient = nil;
static ApiUrlProvider* _apiProvider = nil;


@interface Request()  
- (void)JSONRequestWithMethod:(OOSMethod*)method
                 resourcePath:(NSString*)resourcePath
                       params:(NSDictionary*)params
                     delegate:(id<OOSResourceDelegate>)delegate;
                      
- (void)authorizedJSONRequestWithMethod:(OOSMethod*) method
                           resourcePath:(NSString*)resourcePath
                                 params:(NSDictionary*)params
                               delegate:(id<OOSResourceDelegate>)delegate;
                               
@end


@implementation Request

- (Request *) requestWithBaseUrl:(NSString *)baseUrl 
                      andSubHost:(NSString* )subHost
                     andProtocol:(NSString *)protocol
{
    if(_apiProvider == nil){
        _apiProvider = [ApiUrlProvider provider];
    }
    [_apiProvider setServer:baseUrl];
    [_apiProvider setSubdomain:subHost];
    if([protocol isEqualToString:@"http"])
       [_apiProvider setProtocol:HTTP];
    else
       [_apiProvider setProtocol:HTTPS];
    if(_httpClient == nil)
        _httpClient = [RKClient clientWithBaseURLString:[_apiProvider getUrl]];
    else
        [_httpClient setBaseURL:[RKURL URLWithBaseURLString:[_apiProvider getUrl]]];
    return self;
}

- (Request *) request {
    if(_apiProvider == nil){
        _apiProvider = [[ApiUrlProvider alloc] init] ;
    }
    if(_httpClient == nil)
        _httpClient = [RKClient clientWithBaseURLString:[_apiProvider getUrl]];
    return self;
}

-(void) search:(NSDictionary *)params withDelegate:(id<OOSResourceDelegate>) delegate{
    [self JSONRequestWithMethod:OOSGetMethod resourcePath:[_apiProvider search] params:params delegate:delegate];
}

- (void)JSONRequestWithMethod:(OOSMethod *)method
                 resourcePath:(NSString *)resourcePath
                       params:(NSDictionary*)params
                     delegate:(id<OOSResourceDelegate>)delegate
{
    
    if([delegate respondsToSelector:@selector(beforeApiCall:)]){
        [delegate beforeApiCall:params];
    }
    
    if(method == OOSGetMethod){
        [_httpClient get:resourcePath queryParameters:params delegate:delegate];
    }else if(method == OOSPostMethod){
        [_httpClient post:resourcePath params:params delegate:delegate];
    }
    
    
    
    /*NSMutableURLRequest *request = [self.httpClient requestWithMethod:method path:resourcePath parameters:params];
    AFJSONRequestOperation *operation;
    operation =  [AFJSONRequestOperation 
                  JSONRequestOperationWithRequest:request
                  success:success
                  failure:failure];
    [operation start];*/
}

- (void)authorizedJSONRequestWithMethod:(OOSMethod *)method
                           resourcePath:(NSString*)resourcePath
                                 params:(NSDictionary*)params
                               delegate:(id<OOSResourceDelegate>)delegate
{
    
    /*if ([HKSession isAnonymous]) {
        if ([delegate respondsToSelector:@selector(APICallNotLoggedInError)]) {
            [delegate APICallNotLoggedInError];
        }
    } else {
        [self JSONRequestWithMethod:method resourcePath:resourcePath params:params delegate:delegate success:success failure:failure];
    }*/
}


@end
