//
//  JobComponent.m
//  ZayBanTest
//
//  Created by Ko Ko Aye on 17/01/2021.
//

#import "JobComponent.h"
#import "Job.h"
#import "ImageDownloader.h"
#import "ListItemComponent.h"

@implementation JobComponent

+ (instancetype)newWithJob:(Job *)job imageDownloader:(ImageDownloader *)downloader {

	// title
	CKLabelComponent *jobTitle = [CKLabelComponent
	                              newWithLabelAttributes:
				      {
					      .string = job.jobTitle,
					      .color = [UIColor blackColor],
					      .font = [UIFont systemFontOfSize:22]
				      }
	                              viewAttributes: {  }
	                              size:  { .width = CKRelativeDimension::Percent(0.5) }];


	// company image
	NSString *logoUrl = [NSString stringWithFormat:@"http://45.77.175.222/api/company/get-image/%@",job.logo];
	CKComponent *image = [CKNetworkImageComponent
	                      newWithURL:[NSURL URLWithString:logoUrl]
	                      imageDownloader:downloader
	                      size:{ 80, 80 }
	                      options:{ .defaultImage = [UIImage imageNamed:@"pic1"] }
	                      attributes:
			      {
				      {@selector(setContentMode:), @(UIViewContentModeScaleAspectFill)},
				      {@selector(setClipsToBounds:), true},
				      { CKComponentViewAttribute::LayerAttribute(@selector(setCornerRadius:)), @4.0},
				      { CKComponentViewAttribute::LayerAttribute(@selector(setBorderColor:)), (id)[[UIColor grayColor] CGColor]},
				      { CKComponentViewAttribute::LayerAttribute(@selector(setBorderWidth:)), @1.0}
			      }
	                     ];

	// job information
	CKComponent *location = [ListItemComponent newWithLabel:@"Mandalay Pyin OO lwin shwe bo nay pyi taw"];
	CKComponent *industryType = [ListItemComponent newWithLabel:@"IT Software , Hardware"];

	CKComponent *ver = [CKFlexboxComponent newWithView:{}
	                    size:{}
	                    style:{ .direction = CKFlexboxDirectionColumn, .spacing = 8}
	                    children:{ {location}, {industryType}}];

	CKComponent *hor = [CKFlexboxComponent newWithView:{}
	                    size:{}
	                    style:{ .direction = CKFlexboxDirectionRow, .spacing = 8, .alignItems = CKFlexboxAlignItemsStretch}
	                    children:{ {image}, {ver, .flexShrink = 1}}];

	CKFlexboxComponent *stack = [CKFlexboxComponent
	                             newWithView:{[UIView class]}
	                             size:{ }
	                             style:{ .spacing = 10, .alignItems = CKFlexboxAlignItemsStretch }
	                             children:{ {jobTitle, .flexGrow = 1}, { .component = hor, .flexGrow = 1 }} ];


//	CKInsetComponent *container = [CKInsetComponent newWithInsets:{ .left = 10, .right = 10, .bottom = 10, .top = 10} component: stack];
	CKComponent *container = [CKFlexboxComponent
	                          newWithView:{}
	                          size:{ }
	                          style:{ .alignItems = CKFlexboxAlignItemsStretch }
	                          children:{ {.component = stack } }];
	return [self newWithComponent:container];
}

@end




