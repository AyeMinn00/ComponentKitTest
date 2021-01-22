//
//  ViewController.h
//  ZayBanTest
//
//  Created by Ko Ko Aye on 11/01/2021.
//

#import <UIKit/UIKit.h>

@class ImageDownloader;
@class Photo;

@interface ViewController : UIViewController

+ (instancetype)viewController;
- (void)onTap:(Photo *)photo;

@property (readonly) ImageDownloader *imageDownloader;

@end

