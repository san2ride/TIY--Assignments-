//
//  muviViewController.m
//  MUVIApp
//
//  Created by don't touch me on 6/3/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

#import "muviViewController.h"

@interface muviViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *picImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


@end

@implementation muviViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
   
    if (self.theMuvi != nil) {
        
        self.titleLabel.text = self.theMuvi.originalTitle;
        
        // 1. Load the image from the urlString
        UIImage *theImage = [self imageFromURLString:self.theMuvi.posterPath];
        
        self.picImageView.image = theImage;
        
        NSLog(@"title: %@", self.theMuvi.originalTitle);
        NSLog(@"posterPath: %@", self.theMuvi.posterPath);
    }
}

-(UIImage *)imageFromURLString:(NSString *)urlString {
    
    UIImage *theImage = nil;
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSLog(@"Attempting to Load urlString == %@", urlString);
    
    if(url) {
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        if(data) {
            theImage = [UIImage imageWithData:data];
        }
    }
    return theImage;
    

}

@end
