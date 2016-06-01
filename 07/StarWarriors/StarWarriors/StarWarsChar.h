//
//  StarWarsChar.h
//  StarWarriors
//
//  Created by don't touch me on 5/31/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StarWarsChar : NSObject

+(instancetype)initWithName:(NSString *)name starWarrior: (NSString *)starWarrior;

@property (strong, nonatomic)  NSString *name;
@property (strong, nonatomic) NSString *starWarrior;

@end
