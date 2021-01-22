//
//  MonochromeQuoteComponent.m
//  ZayBanTest
//
//  Created by Ko Ko Aye  on 22/01/2021.
//

#import "MonochromeQuoteComponent.h"
#import "QuoteWithBackgroundComponent.h"
#import "QuoteContext.h"
#import <ComponentKit/CKLabelComponent.h>
#import <ComponentKit/InsetComponentBuilder.h>
#import <ComponentKit/FlexboxComponentBuilder.h>
#import <ComponentKit/BackgroundLayoutComponentBuilder.h>

@implementation MonochromeQuoteComponent

+ (instancetype)newWithText:(NSString *)text context:(QuoteContext *)context
{
	CKComponent *quoteTextComponent = CK::InsetComponentBuilder()
	                                  .insetsTop(50)
	                                  .insetsLeft(20)
	                                  .insetsBottom(50)
	                                  .insetsRight(20)
	                                  .component([CKLabelComponent newWithLabelAttributes:{
							      .string = text,
							      .color = [UIColor darkGrayColor],
							      .font = [UIFont fontWithName:@"HoeflerText-Italic" size:25]
						      } viewAttributes:{
							      {@selector(setBackground:), [UIColor clearColor]},
							      {@selector(setUserInteractionEnabled:), @NO}
						      } size:{}]).build();

	CKComponent *quoteTextWithBookmarkComponent = CK::FlexboxComponentBuilder()
	                                              .alignItems(CKFlexboxAlignItemsStart)
	                                              .direction(CKFlexboxDirectionRow)
	                                              .children({
		{
			.component = [CKComponent newWithView:{
					      [UIView class],
					      { {@selector(setBackgroundColor:), [UIColor darkGrayColor]}}
				      } size:{ 20, 40}],
			.spacingBefore = 10
		},
		{
			.component = quoteTextComponent,
			.flexShrink = 1,
			.flexBasis = CKRelativeDimension::Percent(1.0)
		}
	})
	                                              .build();

	CKComponent *insetComponent = CK::InsetComponentBuilder()
	                              .insetsTop(40)
	                              .insetsBottom(40)
	                              .component(
		CK::BackgroundLayoutComponentBuilder()
		.component(quoteTextWithBookmarkComponent)
		.background([
				    CKComponent newWithView:{
					    [UIView class], {{@selector(setBackgroundColor:), [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.7]}}
				    } size:{}
		            ]).build()).build();
    
    return [super newWithComponent:[QuoteWithBackgroundComponent newWithBackgroundImage:[context imageNamed:@"Drops"] quoteComponent:insetComponent]];

}

@end
