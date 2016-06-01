//
//  StarWarsChar.m
//  StarWarriors
//
//  Created by don't touch me on 5/31/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

#import "StarWarsChar.h"

@implementation StarWarsChar

+(instancetype)initWithName:(NSString *)name starWarrior:
                            (NSString *)starWarrior
//                            (NSString *)name homeWorld:
                            {
    
    StarWarsChar *theCharacter = [[StarWarsChar alloc] init];
    theCharacter.name = name;
    theCharacter.starWarrior = starWarrior;
//    theCharacter.homeWorld = homeWorld;
    
    return theCharacter;
    
}

@end
