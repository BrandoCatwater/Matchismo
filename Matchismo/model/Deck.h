//
//  Deck.h
//  Matchismo
//
//  Created by Brandon Chatreau on 2014-04-22.
//  Copyright (c) 2014 Brandon Chatreau. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject


- (void)addCard: (Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;
- (Card *)drawRandomCard;




@end
