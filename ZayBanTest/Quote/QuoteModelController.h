//
//  QuoteModelController.h
//  ZayBanTest
//
//  Created by Ko Ko Aye on 22/01/2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class QuotesPage;

@interface QuoteModelController : NSObject

-(QuotesPage *)fetchNewQuotesPageWithCount: (NSInteger) count;

@end

NS_ASSUME_NONNULL_END
