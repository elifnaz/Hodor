//
//  FavoritesTableViewController.h
//  Lab5
//
//  Created by Elif Naz Aydin on 11/9/15.
//  Copyright © 2015 Elif Aydin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QuotesViewController.h"
#import "AddQuoteViewController.h"

@interface FavoritesTableViewController : UITableViewController

@property (strong, nonatomic) QuotesModel *model;

@end
