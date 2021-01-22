//
//  ListItemComponent.m
//  ZayBanTest
//
//  Created by Ko Ko Aye on 17/01/2021.
//

#import "ListItemComponent.h"

@implementation ListItemComponent

+ (instancetype)newWithLabel:(NSString *)label {
	CKComponent *indicator = [CKImageComponent
	                          newWithImage:[UIImage imageNamed:@"ic_indicator"]
	                          attributes:
				  {
					  { @selector(setContentMode:), @(UIViewContentModeScaleAspectFit)},
					  { @selector(setClipsToBounds:), true }
				  }
	                          size:{ .width = 6, .height = 6}];

	CKComponent *text = [CKLabelComponent
	                     newWithLabelAttributes:{ .string = label,
				                      .font = [UIFont systemFontOfSize:14],
				                      .color=[UIColor blackColor]}
	                     viewAttributes:{}
	                     size:{ .width = CKRelativeDimension::Percent(100)}];

	CKComponent *layout = [CKFlexboxComponent
	                       newWithView:{}
	                       size:{}
	                       style:{ .direction = CKFlexboxDirectionRow, .spacing = 8, .alignContent = CKFlexboxAlignContentCenter }
	                       children:{ {indicator, .alignSelf = CKFlexboxAlignSelfCenter }, {text , .flexShrink = 1} }];

	return [self newWithComponent:layout];

}

@end
