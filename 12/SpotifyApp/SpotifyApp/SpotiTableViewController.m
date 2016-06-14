//
//  SpotiTableViewController.m
//  SpotifyApp
//
//  Created by don't touch me on 6/7/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

#import "SpotiTableViewController.h"
#import "Kanye.h"
@interface SpotiTableViewController ()
@property (strong, nonatomic) NSMutableArray *artistsArray;

@end

@implementation SpotiTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.artistsArray = [[NSMutableArray alloc] init];
    
    NSString *jsonString = [self stringFromJSONFile];
    
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];

    
    NSError *error = nil;

        // Level 1
        
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                   options:NSJSONReadingAllowFragments
                                                                             error:&error];
        if (error ==nil) {
                
        NSArray *array = [jsonDictionary objectForKey:@"items"];
        
        for(NSDictionary *dict in array) {
         
            NSLog(@"dict ==%@", dict);
            
            
        Kanye *theKanye = [[Kanye alloc] init];
            
        NSString *name = [dict objectForKey:@"name"];
            
            if (name != nil) {
                theKanye.name = name;
            } else  {
                theKanye.name =@"";
        NSLog(@"I could not parse the name");
            }
            
        NSString *kanyeId = [dict objectForKey:@"kanyeId"];
            
            if (kanyeId != nil) {
                theKanye.kanyeId = kanyeId;
            } else  {
                theKanye.kanyeId =@"";
            NSLog(@"I could not parse the kanyeId");
            }
                [self.artistsArray addObject:theKanye];
            
            }
            NSLog(@"kanye count ==%ld", self.artistsArray.count);
        }
        
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
            
            return self.artistsArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
        
    Kanye *theKanye = [self.artistsArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = theKanye.name;
        
    return cell;
}



-(NSString *)stringFromJSONFile {
    NSString *str = [[NSString alloc] init];
    
    NSBundle *mainBundle = [NSBundle mainBundle];
    
    NSString *filePath = [mainBundle pathForResource:@"west" ofType:@"json"];
    
    NSString *jsonString = [[NSString alloc] initWithContentsOfFile:filePath
                                                           encoding:NSUTF8StringEncoding
                                                              error:NULL];
    if (jsonString != nil) {
        str = jsonString;
    }
    return str;
}




@end
