//
//  Quote.m
//  ZayBanTest
//
//  Created by Ko Ko Aye on 21/01/2021.
//

#import "Quote.h"

@implementation Quote

- (instancetype)initWithText:(NSString *)text
        author:(NSString *)author
        style:(QuoteDisplayStyle)style
{
    if (self = [super init]){
        _text = [text copy];
        _author = [author copy];
        _style = style;
    }
    return self;
}

@end
