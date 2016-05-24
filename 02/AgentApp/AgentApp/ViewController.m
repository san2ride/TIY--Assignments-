//
//  ViewController.m
//  AgentApp
//
//  Created by don't touch me on 5/24/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UILabel *greetingLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    

    [super viewDidLoad];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
    
    
}

- (IBAction)authButtonTapped:(UIButton *)sender {
    NSLog(@"offButtonTap");
    
    
    
    if ([self.usernameTextField.text isEqualToString:@"sanchez"]) {
        
    if ([self.passwordTextField.text isEqualToString:@"password"]){
            
    self.view.backgroundColor = [UIColor greenColor];
        
    self.greetingLabel.text = @"Good Evening, Jason";
        }
        
    else {
        
        self.view.backgroundColor = [UIColor redColor];
    }
    }
    else {
        
        self.view.backgroundColor = [UIColor redColor];
    }
        
    
  
}


@end
