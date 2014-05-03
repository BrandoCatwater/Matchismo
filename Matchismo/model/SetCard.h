//
//  SetCard.h
//  Matchismo
//
//  Created by Brandon Chatreau on 2014-05-02.
//  Copyright (c) 2014 Brandon Chatreau. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card
@property (strong,nonatomic) NSString *color;
@property (strong,nonatomic) NSString *symbol;
@property (strong,nonatomic) NSString *shading;
@property (nonatomic) NSUInteger number;

+ (NSArray *)validColors;
+ (NSArray *)validSymbols;
+ (NSArray *)validShading;
+ (NSUInteger)maxNumber;

@end
