//
//  PhotoComponent.m
//  ZayBanTest
//
//  Created by Ko Ko Aye on 11/01/2021.
//

#import "PhotoComponent.h"
#import "Photo.h"
#import "ImageDownloader.h"

@implementation PhotoComponent

+ (instancetype)newWithPhoto:(Photo *)photo imageDownloader:(ImageDownloader *)imageDownloader action:(const CKAction<UIGestureRecognizer *> &)action {
    
	CKComponent *imageComponent = [CKNetworkImageComponent
	                               newWithURL:[photo imageURL]
	                               imageDownloader:imageDownloader
	                               size:{ 375, 300}
	                               options:{ .defaultImage = [UIImage imageNamed:@"pic1"]}
	                               attributes:{
					       { @selector(setContentMode:), @(UIViewContentModeScaleAspectFit)}
				       }];
    CKComponent *centerYComponent = [CKCenterLayoutComponent
                                     newWithCenteringOptions:CKCenterLayoutComponentCenteringY
                                     sizingOptions:CKCenterLayoutComponentSizingOptionMinimumY
                                     child:imageComponent
                                     size:{}];
	CKComponent *containerComponent = [CKFlexboxComponent
	                                   newWithView:{ [UIView class], {CKComponentTapGestureAttribute(action)}}
	                                   size:{}
	                                   style:{}
	                                   children:{{centerYComponent}}];
	return [self newWithComponent:containerComponent];
}

+ (id)initialState{
    return @NO;
}



@end
