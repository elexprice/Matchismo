//
//  PlayingCardGameViewController.m
//  Matchismo
//
//  Created by Elex Price on 1/13/14.
//  Copyright (c) 2014 IE Media Group. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"

@interface PlayingCardGameViewController ()

@end

@implementation PlayingCardGameViewController


- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc]init];
}

@end
