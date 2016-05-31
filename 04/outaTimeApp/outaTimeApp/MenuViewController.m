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

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) NSDateFormatter *formatter;

@property (weak, nonatomic) IBOutlet UILabel *lastTimeLabel;
@property (strong, nonatomic) NSDateFormatter *formatter2;

@end

@implementation MenuViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.formatter = [[NSDateFormatter alloc] init];
    
    self.formatter.dateFormat =@"MMM d, YYYY";

    
}
        
-(IBAction)unwindSegue:(UIStoryboardSegue *)segue {
            
    NSLog(@"unwindSegue");
    
    [self reset];
    
}
        
-(IBAction)travelBackTapped:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"GWattSegue" sender:nil];
    
}

-(void)reset {
    NSLog(@"Reset");


    milesPerHour = 0;
    
    float speed = 0.1;
    
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


-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    NSLog(@"return key pressed");
    
    
    NSString *theDateString = self.timeText.text;
    
    NSLog(@"destinationDateWasChosen%@", theDateString);

    NSDate *theDate = [self.formatter dateFromString:@"Nov 12, 1956"];
    
    
    self.lastTimeLabel.text = [self.formatter stringFromDate:theDate];
    
    
    
    [self.timeText resignFirstResponder];
    
    return YES;

}




@end
