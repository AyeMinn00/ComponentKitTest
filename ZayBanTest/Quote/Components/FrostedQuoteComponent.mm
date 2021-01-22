//
//  FrostedQuoteComponent.m
//  ZayBanTest
//
//  Created by Ko Ko Aye on 22/01/2021.
//

#import "FrostedQuoteComponent.h"

#import "QuoteWithBackgroundComponent.h"
#import "QuoteContext.h"
#import <ComponentKit/CKLabelComponent.h>
#import <ComponentKit/CKFlexboxComponent.h>
#import <ComponentKit/InsetComponentBuilder.h>

@implementation FrostedQuoteComponent

+ (instancetype)newWithText:(NSString *)text context:(QuoteContext *)context
{

	CKComponent *label = [CKLabelComponent newWithLabelAttributes:{
				      .string = text,
				      .font = [UIFont fontWithName:@"Baskerville" size:30]
			      } viewAttributes:{
				      {@selector(setBackgroundColor:), [UIColor clearColor]},
				      {@selector(setUserInteractionEnabled:), @NO},
			      } size:{}];

	CKComponent *quoteLabel = [CKLabelComponent newWithLabelAttributes:{
					   .string = @"\u201D",
					   .color = [UIColor colorWithWhite:1 alpha:0.5],
					   .font = [UIFont fontWithName:@"Baskerville" size:140]
				   } viewAttributes:{
					   {@selector(setBackgroundColor:), [UIColor clearColor]},
					   {@selector(setUserInteractionEnabled:), @NO}
				   } size:{}];

	CKComponent *quoteLabelWithInset = CK::InsetComponentBuilder()
	                                   .insetsRight(5)
	                                   .component(quoteLabel).build();

	CKComponent *quoteComponent = [CKFlexboxComponent newWithView:{} size:{} style:{
					       .alignItems = CKFlexboxAlignItemsStart
				       } children:{
					       {
						       .component = label,
						       .alignSelf = CKFlexboxAlignSelfCenter
					       },
					       {
						       .component = quoteLabelWithInset,
						       .alignSelf = CKFlexboxAlignSelfEnd
					       }
				       }];

	CKComponent *container = [QuoteWithBackgroundComponent newWithBackgroundImage:[context imageNamed:@"LosAngeles"] quoteComponent:quoteComponent];

	return [super newWithComponent:container];
}

@end
