//
//  AddQuoteViewController.h
//  Lab5
//
//  Created by Elif Naz Aydin on 10/26/15.
//  Copyright © 2015 Elif Aydin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuotesViewController.h"

typedef void(^AddQuoteCompletionHandler)(NSString *quote, NSString *author);


@interface AddQuoteViewController : UIViewController

@property (copy, nonatomic) AddQuoteCompletionHandler completionHandler;

- (IBAction)saveButtonTapped:(id)sender;

- (IBAction)cancelButtonTapped:(id)sender;

@end

