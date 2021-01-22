//
//  QuotesPage.m
//  ZayBanTest
//
//  Created by Ko Ko Aye on 21/01/2021.
//

#import "QuotesPage.h"

@implementation QuotesPage

-(instancetype) initWithQuotes:(NSArray<Quote *> *)quotes position:(NSInteger)position
{
    if (self = [super init]){
        _quotes = [quotes copy];
        _position = position;
    }
    return self;
}

@end
