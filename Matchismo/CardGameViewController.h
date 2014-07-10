//
//  CardGameViewController.h
//  Matchismo
//
//  Created by Elex Price on 12/10/13.
//  Copyright (c) 2013 IE Media Group. All rights reserved.
//
// Abstract class. Must implement methods as described below

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface CardGameViewController : UIViewController

// protected
// for subclass
-(Deck *)createDeck; // abstract

@end
