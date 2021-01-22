//
//  InteractiveQuoteComponent.h
//  ZayBanTest
//
//  Created by Ko Ko Aye on 22/01/2021.
//

#import <Foundation/Foundation.h>
#import <ComponentKit/CKCompositeComponent.h>

NS_ASSUME_NONNULL_BEGIN

@class Quote;
@class QuoteContext;

@interface InteractiveQuoteComponent : CKCompositeComponent

+(instancetype) newWithQuote:(Quote *)quote context:(QuoteContext *)context;

@end

NS_ASSUME_NONNULL_END
