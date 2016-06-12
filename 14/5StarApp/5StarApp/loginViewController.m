//
//  loginViewController.m
//  5StarApp
//
//  Created by don't touch me on 6/9/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

#import "loginViewController.h"
#import "HomeViewController.h"

@interface loginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIImageView *loginImageView;
@property (weak, nonatomic) IBOutlet UIImageView *franceImageView;
@property (weak, nonatomic) IBOutlet UIImageView *michelinImageView;

@end

@implementation loginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
  
}

- (IBAction)enterButton:(UIButton *)sender {
    
    if ([self.usernameTextField.text isEqualToString:@"sushi"]) {
        
    if ([self.passwordTextField.text isEqualToString:@"is2good"]){
        
    [self performSegueWithIdentifier:@"homeSegue" sender:self];
        
    
}
    else {
        self.view.backgroundColor = [UIColor blackColor];
    }
        
    }
    else {
        self.view.backgroundColor = [UIColor blackColor];
    }

   
    
}



    
@end
