//
//  WarmQuoteComponent.m
//  ZayBanTest
//
//  Created by Ko Ko Aye  on 22/01/2021.
//

#import "WarmQuoteComponent.h"
#import "QuoteWithBackgroundComponent.h"
#import "QuoteContext.h"

#import <ComponentKit/CKLabelComponent.h>
#import <ComponentKit/InsetComponentBuilder.h>
#import <ComponentKit/CKRatioLayoutComponent.h>

@implementation WarmQuoteComponent

+ (instancetype)newWithText:(NSString *)text context:(QuoteContext *)context
{

	CKComponent *label = [CKLabelComponent newWithLabelAttributes:{
				      .string = text,
				      .font = [UIFont fontWithName:@"AmericanTypewriter" size:26]
			      } viewAttributes:{
				      {@selector(setBackgroundColor:), [UIColor clearColor]},
				      {@selector(setUserInteractionEnabled:), @NO},
			      } size:{}];
	CKComponent *rationComponent = [CKRatioLayoutComponent newWithRatio: 1.3 size:{}
	                                component:
	                                CK::InsetComponentBuilder()
	                                .insetsLeft(30)
	                                .insetsRight(30)
	                                .insetsTop(INFINITY)
	                                .insetsBottom(INFINITY)
	                                .component(label).build() ];
	return [super newWithComponent:[QuoteWithBackgroundComponent newWithBackgroundImage:[context imageNamed:@"Powell"]
	                                quoteComponent:rationComponent]];
}

@end
