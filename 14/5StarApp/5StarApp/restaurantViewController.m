//
//  restaurantViewController.m
//  5StarApp
//
//  Created by don't touch me on 6/9/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

#import "restaurantViewController.h"
#import "Dish.h"
#import "Restaurant.h"

@interface restaurantViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *restrauntsArray;
@property (strong, nonatomic) NSMutableArray *dishesArray;

@end

@implementation restaurantViewController

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
        
        NSString *restdescription = [dict objectForKey:@"name"];
        
        if(restdescription != nil) {
            theRestaurant.restdescription = restdescription;
        } else {
            theRestaurant.restdescription =@"";
            NSLog(@"I could not parse restdescription");
        }
        
        NSString *address = [dict objectForKey:@"address"];
        
        if(address != nil) {
            theRestaurant.address = address;
        } else {
            theRestaurant.address =@"";
            NSLog(@"I could not parse address");
        }
        
        NSString *city = [dict objectForKey:@"name"];
        
        if(city != nil) {
            theRestaurant.city = city;
        } else {
            theRestaurant.city =@"";
            NSLog(@"I could not parse city");
        }
        
        NSString *state = [dict objectForKey:@"state"];
        
        if(state != nil) {
            theRestaurant.state = state;
        } else {
            theRestaurant.state =@"";
            NSLog(@"I could not parse state");
        }
        
        NSNumber *zip = [dict objectForKey:@"zip"];
        
        if(zip != nil) {
            theRestaurant.zip = zip;
        } else {
            NSLog(@"I could not parse zip");
        }
        
        NSNumber *longitude = [dict objectForKey:@"longitude"];
        
        if(longitude != nil) {
            theRestaurant.longitude = longitude;
        } else {
            NSLog(@"I could not parse longitude");
        }
        
        NSNumber *latitude = [dict objectForKey:@"latitude"];
        
        if(latitude != nil) {
            theRestaurant.latitude = latitude;
        } else {
            NSLog(@"I could not parse latitude");
        }
        
        NSString *menuName = [dict objectForKey:@"menuName"];
        
        if(menuName != nil) {
            theRestaurant.menuName = menuName;
        } else {
            theRestaurant.menuName =@"";
            NSLog(@"I could not parse menuName");
        }
        
        [self.restrauntsArray addObject:theRestaurant];
    }
    
    NSLog(@"the number of restaurants is %ld", self.restrauntsArray.count);
    
    for(Restaurant *r in self.restrauntsArray) {
        NSLog(@"the restaurant name is %@", r.name);
        
        
        
        
        
        self.dishesArray = [[NSMutableArray alloc] init];
        
        NSArray *jsonArray = [theDictionary objectForKey:@"dishes"];
        
        for(NSDictionary *dict in jsonArray) {
            
            Dish *theDish = [[Dish alloc] init];
            
            
            NSString *name = [dict objectForKey:@"name"];
            
            if(name != nil) {
                theDish.name = name;
            } else {
                theDish.name =@"";
                NSLog(@"I could not parse name");
            }
            
            NSString *dishdescription = [dict objectForKey:@"dishdescription"];
            
            if(dishdescription != nil) {
                theDish.dishdescription = dishdescription;
            } else {
                theDish.dishdescription =@"";
                NSLog(@"I could not parse dishdescription");
            }
            
            NSString *rating = [dict objectForKey:@"rating"];
            
            if(rating != nil) {
                theDish.rating = rating;
            } else {
                theDish.rating =@"";
                NSLog(@"I could not parse rating");
            }
            
            NSString *image = [dict objectForKey:@"image"];
            
            if(image != nil) {
                theDish.image = image;
            } else {
                theDish.image =@"";
                NSLog(@"I could not parse image");
            }
            
            NSString *price = [dict objectForKey:@"price"];
            
            if(price != nil) {
                theDish.price = price;
            } else {
                theDish.price =@"";
                NSLog(@"I could not parse price");
            }
            
            [self.dishesArray addObject:theDish];
        }
        
        NSLog(@"the number of restaurants is %ld", self.dishesArray.count);
        
        for(Dish *d in self.dishesArray) {
            NSLog(@"the dish name is %@", d.name);
        }
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.text =@"Test";
    
    return cell;
    
}






@end
