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
#import "Country.h"
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
                //FIXME: refactor...too much repeated code
                if([extensions objectForKey:@"oos_country"]){
                    NSMutableDictionary *country = [extensions objectForKey:@"oos_country"];
                    Country* c = [[Country alloc] initWithName:[country objectForKey:@"name"] andSlug:[country objectForKey:@"slug"]];
                    v.country = c;
                }
                if([extensions objectForKey:@"oos_administrativearea"]){
                    NSMutableDictionary *administrativeArea = [extensions objectForKey:@"oos_administrativearea"];
                    AdministrativeArea* aa = [[AdministrativeArea alloc] initWithName:[administrativeArea objectForKey:@"name"] andSlug:[administrativeArea objectForKey:@"slug"]];
                    v.administrativeArea = aa;
                }
                if([extensions objectForKey:@"oos_subadministrativearea"]){
                    NSMutableDictionary *subAdministrativeArea = [extensions objectForKey:@"oos_subadministrativearea"];
                    SubAdministrativeArea* saa = [[SubAdministrativeArea alloc] initWithName:[subAdministrativeArea objectForKey:@"name"] andSlug:[subAdministrativeArea objectForKey:@"slug"]];
                    v.subAdministrativeArea = saa;
                }
                if([extensions objectForKey:@"oos_locality"]){
                    NSMutableDictionary *locality = [extensions objectForKey:@"oos_locality"];
                    Locality* l = [[Locality alloc] initWithName:[locality objectForKey:@"name"] andSlug:[locality objectForKey:@"slug"]];
                    v.locality = l;
                }
                if([extensions objectForKey:@"oos_dependentlocality"]){
                    NSMutableDictionary *dependentLocality = [extensions objectForKey:@"oos_dependentlocality"];
                    DependentLocality* dl = [[DependentLocality alloc] initWithName:[dependentLocality objectForKey:@"name"] andSlug:[dependentLocality objectForKey:@"slug"]];
                    v.dependentLocality = dl;
                }
                if([extensions objectForKey:@"oos_subdependentlocality"]){
                    NSMutableDictionary *subDependentLocality = [extensions objectForKey:@"oos_subdependentlocality"];
                    SubDependentLocality* sdl = [[SubDependentLocality alloc] initWithName:[subDependentLocality objectForKey:@"name"] andSlug:[subDependentLocality objectForKey:@"slug"]];
                    v.subDependentLocality = sdl;
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
