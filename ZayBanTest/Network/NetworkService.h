//
//  NetworkService.h
//  ZayBanTest
//
//  Created by Ko Ko Aye on 11/01/2021.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class Photo;

@interface NetworkService : NSObject

+ (void) getPhotoWithURL: (NSURL *)photoURL completion:(void(^)(UIImage * _Nullable image)) completion;

@end

NS_ASSUME_NONNULL_END
