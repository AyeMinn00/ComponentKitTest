//
//  ListItemComponent.h
//  ZayBanTest
//
//  Created by Ko Ko Aye on 17/01/2021.
//

#import <Foundation/Foundation.h>
#import <ComponentKit/ComponentKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListItemComponent : CKCompositeComponent

+ (instancetype) newWithLabel:(NSString *)label;

@end

NS_ASSUME_NONNULL_END
