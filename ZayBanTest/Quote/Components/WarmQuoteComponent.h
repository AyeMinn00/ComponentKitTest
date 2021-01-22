//
//  WarmQuoteComponent.h
//  ZayBanTest
//
//  Created by Ko Ko Aye  on 22/01/2021.
//

#import <Foundation/Foundation.h>
#import <ComponentKit/CKCompositeComponent.h>

NS_ASSUME_NONNULL_BEGIN

@class QuoteContext;

@interface WarmQuoteComponent : CKCompositeComponent

+(instancetype)newWithText:(NSString *)text context:(QuoteContext *)context;

@end

NS_ASSUME_NONNULL_END
