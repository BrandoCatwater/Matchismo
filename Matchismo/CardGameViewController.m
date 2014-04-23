//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Brandon Chatreau on 2014-04-22.
//  Copyright (c) 2014 Brandon Chatreau. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCard.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"


@interface CardGameViewController ()
@property (nonatomic, strong) Deck *deck;
@property (nonatomic, strong) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@end

@implementation CardGameViewController

-(CardMatchingGame *) game
{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:0 usingDeck:[self createDeck]];
    return _game;
    
}

- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}

- (Deck *)deck
{
    if (!_deck) _deck = [self createDeck];
    return _deck;
}



- (IBAction)touchCardButton:(UIButton *)sender {
    
    
    if ([sender.currentTitle length]){
        UIImage *cardImage = [UIImage imageNamed:@"CardBack"];
        [sender setBackgroundImage:cardImage forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
        
    }else{
        PlayingCard *card;
        card = (PlayingCard *)self.deck.drawRandomCard;
        if (card)
        {
            UIImage *cardImage = [UIImage imageNamed:@"CardFront"];
            [sender setBackgroundImage:cardImage forState:UIControlStateNormal];
            [sender setTitle:card.contents forState:UIControlStateNormal];

        }
        else{

        }
        
    }
    
    
}


@end
