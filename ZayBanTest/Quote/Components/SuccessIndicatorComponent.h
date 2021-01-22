//
//  SuccessIndicatorComponent.h
//  ZayBanTest
//
//  Created by Ko Ko Aye on 22/01/2021.
//

#import <Foundation/Foundation.h>
#import <ComponentKit/CKCompositeComponent.h>

NS_ASSUME_NONNULL_BEGIN

@interface SuccessIndicatorComponent : CKCompositeComponent

+ (instancetype) newWithIndicatesSuccess:(BOOL) indicatesSuccess
        successText:(NSString *)successText
        failureText:(NSString *)failureText;

@end

NS_ASSUME_NONNULL_END
