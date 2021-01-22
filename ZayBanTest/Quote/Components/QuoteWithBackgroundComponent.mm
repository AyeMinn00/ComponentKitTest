//
//  QuoteWithBackgroundComponent.m
//  ZayBanTest
//
//  Created by Ko Ko Aye on 22/01/2021.
//

#import "QuoteWithBackgroundComponent.h"
#import <ComponentKit/BackgroundLayoutComponentBuilder.h>

@implementation QuoteWithBackgroundComponent

+ (instancetype)newWithBackgroundImage:(UIImage *)backgroundImage quoteComponent:(CKComponent *)quoteComponent
{
	CKComponent *background = [CKComponent
	                           newWithView:
				   {
					   [UIImageView class],
					   {
						   {@selector(setImage:), backgroundImage},
						   {@selector(setContentMode:), @(UIViewContentModeScaleAspectFill)},
						   {@selector(setClipsToBounds:), @YES},
					   }
				   }
	                           size:{}];

	CKComponent *component = CK::BackgroundLayoutComponentBuilder()
	                          .component(quoteComponent)
	                          .background(background)
	                          .build();

	return [super newWithComponent:component];
   
}


@end
