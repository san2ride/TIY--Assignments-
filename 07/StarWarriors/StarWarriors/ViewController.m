//
//  ViewController.m
//  StarWarriors
//
//  Created by don't touch me on 5/31/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

#import "ViewController.h"
#import "StarWarsChar.h"
#import "ProfileViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) NSMutableArray *charactersArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) StarWarsChar *currentCharacter;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.charactersArray = [[NSMutableArray alloc] init];
    
    StarWarsChar *vader = [[StarWarsChar alloc] init];
    vader.name =@"Darth Vader";
    vader.starWarrior =@"Sith Lord";
    
    [self.charactersArray addObject:vader];
    
    StarWarsChar *yoda = [[StarWarsChar alloc] init];
    yoda.name =@"Yoda";
    yoda.starWarrior =@"Jedi Grand Master";
    
    [self.charactersArray addObject:yoda];
    
    StarWarsChar *solo = [[StarWarsChar alloc] init];
    solo.name =@"Han Solo";
    solo.starWarrior =@"Captain, Millennium Falcon";
    
    [self.charactersArray addObject:solo];
    
    StarWarsChar *leia = [[StarWarsChar alloc] init];
    leia.name =@"Princess Leia";
    leia.starWarrior =@"Imperial Senate";
    
    [self.charactersArray addObject:leia];
    
    StarWarsChar *chewy = [[StarWarsChar alloc] init];
    chewy.name =@"Chewbacca";
    chewy.starWarrior =@"Co-pilot on Millennium Falcon";
    
    [self.charactersArray addObject:chewy];

    StarWarsChar *cpo = [[StarWarsChar alloc] init];
    cpo.name =@"C-3PO";
    cpo.starWarrior =@"Protocol Droid";
    
    [self.charactersArray addObject:cpo];
    
    StarWarsChar *rd= [[StarWarsChar alloc] init];
    rd.name =@"R2-D2";
    rd.starWarrior =@"Astromech droid";
    
    [self.charactersArray addObject:rd];
    
    StarWarsChar *binks = [[StarWarsChar alloc] init];
    binks.name =@"Jar Jar Binks";
    binks.starWarrior =@"Gungan Grand Army";
    
    [self.charactersArray addObject:binks];
    
    StarWarsChar *luke = [[StarWarsChar alloc] init];
    luke.name =@"Luke Skywalker";
    luke.starWarrior =@"Rebel Alliance";
    
    [self.charactersArray addObject:luke];
    
    StarWarsChar *jabba= [[StarWarsChar alloc] init];
    jabba.name =@"Jabba the Hutt";
    jabba.starWarrior =@"Hutt Cartel";
    
    [self.charactersArray addObject:jabba];

}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    self.currentCharacter = [self.charactersArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = self.currentCharacter.name;
    
    return cell;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.charactersArray count];
    
}
    
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"I clicked on row %ld", indexPath.row);
    
    self.currentCharacter = [self.charactersArray objectAtIndex:indexPath.row];

    [self performSegueWithIdentifier:@"ProfileSegue" sender:self];
    
}

-(void)reset {
    NSLog(@"Reset");
   }


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"ProfileSegue"]) {
        
    }
    
//    NSLog(@"prepare for segue called with identifier == %@", segue.identifier);
    
    ProfileViewController *profileController = (ProfileViewController *)segue.destinationViewController;
    
    profileController.theCharacter = self.currentCharacter;
    


    
}

@end
