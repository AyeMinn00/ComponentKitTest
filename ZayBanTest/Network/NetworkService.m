//
//  NetworkService.m
//  ZayBanTest
//
//  Created by Ko Ko Aye on 11/01/2021.
//

#import "NetworkService.h"

@implementation NetworkService

+ (void)getPhotoWithURL:(NSURL *)photoURL completion:(void (^)(UIImage * _Nullable))completion{
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask *task = [session dataTaskWithURL:photoURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        completion([UIImage imageWithData:data]);
    }];
    [task resume];
}

@end
