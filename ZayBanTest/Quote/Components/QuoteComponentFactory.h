//
//  QuoteComponentFactory.h
//  ZayBanTest
//
//  Created by Ko Ko Aye on 22/01/2021.
//

#import <ComponentKit/CKDefines.h>
#import <ComponentKit/CKComponent.h>

@class CKComponent;
@class Quote;
@class QuoteContext;

NS_ASSUME_NONNULL_BEGIN

//CK_EXTERN_C_BEGIN

CKComponent *QuoteComponentFactory(Quote *quote, QuoteContext *context);

//CK_EXTERN_C_END

NS_ASSUME_NONNULL_END 
