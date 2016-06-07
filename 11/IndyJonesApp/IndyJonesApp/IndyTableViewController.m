//
//  IndyTableViewController.m
//  IndyJonesApp
//
//  Created by don't touch me on 6/6/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

#import "IndyTableViewController.h"
#import "Jones.h"

@interface IndyTableViewController ()
@property (strong, nonatomic) NSMutableArray *postsArray;
@property (strong, nonatomic) Jones *currentCharacter;
@end

@implementation IndyTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    

    
    self.postsArray = [[NSMutableArray alloc] init];
    
    NSString *jsonString = [self stringFromJSONFile];
    
//    NSLog(@"jsonString == %@", jsonString);
    
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *error = nil;
    
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                   options:NSJSONReadingAllowFragments
                                                                     error:&error];

    
    if(error ==nil) {
        
// array Jones Modal
    
    NSArray *array = [jsonDictionary objectForKey:@"results"];
        
    for(NSDictionary *dict in array) {
        
    NSLog(@"dict ==%@", dict);
    
    Jones *theJones = [[Jones alloc] init];
        
    
    NSString *name = [dict objectForKey:@"name"];
    
    if (name != nil) {
            theJones.name = name;
    } else  {
        theJones.name =@"";
    NSLog(@"I could not parse the name");
    }
    
    NSString *occupation = [dict objectForKey:@"occupation"];
    
    if (occupation != nil) {
            theJones.occupation = occupation;
    } else  {
        theJones.occupation =@"";
    NSLog(@"I could not parse the occupation");
    }
   
    NSString *actor = [dict objectForKey:@"actor"];
        
    if (actor != nil) {
            theJones.actor = actor;
    } else  {
            theJones.actor =@"";
    NSLog(@"I could not parse the actor");
    }
        [self.postsArray addObject:theJones];
    }
    NSLog(@"jones count ==%ld", self.postsArray.count);
        
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
            return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    
    return cell;
}

- (IBAction)indyButton:(UIBarButtonItem *)sender {

    NSLog(@"Post");
}
-(NSString *)stringFromJSONFile {
    NSString *str = [[NSString alloc] init];
    
    NSBundle *mainBundle = [NSBundle mainBundle];
    
    NSString *filePath = [mainBundle pathForResource:@"jones" ofType:@"json"];
    
    NSString *jsonString = [[NSString alloc] initWithContentsOfFile:filePath
                                                           encoding:NSUTF8StringEncoding
                                                              error:NULL];
    if (jsonString != nil) {
        str = jsonString;
    }
    return str;
    }
    




@end