//
//  MUVITableViewController.m
//  MUVIApp
//
//  Created by don't touch me on 6/3/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

#import "MUVITableViewController.h"
#import "muviViewController.h"
#import "PosterImage.h"

@interface MUVITableViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *muviTableView;
@property (strong, nonatomic) NSMutableArray *moviesArray;
@property (strong, nonatomic) PosterImage *currentCharacter;


@end

@implementation MUVITableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.moviesArray = [[NSMutableArray alloc] init];
    
    [self loadJSONFile];
    
}

-(void)loadJSONFile {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"popular"
                                                         ofType:@"json"];
    
    NSString *jsonString = [[NSString alloc] initWithContentsOfFile:filePath
                                                           encoding:NSUTF8StringEncoding error:NULL];
    NSLog(@"%@", jsonString);
    
    NSError *error = nil;
    
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                   options:NSJSONReadingAllowFragments
                                                                     error:&error];
    if(error ==nil) {
        
        NSArray *resultsArray = [jsonDictionary objectForKey:@"results"];
        
        for(NSDictionary *dict in resultsArray) {
            
            NSLog(@"dict == %@", dict);
            
            PosterImage *pi = [[PosterImage alloc] init];
            
            NSString *originalTitle = [dict objectForKey:@"original_title"];
            
            if (originalTitle != nil) {
                pi.originalTitle = originalTitle;
            } else {
                pi.originalTitle =@"";
                NSLog(@"Could not parse title field");
            }
            
            NSString *posterPath = [dict objectForKey:@"poster_path"];
            
            if (posterPath != nil) {
                pi.posterPath = posterPath;
            } else {
                pi.posterPath =@"";
                NSLog(@"Could not parse powers field");
            }
            
            if (pi != nil) {
                [self.moviesArray addObject:pi];
            }
            
            NSLog(@"Movie Count: %ld", self.moviesArray.count);
        }
        
    } else {
        NSLog(@"Could not parse json into NSDictionary");
    }
    
    UIImage *myImage = [self imageFromURLString:@"http://image.tmdb.org/t/p/w500/jjBgi2r5cRt36xF6iNUEhzscEcb.jpg"];
    
    if (myImage == nil) {
        NSLog(@"Could not load the iamge");
    } else {
        NSLog(@"Got the image!");
    }
    
}

-(UIImage *)imageFromURLString:(NSString *)urlString {
    
    UIImage *theImage = nil;
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSLog(@"Attempting to Load urlString == %@", urlString);
    
    
    if(url != nil) {
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        if(data != nil) {
            theImage = [UIImage imageWithData:data];
        }
    }
    return theImage;

}

- (UITableViewCell *)muviTableView:(UITableView *)muviTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [muviTableView dequeueReusableCellWithIdentifier:@"Muvi" forIndexPath:indexPath];
    
    self.currentCharacter = [self.moviesArray objectAtIndex:indexPath.row];
    
//    cell.textLabel.text = self.currentCharacter.muvi;
    
    return cell;
}

- (NSInteger)muviTableView:(UITableView *)muviTableView numberOfRowsInSection:(NSInteger)section {
    
    return self.moviesArray.count;
}

-(void)muviTableView:(UITableView *)muviTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"I clicked on row %ld", indexPath.row);
    
    self.currentCharacter = [self.moviesArray objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:@"MuviSegue" sender:self];
    
}
-(void)reset {
    NSLog(@"Reset");
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
        
    if ([segue.identifier isEqualToString:@"MuviSegue"]) {
        
    NSLog(@"prepare for segue called with identifier ==%@", segue.identifier);

}
    muviViewController *muviController = (muviViewController *)segue.destinationViewController;
    
    muviController.theMuvi = self.currentCharacter;

}

//<key>NSAppTransportSecurity</key>
//    <dict>
//        <key>NSAllowsArbitraryLoads</key>
//        <true/>
//    </dict>

@end

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

//*/
//// Override to support conditional rearranging of the table view.
//- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
//    // Return NO if you do not want the item to be re-orderable.
//    return YES;
//*/




