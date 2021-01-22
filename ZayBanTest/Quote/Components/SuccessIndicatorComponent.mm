//
//  SuccessIndicatorComponent.m
//  ZayBanTest
//
//  Created by Ko Ko Aye on 22/01/2021.
//

#import "SuccessIndicatorComponent.h"
#import <ComponentKit/InsetComponentBuilder.h>
#import <ComponentKit/BackgroundLayoutComponentBuilder.h>
#import <ComponentKit/CenterLayoutComponentBuilder.h>
#import <ComponentKit/FlexboxComponentBuilder.h>
#import <ComponentKit/CKLabelComponent.h>

@implementation SuccessIndicatorComponent

+ (instancetype)newWithIndicatesSuccess:(BOOL)indicatesSuccess successText:(NSString *)successText failureText:(NSString *)failureText
{
	UIColor *color =
		indicatesSuccess
      ? [UIColor colorWithRed:0.1 green:0.4 blue:0.1 alpha:0.9]
      : [UIColor colorWithRed:0.7 green:0.1 blue:0.1 alpha:0.9];

	CKComponent *flagLabel = [CKLabelComponent newWithLabelAttributes:{
					  .string = (indicatesSuccess ? @"YES" : @"NO"),
					  .color = [UIColor whiteColor],
					  .font = [UIFont fontWithName:@"Cochin-Bold" size:45.0],
					  .alignment = NSTextAlignmentCenter
				  } viewAttributes:{
					  {@selector(setBackgroundColor:), [UIColor clearColor]},
					  {@selector(setUserInteractionEnabled:), @NO},
				  } size:{}];

	CKComponent *resultLabel = [CKLabelComponent newWithLabelAttributes:{
					    .string = (indicatesSuccess ? successText : failureText),
					    .color = [UIColor whiteColor],
					    .font = [UIFont fontWithName:@"Couchin" size:20.0],
					    .alignment = NSTextAlignmentCenter
				    } viewAttributes:{
					    {@selector(setBackgroundColor:), [UIColor clearColor]},
					    {@selector(setUserInteractionEnabled:), @NO},
				    } size:{}];

	CKComponent *flexComponent = CK::FlexboxComponentBuilder()
	                             .alignItems( CKFlexboxAlignItemsCenter )
	                             .children({ {flagLabel}, {resultLabel, .spacingBefore = 20}})
	                             .build();

	CKComponent *roundComponent = CK::BackgroundLayoutComponentBuilder()
	                              .component(CK::InsetComponentBuilder()
	                                         .insetsTop(40)
	                                         .insetsLeft(20)
	                                         .insetsBottom(40)
	                                         .insetsRight(20)
	                                         .component(flexComponent).build())
	                              .background([CKComponent newWithView:{
							   [UIView class],
							   {
								   {@selector(setBackgroundColor:), color},
								   {CKComponentViewAttribute::LayerAttribute(@selector(setCornerRadius:)), @10.0}
							   }
						   } size:{}])
	                              .build();

	CKComponent *centerComponent = CK::InsetComponentBuilder()
	                               .insetsLeft(20)
	                               .insetsRight(20)
	                               .component(CK::CenterLayoutComponentBuilder()
	                                          .centeringOptions(CKCenterLayoutComponentCenteringY)
	                                          .sizingOptions(CKCenterLayoutComponentSizingOptionMinimumY)
	                                          .child(roundComponent)
	                                          .build()
	                                          ).build();

	return [super newWithView:{[UIView class]} component: centerComponent];

}

@end
