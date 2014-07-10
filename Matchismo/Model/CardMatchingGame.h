//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Elex Price on 12/12/13.
//  Copyright (c) 2013 IE Media Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "PlayingCard.h"



@interface CardMatchingGame : NSObject

// Designated Initializer
-(instancetype)initWithCardCount:(NSUInteger) count usingDeck:(Deck *) deck andMode:(NSUInteger)mode;

-(void)chooseCardAtIndex:(NSUInteger)index;

-(Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;

@property (nonatomic, readwrite) NSUInteger gameMode;


@end
