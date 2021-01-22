//
//  PhotoComponent.h
//  ZayBanTest
//
//  Created by Ko Ko Aye on 11/01/2021.
//

#import <ComponentKit/ComponentKit.h>

NS_ASSUME_NONNULL_BEGIN

@class Photo;
@class ImageDownloader;

@interface PhotoComponent : CKCompositeComponent

+ (instancetype)newWithPhoto:(Photo *)photo
        imageDownloader:(ImageDownloader *)imageDownloader
        action:(const CKAction<UIGestureRecognizer *> &)action;

@end

NS_ASSUME_NONNULL_END
