//
//  QuotesModel.h
//  Lab5
//
//  Created by Elif Naz Aydin on 10/9/15.
//  Copyright © 2015 Elif Aydin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuotesModel : NSObject

@property (strong, nonatomic) NSMutableArray *quotes; // hey

@property (nonatomic) NSUInteger curIndex;

- (NSDictionary *) randomQuote;
- (NSUInteger) numberOfQuotes;
- (NSDictionary *) quoteAtIndex: (NSUInteger) index;
- (void) removeQuoteAtIndex: (NSUInteger) index;
- (void) insertQuote: (NSDictionary *) quote;
- (void) insertQuote: (NSString *) quote
              author: (NSString *) author;
- (void) insertQuote: (NSDictionary *) quote
             atIndex: (NSUInteger) index;
- (void) insertQuote: (NSString *) quote
              author: (NSString *) author
             atIndex: (NSUInteger) index;
- (NSDictionary *) nextQuote;
- (NSDictionary *) prevQuote;
- (NSUInteger)numberOfFavorites;
- (void)addFavorite: (NSString*)quote author: (NSString*)author;
- (void)removeFavorite: (NSString*)quote author: (NSString*)author;
- (void)removeFavoriteAtIndex: (NSUInteger)index;
- (NSDictionary*)favoriteAtIndex: (NSUInteger)index;
- (BOOL)isFavorited: (NSString*)quote author: (NSString*)author;

+(instancetype)sharedModel;

@end
 
 
