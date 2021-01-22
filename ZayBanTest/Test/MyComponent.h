//
//  MyComponent.h
//  ZayBanTest
//
//  Created by Ko Ko Aye on 12/01/2021.
//

#import <Foundation/Foundation.h>
#import <ComponentKit/ComponentKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyComponent : CKCompositeComponent

+ (instancetype) newWithModel:(NSString *)name
    action:(const CKAction<UIGestureRecognizer *> &) action;

@end

NS_ASSUME_NONNULL_END
