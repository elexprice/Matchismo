//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Elex Price on 12/10/13.
//  Copyright (c) 2013 IE Media Group. All rights reserved.
//

#import "CardGameViewController.h"
#import "Deck.h"

#import "Card.h"
#import "PlayingCard.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()


@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property (strong, nonatomic) IBOutlet UISegmentedControl *gameModeControl;



@end

@implementation CardGameViewController


-(Deck *)createDeck // abstract
{
    return nil;
}

-(UISegmentedControl *)gameModeControl
{
    NSArray *arrayItems = [NSArray arrayWithObjects:@"Match 2", @"Match 3", nil];
    
    if (!_gameModeControl)
        _gameModeControl = [[UISegmentedControl alloc] initWithItems: arrayItems ];
    
    return _gameModeControl;
    
}

-(IBAction)gameModeControlIndexChanged
{
    
    switch (self.gameModeControl.selectedSegmentIndex)
    {
        case 0:
            self.gameModeControl.selectedSegmentIndex = 0;
            self.game.gameMode = 2;
            [self redeal];
            break;
        case 1:
            self.gameModeControl.selectedSegmentIndex = 1;
            self.game.gameMode = 3;
            [self redeal];
            break;
            default:
            break;
    }
}

-(IBAction)redeal
{
    if (!_game) {
        self.game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                      usingDeck:[self createDeck] andMode:2];
    } else {
    
    self.game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                            usingDeck:[self createDeck] andMode:self.game.gameMode];
    }
    
    [self updateUI];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    
    NSUInteger chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
}

-(void)updateUI
{
    for (UIButton *cardButton in self.cardButtons){
        NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)self.game.score];
    }
}

-(NSString *)titleForCard: (Card *)card
{
    return card.isChosen ? card.contents : @"";
}

-(UIImage *)backgroundImageForCard: (Card *) card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}



@end
