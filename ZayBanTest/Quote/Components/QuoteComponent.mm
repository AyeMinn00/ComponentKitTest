//
//  QuoteComponent.m
//  ZayBanTest
//
//  Created by Ko Ko Aye on 22/01/2021.
//

#import "QuoteComponent.h"
#import "FrostedQuoteComponent.h"
#import "Quote.h"
#import "QuoteContext.h"
#import "QuoteComponentFactory.h"

@implementation QuoteComponent

+ (instancetype)newWithQuote:(Quote *)quote context:(QuoteContext *)context
{
    return [super newWithComponent:quoteComponent(quote, context)];
}

static CKComponent* quoteComponent(Quote *quote, QuoteContext *context)
{
    return [FrostedQuoteComponent newWithText:quote.text context:context];
}

@end

CKComponent* QuoteComponentFactory(Quote *quote, QuoteContext *context){
    return [FrostedQuoteComponent newWithText:quote.text context:context];
}
