//
//  QuotesModel.m
//  Lab5
//
//  Created by Elif Naz Aydin on 10/9/15.
//  Copyright © 2015 Elif Aydin. All rights reserved.
//

#import "QuotesModel.h"

NSString *const kQuoteKey = @"quote";
NSString *const kAuthorKey = @"author";
NSString *const kFavoritesKey = @"favorites";

NSString *const kQuotesPlist = @"Quotes.plist";
NSString *const kFavoritesPlist = @"Favorites.plist";


@interface QuotesModel ()

@property (strong, nonatomic) NSMutableArray *favorites;
@property (strong, nonatomic) NSString *quotesPath;
@property (strong, nonatomic) NSString *favoritesPath;

@end

@implementation QuotesModel

- (void) save
{
    [self.quotes writeToFile:self.quotesPath atomically:YES];
    [self.favorites writeToFile:self.favoritesPath atomically:YES];
}

- (NSDictionary *) randomQuote
{
    
    
    NSDictionary * temp =[_quotes objectAtIndex: random()%[_quotes count]];
    self.curIndex = [self.quotes indexOfObject:temp];

    return temp;
}
- (NSUInteger) numberOfQuotes
{
    return [self.quotes count];
}
- (NSDictionary *) quoteAtIndex: (NSUInteger) index
{
    

        return self.quotes[index];
    

}
- (void) removeQuoteAtIndex: (NSUInteger) index
{
    if (index < self.numberOfQuotes)
    {
        [self.quotes removeObjectAtIndex:index];
        [self save];

    }
}
- (void) insertQuote: (NSDictionary *) quote
{
    [self.quotes addObject: quote];
    [self save];

}
- (void) insertQuote: (NSString *) quote
              author: (NSString *) author
{
    NSDictionary *dicti = [NSDictionary dictionaryWithObjectsAndKeys: quote, @"quote", author, @"author", nil];
    [self.quotes addObject: dicti];
    [self save];


}
- (void) insertQuote: (NSDictionary *) quote
             atIndex: (NSUInteger) index
{
    
    if (index <= self.numberOfQuotes)
    {
        [self.quotes insertObject:quote atIndex:index];
        [self save];

        
    }
    
}
- (void) insertQuote: (NSString *) quote
              author: (NSString *) author
             atIndex: (NSUInteger) index
{
    
    if (index <= self.numberOfQuotes)
    {
        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys: quote, @"quote", author, @"author",nil];
        [self.quotes insertObject:dict atIndex:index];
        [self save];
        
    }
}
- (NSDictionary *) nextQuote
{
    if (_curIndex == self.numberOfQuotes - 1)
    {
        _curIndex = 0;
    }
    else
    {
        _curIndex++;
    }
    return [_quotes objectAtIndex:_curIndex];
    
}
- (NSDictionary *) prevQuote
{
    if (_curIndex == 0)
    {
        _curIndex = self.numberOfQuotes - 1;
    }
    else
    {
        _curIndex--;
    }
    return [_quotes objectAtIndex:_curIndex];

}

- (id)init
{
    self = [super init];
    if (self) {
        _curIndex = 0;
        NSArray *paths = NSSearchPathForDirectoriesInDomains(
                                                             NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        _quotesPath = [documentsDirectory stringByAppendingPathComponent:kQuotesPlist];
        _favoritesPath = [documentsDirectory stringByAppendingPathComponent:kFavoritesPlist];
        _quotes = [NSMutableArray arrayWithContentsOfFile:_quotesPath];
        _favorites = [NSMutableArray arrayWithContentsOfFile:_favoritesPath];
        if (!_quotes) {
            _quotes = [[NSMutableArray alloc] init];
            [self insertQuote:@"Hodor hodor hodor" author:@"Hodor" atIndex:0];
            [self insertQuote:@"If opportunity doesn't knock, build a door" author:@"Milton Berle" atIndex:1];
            [self insertQuote:@"The journey of a thousand miles begins with one step" author:@"Lao Tzu" atIndex:2];
            [self insertQuote:@"The mind is everything. What you think, you become" author:@"Buddha" atIndex:3];
            [self insertQuote:@"The only way to do great work is to love what you do. If you haven’t found it yet, keep looking. Don’t settle" author:@"Steve Jobs" atIndex:4];
        }
        if (!_favorites) {
            _favorites = [[NSMutableArray alloc] init];
        }
    }
    return self;
    
}

+(instancetype) sharedModel
{
    
    static QuotesModel *_sharedModel = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedModel = [[self alloc] init];

    });
    
    return _sharedModel;
}

- (NSDictionary*)favoriteAtIndex: (NSUInteger)index {
    if ([self numberOfFavorites] == 0 || index >= [self numberOfFavorites])
    {
        return nil;
    }
    else
    {
        return [self.favorites objectAtIndex:index];
    }
}


- (void)addFavorite: (NSString*)quote author: (NSString*)author {
   
    NSDictionary* fav = @{@"quote":quote, @"author":author};
    if (![self.favorites containsObject:fav])
    {
        [self.favorites addObject:fav];
        [self save];
    }
}

- (void)removeFavorite: (NSString*)quote author: (NSString*)author {
    NSDictionary* fav = @{@"quote":quote, @"author":author};
    if ([self.favorites containsObject:fav])
    {
        [self.favorites removeObject:fav];
        [self save];

    }
}

- (NSUInteger)numberOfFavorites {
    return [self.favorites count];
}


- (void)removeFavoriteAtIndex: (NSUInteger)index {
    
    if (index < self.numberOfQuotes)
    {
        [self.favorites removeObjectAtIndex:index];
        [self save];

    }
    
}

- (BOOL)isFavorited: (NSString*)quote author: (NSString*)author {
    NSDictionary* temp = @{@"quote":quote, @"author":author};
    if ([self.favorites containsObject:temp])
        return true;
    else
        return false;
}

@end
 

