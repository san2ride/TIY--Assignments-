//
//  MenuTableViewController.m
//  5StarApp
//
//  Created by don't touch me on 6/9/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

#import "MenuTableViewController.h"
#import "DishViewController.h"

@interface MenuTableViewController ()
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (assign, nonatomic) float rating;


@end

@implementation MenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.rating = 1;
    self.ratingLabel.text =@"1";
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.identifier isEqualToString:@"DishSegue"]) {
        
        DishViewController *controller = (DishViewController *)segue.destinationViewController;
        controller.currentValue = self.rating;
}
    
//-(IBAction)unwindForSegue:(UIStoryboardSegue *)segue {
//    
//        NSLog(@"inwindSegue called");
//        
//    DishViewController *dishController = (DishViewController *)segue.sourceViewController;
//    
//    self.rating = dishController.currentValue;
//    
//    NSLog(@"2.2f", self.rating);
//    
//    self.ratingLabel.text = [NSString stringWithFormat:@"%2.0f", self.rating];
//    
//    }
    
}



@end