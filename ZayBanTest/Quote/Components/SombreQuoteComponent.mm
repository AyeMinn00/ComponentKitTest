//
//  SombreQuoteComponent.m
//  ZayBanTest
//
//  Created by Ko Ko Aye  on 22/01/2021.
//

#import "SombreQuoteComponent.h"
#import "QuoteWithBackgroundComponent.h"
#import "QuoteContext.h"
#import <ComponentKit/CKLabelComponent.h>
#import <ComponentKit/InsetComponentBuilder.h>
#import <ComponentKit/FlexboxComponentBuilder.h>


@implementation SombreQuoteComponent

+ (instancetype)newWithText:(NSString *)text context:(QuoteContext *)context
{
	CKComponent *flexComponent = CK::FlexboxComponentBuilder()
	                             .alignItems(CKFlexboxAlignItemsStart)
	                             .spacing(50)
	                             .children({
		{lineComponent()},
		{
			[CKLabelComponent newWithLabelAttributes:{
				 .string = [text uppercaseString],
				 .color = [UIColor whiteColor],
				 .font = [UIFont fontWithName:@"Avenir-Black" size:25]
			 } viewAttributes:{
				 {@selector(setBackgroundColor:), [UIColor clearColor]},
				 {@selector(setUserInteractionEnabled:), @NO}
			 } size:{}
			]
		},
		{lineComponent()}
	}).build();

	return [super newWithComponent: [QuoteWithBackgroundComponent newWithBackgroundImage:[context imageNamed:@"MarketStreet"]
	                                 quoteComponent:CK::InsetComponentBuilder()
	                                 .insetsTop(40)
	                                 .insetsLeft(30)
	                                 .insetsBottom(40)
	                                 .insetsRight(30)
	                                 .component(flexComponent).build()
	        ]];

}

static CKComponent *lineComponent(){
	return [CKComponent newWithView:{
			[UIView class], {{@selector(setBackgroundColor:), [UIColor whiteColor]}}
		} size:{50,5}];
}


@end
