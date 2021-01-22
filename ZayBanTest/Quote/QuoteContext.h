//
//  QuoteContext.h
//  ZayBanTest
//
//  Created by Ko Ko Aye on 21/01/2021.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QuoteContext : NSObject

- (instancetype) initWithImageNames: (NSSet<NSString *> *)imageNames;
- (UIImage *)imageNamed:(NSString *)imageName;

@end

NS_ASSUME_NONNULL_END
