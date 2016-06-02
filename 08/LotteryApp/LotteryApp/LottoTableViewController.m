//
//  LottoTableViewController.m
//  LotteryApp
//
//  Created by don't touch me on 6/1/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

#import "LottoTableViewController.h"
#import "Ticket.h"
#import "PickerViewController.h"

@interface LottoTableViewController ()
@property (nonatomic, strong) NSMutableArray *ticketsArray;
@property (nonatomic, strong) Ticket *winningTicket;
@end

@implementation LottoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.ticketsArray = [[NSMutableArray alloc] init];
    
    self.winningTicket = [self ticketWithRandomNumber];
    
    Ticket *randomT = [self ticketWithRandomNumber];
    
    if ([self.winningTicket.lottoTicketString isEqualToString:randomT.lottoTicketString]) {
        NSLog(@"equal");
    } else {
        NSLog(@"not equal");
    }
    
    NSLog(@"Winning Number is:%@",self.winningTicket.lottoTicketString);
}

-(Ticket *)ticketWithRandomNumber {
    Ticket *t = [[Ticket alloc] init];
    t.lottoTicketString = [self generateRandomNumberString];
    return t;
}
-(NSString *)generateRandomNumberString {
    
    int number1 = arc4random_uniform (53) +1;
    int number2 = arc4random_uniform (53) +1;
    int number3 = arc4random_uniform (53) +1;
    int number4 = arc4random_uniform (53) +1;
    int number5 = arc4random_uniform (53) +1;
    int number6 = arc4random_uniform (53) +1;

return [NSString stringWithFormat:@"%i %i %i %i %i %i", number1, number2, number3, number4, number5, number6];
}

- (IBAction)addButton:(UIBarButtonItem *)sender {
    
    Ticket *theTicket = [self ticketWithRandomNumber];
    [self.ticketsArray addObject:theTicket];
    
    [self.tableView reloadData];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TicketCell" forIndexPath:indexPath];
    
    
    Ticket *theTicket = [self.ticketsArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = theTicket.lottoTicketString;

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"the cell at %ld was tapped", indexPath.row);
}

-(void)chooseWinningTicket {
            
    self.winningTicket = [[Ticket alloc] init];
            
    [self chooseWinningTicket];
            
    NSLog(@"%@", [self generateRandomNumberString]);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.ticketsArray.count;

}

- (IBAction)checkButton:(UIBarButtonItem *)sender {
    
    [self performSegueWithIdentifier:@"PickerSegue" sender:nil];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSLog(@"prepareForSegue called %@", segue.identifier);
    
    PickerViewController *controller = segue.destinationViewController;
    
    controller.theWinningTicket = self.winningTicket;
}

@end





/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


