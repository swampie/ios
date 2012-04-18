//
//  AbstractArea.h
//  oos4ios
//
//  Created by Matteo Fiandesio on 4/18/12.
//  Copyright (c) 2012 11870.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AbstractArea;
@class AbstractAreaProtocol;



@protocol AbstractAreaProtocol <NSObject>
-(id<AbstractAreaProtocol>) initWithName:(NSString*) name 
                      andSlug:(NSString*) slug;
@end

typedef AbstractArea<AbstractAreaProtocol> Area;

@interface AbstractArea : NSObject<AbstractAreaProtocol>


@property(nonatomic,strong) NSString* name;
@property(nonatomic,strong) NSString* slug;
@property(nonatomic,strong) NSString* type;



@end
