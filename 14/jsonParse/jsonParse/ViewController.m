//
//  ViewController.m
//  jsonParse
//
//  Created by don't touch me on 6/10/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

#import "ViewController.h"
#import "Dish.h"
#import "Restaurant.h"

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray *restrauntsArray;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.restrauntsArray = [[NSMutableArray alloc] init];
    
    NSDictionary *theDictionary = [self parseJSONFile];
    
    NSLog(@"theDict ==%@", theDictionary);
    
    NSArray *jsonArray = [theDictionary objectForKey:@"restaurants"];
    
    for(NSDictionary *dict in jsonArray) {
        
        Restaurant *theRestaurant = [[Restaurant alloc] init];
        
        NSString *name = [dict objectForKey:@"name"];
        
        if(name != nil) {
            theRestaurant.name = name;
        } else {
            theRestaurant.name =@"";
            NSLog(@"I could not parse name");
        }
        
        NSNumber *latitude = [dict objectForKey:@"latitude"];
        
        if(latitude != nil) {
            theRestaurant.latitude = latitude;
        } else {
            NSLog(@"I could not parse latitude");
        }
        
        [self.restrauntsArray addObject:theRestaurant];
        
    }
    
    NSLog(@"the number of restaurants is %ld", self.restrauntsArray.count);
    
    for(Restaurant *r in self.restrauntsArray) {
        NSLog(@"the restaurant name is %@", r.name);
    }
    
}

-(NSDictionary *)parseJSONFile {
    
    NSDictionary *jsonDictionary = nil;
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"menu" ofType:@"json"];
    
        NSString *jsonString = [[NSString alloc] initWithContentsOfFile:filePath
                                                           encoding:NSUTF8StringEncoding error:NULL];
    
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    if (data == nil) {
        NSLog(@"There is a problem converting to data");
    } else {
        
        NSError *jsonError = nil;
        
        jsonDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                         options:NSJSONReadingAllowFragments
                                                           error:&jsonError];
        
        if(jsonError == nil) {
           NSLog(@"jsonDictionary ==%@", jsonDictionary);
        } else {
            
            NSLog(@"An error occurred %@", jsonError.localizedDescription);
        }
    }
    return jsonDictionary;
}





@end
