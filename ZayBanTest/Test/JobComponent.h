//
//  JobComponent.h
//  ZayBanTest
//
//  Created by Ko Ko Aye on 17/01/2021.
//

#import <Foundation/Foundation.h>
#import <ComponentKit/ComponentKit.h>

NS_ASSUME_NONNULL_BEGIN

@class Job;
@class ImageDownloader;

@interface JobComponent : CKCompositeComponent

+ (instancetype) newWithJob:(Job *)job imageDownloader:(ImageDownloader *)downloader;


@end

NS_ASSUME_NONNULL_END
