//
//  PlayingCard.h
//  Matchismo
//
//  Created by Brandon Chatreau on 2014-04-22.
//  Copyright (c) 2014 Brandon Chatreau. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong,nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
