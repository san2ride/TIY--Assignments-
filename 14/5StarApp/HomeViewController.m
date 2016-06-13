//
//  HomeViewController.m
//  5StarApp
//
//  Created by don't touch me on 6/9/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

#import "HomeViewController.h"
#import "AboutViewController.h"
#import "restaurantViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}
    
- (IBAction)restButton:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"RestaurantSegue" sender:self];
    
    
}
- (IBAction)aboutButton:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"AboutSegue" sender:self];
    
}

    
    
    

    
@end
