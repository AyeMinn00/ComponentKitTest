//
//  QuoteComponent.m
//  ZayBanTest
//
//  Created by Ko Ko Aye on 22/01/2021.
//

#import "QuoteComponent.h"

#import "FrostedQuoteComponent.h"
#import "MonochromeQuoteComponent.h"
#import "Quote.h"
#import "QuoteContext.h"
#import "SombreQuoteComponent.h"
#import "WarmQuoteComponent.h"
#import "QuoteComponentFactory.h"
#import "InteractiveQuoteComponent.h"

@implementation QuoteComponent

+ (instancetype)newWithQuote:(Quote *)quote context:(QuoteContext *)context
{
    return [super newWithComponent:quoteComponent(quote, context)];
}

static CKComponent* quoteComponent(Quote *quote, QuoteContext *context)
{
    switch (quote.style) {
        case QuoteDisplayStyleFrosted:
          return [FrostedQuoteComponent
                  newWithText:quote.text
                  context:context];
        case QuoteDisplayStyleMonochrome:
          return [MonochromeQuoteComponent
                  newWithText:quote.text
                  context:context];
        case QuoteDisplayStyleSombre:
          return [SombreQuoteComponent
                  newWithText:quote.text
                  context:context];
        case QuoteDisplayStyleWarm:
          return [WarmQuoteComponent
                  newWithText:quote.text
                  context:context];
      }
}

@end

CKComponent* QuoteComponentFactory(Quote *quote, QuoteContext *context){
    return [InteractiveQuoteComponent newWithQuote:quote context:context];
}
