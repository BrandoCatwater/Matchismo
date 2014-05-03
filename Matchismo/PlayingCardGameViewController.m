//
//  PlayingCardGameViewController.m
//  Matchismo
//
//  Created by Brandon Chatreau on 2014-05-01.
//  Copyright (c) 2014 Brandon Chatreau. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"

@interface PlayingCardGameViewController ()

@end

@implementation PlayingCardGameViewController

- (Deck *)createDeck {
    
    return [[PlayingCardDeck alloc] init];
    
}

@end
