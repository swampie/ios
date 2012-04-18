//
//  VenueJsonParser.m
//  oos4ios
//
//  Created by Matteo Fiandesio on 4/17/12.
//  Copyright (c) 2012 11870.com. All rights reserved.
//

#import "VenueJsonParser.h"
#import "Venue.h"
#import "Attribute.h"
//FIXME: move all the string to Constants.h or to a specific JSONConstants.h
@implementation VenueJsonParser
    -(id) parse:(NSMutableDictionary *)jsonObject {
        Venue* v = [[Venue alloc]init];
        NSMutableDictionary* extensions = [jsonObject objectForKey:@"extensions"];
        if(extensions){
            v.objectId = [extensions objectForKey:@"oos_id"];
            v.webAddress = [extensions objectForKey:@"oos_url"];
            v.userAddress = [extensions objectForKey:@"oos_useraddress"];
            NSMutableDictionary* geo = [extensions objectForKey:@"georss_where"];
            //Extracting coordinates 
            //TODO: see if the parsing could be less verbose
            if(geo && [geo objectForKey:@"gml_point"]){
                NSMutableDictionary* geoPoint = [geo objectForKey:@"gml_point"];
                if(geoPoint){
                    NSString* coordinates = [geoPoint objectForKey:@"gml_pos"];
                    NSArray* latLng = [coordinates componentsSeparatedByString:@" "];
                    if([latLng count] == 2){
                        NSNumber *lat = [[NSNumber alloc]initWithDouble:[[latLng objectAtIndex:0]doubleValue]];
                        NSNumber *lng = [[NSNumber alloc]initWithDouble:[[latLng objectAtIndex:1]doubleValue]];
                        v.latitude = lat;
                        v.longitude = lng;
                    }
                 }
            }
            v.phone = [extensions objectForKey:@"oos_telephone"];
            v.slug = [extensions objectForKey:@"oos_slug"];
        }
        v.name = [jsonObject objectForKey:@"title"];
        v.url = [jsonObject objectForKey:@"id"];
        if([jsonObject objectForKey:@"categories"]){
            NSMutableArray* categories = [jsonObject objectForKey:@"categories"];
            for(NSMutableDictionary * cat in categories){
                NSString* schema = [cat objectForKey:@"scheme"];
                if([[schema lastPathComponent]isEqualToString:@"attributes"]){
                    Attribute *a = [[Attribute alloc] init];
                    a.term = [cat objectForKey:@"term"];
                    a.label = [cat objectForKey:@"label"];
                    a.parentCategory = [cat objectForKey:@"oos_parent-category"];
                    a.attributeGroup = [cat objectForKey:@"oos_attribute-group"];
                    [v.attributes addObject:a];
                }
            }
        }
        return v;
    }
@end
