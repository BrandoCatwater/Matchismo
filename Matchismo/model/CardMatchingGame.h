//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Brandon Chatreau on 2014-04-23.
//  Copyright (c) 2014 Brandon Chatreau. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject
// designated initializer
- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;

- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly)NSInteger score;
@property (nonatomic, readonly) NSArray *lastChosenCards;
@property (nonatomic, readonly) NSInteger lastScore;
@property (nonatomic) NSUInteger maxMatchingCards;

@end
