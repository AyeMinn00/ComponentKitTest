//
//  MyController.h
//  ZayBanTest
//
//  Created by Ko Ko Aye on 12/01/2021.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ImageDownloader;

@interface MyController : UIViewController

-(void)onTap:(NSString *)str;

@property (readonly) ImageDownloader *downloader;

@end

NS_ASSUME_NONNULL_END
