//
//  QuoteWithBackgroundComponent.h
//  ZayBanTest
//
//  Created by Ko Ko Aye on 22/01/2021.
//

#import <Foundation/Foundation.h>
#import <ComponentKit/CKCompositeComponent.h>

NS_ASSUME_NONNULL_BEGIN

@interface QuoteWithBackgroundComponent : CKCompositeComponent

+(instancetype) newWithBackgroundImage:(UIImage *)backgroundImage
                        quoteComponent:(CKComponent *)quoteComponent;

@end

NS_ASSUME_NONNULL_END
