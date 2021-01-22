//
//  Quote.h
//  ZayBanTest
//
//  Created by Ko Ko Aye on 21/01/2021.
//

#import <Foundation/Foundation.h>
#import "QuoteDisplayStyle.h"

NS_ASSUME_NONNULL_BEGIN

@interface Quote : NSObject

@property (nonatomic, readonly, copy) NSString *text;
@property (nonatomic, readonly, copy) NSString *author;
@property (nonatomic, readonly) QuoteDisplayStyle style;

-(instancetype)initWithText:(NSString *)text
        author:(NSString *) author
        style:(QuoteDisplayStyle) style;

@end

NS_ASSUME_NONNULL_END
