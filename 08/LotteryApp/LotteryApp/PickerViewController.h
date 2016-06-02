//
//  PickerViewController.h
//  LotteryApp
//
//  Created by don't touch me on 6/1/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ticket.h"

@interface PickerViewController : UIViewController
@property(strong, nonatomic) Ticket *theWinningTicket;

@end
