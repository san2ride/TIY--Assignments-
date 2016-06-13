//
//  DishViewController.m
//  5StarApp
//
//  Created by don't touch me on 6/9/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

#import "DishViewController.h"

@interface DishViewController ()

@property (weak, nonatomic) IBOutlet UISlider *dishSlider;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UIImageView *dishImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation DishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self updateUI];
}

-(void)updateUI {
    
    self.ratingLabel.text = [NSString stringWithFormat:@"%1.0f", self.currentValue];
    self.dishSlider.value = self.currentValue;
}

- (IBAction)sliderValueChanged:(UISlider *)sender {
    
    self.currentValue = ceilf(self.dishSlider.value);
    
    [self updateUI];
}

@end
