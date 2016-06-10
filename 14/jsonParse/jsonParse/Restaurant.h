//
//  Restaurant.h
//  jsonParse
//
//  Created by don't touch me on 6/10/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Restaurant : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *restdescription;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSString *state;
@property (strong, nonatomic) NSNumber *zip;
@property (strong, nonatomic) NSNumber *latitude;
@property (strong, nonatomic) NSNumber *longitude;
@property (strong, nonatomic) NSString *menuName;

@property (strong, nonatomic) NSMutableArray *dishesArray;

@end
