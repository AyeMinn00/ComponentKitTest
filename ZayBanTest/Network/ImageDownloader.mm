//
//  ImageDownloader.m
//  ZayBanTest
//
//  Created by Ko Ko Aye on 11/01/2021.
//

#import "ImageDownloader.h"
#import "NetworkService.h"

@implementation ImageDownloader

- (id)downloadImageWithURL:(NSURL *)URL
        caller:(id)caller
        callbackQueue:(dispatch_queue_t)callbackQueue
        downloadProgressBlock:(void (^)(CGFloat))downloadProgressBlock
        completion:(void (^)(CGImageRef, NSError *))completion{
    [NetworkService getPhotoWithURL:URL completion:^(UIImage * _Nullable image) {
        dispatch_async(callbackQueue, ^{
            if( image == nil){
                completion(nil , [NSError errorWithDomain:@"domain" code:0 userInfo:nil]);
            }else{
                completion(image.CGImage , nil);
            }
        });
    }];
	return [URL absoluteString];
}

- (void)cancelImageDownload:(id)download {

}



@end
