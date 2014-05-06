//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Brandon Chatreau on 2014-04-22.
//  Copyright (c) 2014 Brandon Chatreau. All rights reserved.
//

#import "CardGameViewController.h"
#import "CardMatchingGame.h"


@interface CardGameViewController ()
@property (nonatomic, strong) Deck *deck;
@property (nonatomic, strong) CardMatchingGame *game;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *modeSelect;
@property (weak, nonatomic) IBOutlet UILabel *flipDescription;
@end

@implementation CardGameViewController
- (IBAction)matchMode:(UISegmentedControl *)sender {
    

}

-(CardMatchingGame *) game
{
    if (!_game){
     
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                  usingDeck:[self createDeck]];
        [self matchMode:self.modeSelect];
        
    }
    return _game;
    
}

- (Deck *)createDeck //abstract
{
    return nil;
}

- (Deck *)deck
{
    if (!_deck) _deck = [self createDeck];
    return _deck;
}

- (IBAction)touchCardButton:(UIButton *)sender
{

    int cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
}

- (IBAction)newGame
{
    self.modeSelect.enabled = YES;
    self.game = nil;
   
    [self updateUI];
}

- (void)updateUI
{
    for (UIButton *cardButton in self.cardButtons){
        int cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setAttributedTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d",self.game.score];
    
    if (self.game) {
        
        NSString *description = @"";
        
        if ([self.game.lastChosenCards count]){
            NSMutableArray *cardContents = [NSMutableArray array];
            for (Card *card in self.game.lastChosenCards){
                [cardContents addObject:card.contents];
            }
            description = [cardContents componentsJoinedByString:@" "];
            
        }
        
        if (self.game.lastScore >0){
            description = [NSString stringWithFormat:@" Matched %@ for %d points.", description, self.game.lastScore];
        } else if (self.game.lastScore < 0) {
            description = [NSString stringWithFormat:@"%@ don't match! %d point penalty!", description, self.game.lastScore];
        }
        
        self.flipDescription.text = description;
        
    }
}

- (NSAttributedString *)titleForCard:(Card *)card
{
    NSAttributedString *title = [[NSAttributedString alloc] initWithString:card.chosen ? card.contents : @""];
    return title;
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"CardFront" : @"CardBack"];
}



@end
