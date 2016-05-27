//
//  MenuViewController.m
//  outaTimeApp
//
//  Created by don't touch me on 5/26/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController () <UITextFieldDelegate> {
    int milesPerHour;
    
}

@property (weak, nonatomic) IBOutlet UILabel *speedLabel;
@property (strong, nonatomic) NSTimer *timer;
@property (weak, nonatomic) IBOutlet UITextField *timeText;


@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    milesPerHour = 0;
    
    float speed = 0.5;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:speed
                                                  target:self
                                                selector:@selector(updateMiles)
                                                userInfo:nil
                                                 repeats:YES];
}

-(void)updateMiles {
    
    milesPerHour = milesPerHour + 1;
    
    if(milesPerHour == 88) {
        [self.timer invalidate];
    }
    self.speedLabel.text = [NSString stringWithFormat:@"%i", milesPerHour];
    
    NSLog(@"updateMiles");
   
    
}

//-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    
    // this will remove the keyboard from the app
  //  [self.dateTextField resignFirstResponder];
    
   // return YES;






@end
