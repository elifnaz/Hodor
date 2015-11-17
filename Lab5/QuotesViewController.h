//
//  QuoteViewController.h
//  Lab5
//
//  Created by Elif Naz Aydin on 10/25/15.
//  Copyright © 2015 Elif Aydin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuotesModel.h"

@interface QuotesViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *quote;

@property (weak, nonatomic) IBOutlet UILabel *author;

@property (weak, nonatomic) IBOutlet UILabel *favorite;

@property (nonatomic) BOOL noQuote; // true if there's no quote on the screen yet


@end

