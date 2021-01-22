//
//  NameComponentProvider.m
//  ZayBanTest
//
//  Created by Ko Ko Aye on 12/01/2021.
//

#import "NameComponentProvider.h"
#import "MyComponent.h"
#import "MyController.h"
#import "JobComponent.h"

@implementation NameComponentProvider

+ (CKComponent *)componentForModel:(id<NSObject>)model context:(id<NSObject>)context {
//    MyController *sender = (MyController *) context;
//    CKAction<UIGestureRecognizer *> action = CKAction<UIGestureRecognizer *>::actionFromBlock(^(CKComponent *, UIGestureRecognizer *__strong) {
//        [sender onTap:model];
//    });
//    return [MyComponent newWithModel:model action:action];
    return [ JobComponent newWithJob:(Job *)model imageDownloader:((MyController *)context).downloader];
}

@end
