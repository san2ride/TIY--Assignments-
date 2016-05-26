//
//  ViewController.m
//  practiceApp
//
//  Created by don't touch me on 5/25/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self printGreeting]
     = NSString stringWithFormat:@"@%"greeting", %@!"];
    
    
    
    
    
}
    

    
-(void)printGreeting:(NSString *)greeting {
        
        NSLog(@"Hello");
    
    
    
    
  
-(void)printGreetingTo:(NSString *)name atTimeofDay:(NSString *)timeOfDayString {
    
    NSDate *today = [NSDate dateWithTimeIntervalSinceNow:3600];
    
    NSLog(@"Todayis%@", today);
    
    self.formatter.dateFormat =@"MMM d, YYYY";
    
    }
    
    -(NSString *)greetingWithName:(NSString *)name {
        
        
    }
    
    -(NSString *)greetingAtTimeOfDay:(NSString *)timeOfDay {
        
    }
    
    -(NSString *)greetingWithBand:(NSString *)bandName withOpeningBand:(NSString *)openBand {
        
    }
    
    -(NSString *)stringWithName:(NSString *)name age:(float)age {
        
    }
    
    -(NSString *)stringWithBand:(NSString *)bandName withLeadSinger:(NSString *)leadSinger withBassPlayer:(NSString *)bassPlayer {
        
    }
    
   


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
