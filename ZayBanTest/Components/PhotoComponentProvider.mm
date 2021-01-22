//
//  PhotoComponentProvider.cpp
//  ZayBanTest
//
//  Created by Ko Ko Aye on 11/01/2021.
//

#import "PhotoComponentProvider.h"
#import "PhotoComponent.h"
#import "Photo.h"
#import "ViewController.h"
#import "JobComponent.h"
#import "Job.h"
#import <ComponentKit/ComponentKit.h>

@implementation PhotoComponentProvider

+ (CKComponent *) componentForModel:(id<NSObject>)model context:(id<NSObject>)context
{
	return [self componentForPhoto:(Photo *)model sender:(ViewController *)context];
}

+ (CKComponent *) componentForPhoto:(Photo *)photo sender:(ViewController *)sender; {
	CKAction<UIGestureRecognizer *>action = CKAction<UIGestureRecognizer *>::actionFromBlock(^(CKComponent *, UIGestureRecognizer *__strong) {
		[sender onTap:photo];
	});

	return [PhotoComponent
	        newWithPhoto:photo
	        imageDownloader:sender.imageDownloader
	        action:action];
}

@end
