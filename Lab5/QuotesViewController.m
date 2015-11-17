//
//  QuotesViewController.m
//  Lab5
//
//  Created by Elif Naz Aydin on 10/9/15.
//  Copyright © 2015 Elif Aydin. All rights reserved.
//

#import "QuotesViewController.h"

#import "QuotesModel.h"
#import <AVFoundation/AVFoundation.h>


@interface QuotesViewController ()

@property (strong, nonatomic) QuotesModel *model;

@property (strong, nonatomic) AVAudioPlayer *audioPlayer;

@end

@implementation QuotesViewController

-(void) swipeGestureRecognized: (UISwipeGestureRecognizer *) recognizer
{
    
    if ([self.model numberOfQuotes] > 0)
    {
        
        if ((recognizer.direction == UISwipeGestureRecognizerDirectionLeft))
        {
            self.favorite.alpha = 0;
            self.noQuote = false;

            NSDictionary * temp = self.model.prevQuote;
            NSString *newAuthor = [temp objectForKey: @"author"];
            NSString *newQuote = [temp objectForKey: @"quote"];

            [self fadeOutAuthor : newAuthor];
            [self fadeOutQuote : newQuote];
            [self.audioPlayer play];
            if ( [self.model isFavorited:newQuote author:newAuthor] )
                [UIView animateWithDuration:1.0 animations:^{ self.favorite.alpha = 1; }];
            
            
        }
        
        if ((recognizer.direction == UISwipeGestureRecognizerDirectionRight))
        {
            self.favorite.alpha = 0;
            self.noQuote = false;

            NSDictionary * temp = self.model.nextQuote;
            NSString *newAuthor = [temp objectForKey: @"author"];
            NSString *newQuote = [temp objectForKey: @"quote"];
            
            [self fadeOutAuthor : newAuthor];
            [self fadeOutQuote : newQuote];
            [self.audioPlayer play];
            if ( [self.model isFavorited:newQuote author:newAuthor] )
                [UIView animateWithDuration:1.0 animations:^{ self.favorite.alpha = 1; }];
            
        }
        
    }
    
    else
    {
        [self fadeOutAuthor : @""];
        [self fadeOutQuote : @""];
        [self.audioPlayer play];
        self.favorite.alpha = 0;
        
        
    }
  }

-(void) displayRandom
{
    self.favorite.alpha = 0;
    self.noQuote = false;

    if ([self.model numberOfQuotes] > 0)
    {
        NSDictionary * temp = self.model.randomQuote;
             NSString *newAuthor = [temp objectForKey: @"author"];
        NSString *newQuote = [temp objectForKey: @"quote"];
        
        [self fadeOutAuthor : newAuthor];
        [self fadeOutQuote : newQuote];
        
        [self.audioPlayer play];

        if ( [self.model isFavorited:newQuote author:newAuthor] )
            [UIView animateWithDuration:1.0 animations:^{ self.favorite.alpha = 1; }];
        
    }

    
}

- (void)doubleTapRecognized:(UITapGestureRecognizer *) recognizer {
    if (self.noQuote)
        return;
    
    if ( [self.model isFavorited:self.quote.text author:self.author.text]) // remove fav
    {
    
        self.favorite.alpha = 1;
        
        
        [self.model removeFavorite:self.quote.text author:self.author.text];
        [UIView animateWithDuration:1.0 animations:^{ self.favorite.alpha = 0; }];
        
    }
    else // add fav
    {
        self.favorite.alpha = 0;
        
        
        [self.model addFavorite:self.quote.text author:self.author.text];
        [UIView animateWithDuration:1.0 animations:^{ self.favorite.alpha = 1; }];

    }
}


-(void) singleTapRecognized: (UISwipeGestureRecognizer *) recognizer
{
    [self displayRandom];
  
}


- (void)viewDidLoad  {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _model = [QuotesModel sharedModel];
    self.noQuote = true;

    NSString *path = [NSString stringWithFormat:@"%@/tone.mp3", [[NSBundle mainBundle] resourcePath]];
    
    NSURL *soundURL = [NSURL fileURLWithPath:path];
    NSError *error;
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:&error];
    [self.audioPlayer prepareToPlay];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapRecognized:)];
    singleTap.numberOfTapsRequired = 1;

    [self.view addGestureRecognizer:singleTap];
    
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                    action:@selector(swipeGestureRecognized:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                     action:@selector(swipeGestureRecognized:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRight];
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTapRecognized:)];
    doubleTap.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:doubleTap];
    
    [singleTap requireGestureRecognizerToFail:doubleTap];
    
#if TARGET_IPHONE_SIMULATOR
    NSLog(@"Documents Directory: %@", [[[NSFileManager
                                         defaultManager] URLsForDirectory:NSDocumentDirectory
                                        inDomains:NSUserDomainMask] lastObject]);
    
#endif
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) canBecomeFirstResponder
{
    return YES;
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake)
    {
        [self displayRandom];
        
    }
}

- (void) fadeOutAuthor: (NSString *) name
{
    [UIView animateWithDuration:1.0 animations:^{
        self.author.alpha = 0;
        
    } completion:^(BOOL finished) {
        [self fadeInAuthor: name];
    }];
}

- (void) fadeInAuthor:  (NSString *) name
{
    if(self.author.textColor == UIColor.blackColor)
    {
        self.author.textColor = UIColor.purpleColor;
    }
    else
    {
        self.author.textColor = UIColor.blackColor;
    }
    
    [UIView animateWithDuration:1.0 animations:^{
        self.author.alpha = 1;
        self.author.text = name;
        
        
    }];
}

- (void) fadeOutQuote: (NSString *) name
{
    [UIView animateWithDuration:1.0 animations:^{
        self.quote.alpha = 0;
        
        
    } completion:^(BOOL finished) {
        [self fadeInQuote: name];
    }];
    
}

- (void) fadeInQuote:  (NSString *) name
{
    self.quote.text = name;
    
    if(self.quote.textColor == UIColor.blackColor)
    {
        self.quote.textColor = UIColor.purpleColor;
    }
    else
    {
        self.quote.textColor = UIColor.blackColor;
    }
    
    [UIView animateWithDuration:1.0 animations:^{
        self.quote.alpha = 1;
        
        
    }];
}



@end
