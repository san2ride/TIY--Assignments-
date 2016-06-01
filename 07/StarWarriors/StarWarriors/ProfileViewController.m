//
//  ProfileViewController.m
//  StarWarriors
//
//  Created by don't touch me on 5/31/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

#import "ProfileViewController.h"
#import "StarWarsChar.h"

@interface ProfileViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *occuLabel;
@property (weak, nonatomic) IBOutlet UILabel *homeLabel;


@end

@implementation ProfileViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.nameLabel.text = self.theCharacter.name;
    self.occuLabel.text = self.theCharacter.starWarrior;
    self.homeLabel.text = self.theCharacter.homeWorld;
}




@end
