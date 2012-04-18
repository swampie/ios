//
//  Parser.h
//  oos4ios
//
//  Created by Matteo Fiandesio on 4/17/12.
//  Copyright (c) 2012 11870.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBJson.h"
@interface Parser : NSObject

    -(id) parse:(NSMutableDictionary *) jsonObject;
@end
