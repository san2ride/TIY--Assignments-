//
//  ViewController.m
//  CamApp
//
//  Created by don't touch me on 6/2/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

#import "ViewController.h"
#import "PicViewController.h"

@interface ViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) UIImagePickerController *pickerController;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@property (strong, nonatomic) UIImage *currentImage;

@property (weak, nonatomic) IBOutlet UIButton *sdButton;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pickerController = [[UIImagePickerController alloc] init];
    self.pickerController.delegate = self;
}
- (IBAction)camTapped:(UIBarButtonItem *)sender {
    
    NSLog(@"camTapped");
    
    self.pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;

    [self presentViewController:self.pickerController animated:YES completion:nil];
}

- (IBAction)sdButtonTapped:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"PicSegue" sender:self];
}
    
-(IBAction)unwindSegue:(UIStoryboardSegue *)segue {
    
    NSLog(@"unwindSegue");
    
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [self.pickerController dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
        self.currentImage = info[UIImagePickerControllerOriginalImage];
        
        self.imageView.image = self.currentImage;
    
        self.sdButton.enabled = YES;
    
    [self.pickerController dismissViewControllerAnimated:YES completion:nil];
    
}


@end
