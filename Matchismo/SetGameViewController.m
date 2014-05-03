//
//  SetGameViewController.m
//  Matchismo
//
//  Created by Brandon Chatreau on 2014-05-02.
//  Copyright (c) 2014 Brandon Chatreau. All rights reserved.
//

#import "SetGameViewController.h"
#import "SetDeck.h"
#import "CardMatchingGame.h"

@interface SetGameViewController ()

@end

@implementation SetGameViewController

- (Deck *)createDeck
{
    return [[SetDeck alloc] init];
}

@end
