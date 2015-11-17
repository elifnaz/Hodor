//
//  QuotesModel.m
//  Lab5
//
//  Created by Elif Naz Aydin on 10/9/15.
//  Copyright © 2015 Elif Aydin. All rights reserved.
//
/*
#import "QuotesModel.h"
@interface QuotesModel ()


@end

@implementation QuotesModel

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

    }
}
- (void) insertQuote: (NSDictionary *) quote
{
    [self.quotes addObject: quote];
}
- (void) insertQuote: (NSString *) quote
              author: (NSString *) author
{
    NSDictionary *dicti = [NSDictionary dictionaryWithObjectsAndKeys: quote, @"quote", author, @"author", nil];
    [self.quotes addObject: dicti];

}
- (void) insertQuote: (NSDictionary *) quote
             atIndex: (NSUInteger) index
{
    
    if (index <= self.numberOfQuotes)
    {
        [self.quotes insertObject:quote atIndex:index];
        
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
        
        static NSString * const q1 = @"Hodor hodor hodor";
        static NSString * const q2 = @"If opportunity doesn't knock, build a door";
        static NSString * const q3 = @"The journey of a thousand miles begins with one step.";
        static NSString * const q4 = @"The mind is everything. What you think, you become.";
        static NSString * const q5 = @"The only way to do great work is to love what you do. If you haven’t found it yet, keep looking. Don’t settle.";
        static NSString * const a1 = @"Hodor";
        static NSString * const a2 = @"Milton Berle";
        static NSString * const a3 = @"Lao Tzu";
        static NSString * const a4 = @"Buddha";
        static NSString * const a5 = @"Steve Jobs";
      
        
        NSDictionary *d1 = [NSDictionary dictionaryWithObjectsAndKeys:
                            q1, @"quote", a1, @"author", nil];
        

        
        NSDictionary *d2 = [NSDictionary dictionaryWithObjectsAndKeys:
                            q2,  @"quote", a2, @"author", nil];
        
        
        
        NSDictionary *d3 = [NSDictionary dictionaryWithObjectsAndKeys:
                            q3,  @"quote", a3, @"author", nil];
        
        
        
        NSDictionary *d4 = [NSDictionary dictionaryWithObjectsAndKeys:
                            q4,  @"quote", a4, @"author", nil];
        
        
        
        NSDictionary *d5 = [NSDictionary dictionaryWithObjectsAndKeys:
                            q5,  @"quote", a5, @"author", nil];
        
        
        

        self.quotes = [[NSMutableArray alloc] initWithObjects:d1, d2, d3, d4, d5, nil];
        self.curIndex = 0;
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
@end
 
 */
