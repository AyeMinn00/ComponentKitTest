//
//  QuotesPage.h
//  ZayBanTest
//
//  Created by Ko Ko Aye on 21/01/2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class Quote;

@interface QuotesPage : NSObject

@property (nonatomic , readonly , copy) NSArray<Quote *> *quotes;
@property (nonatomic , readonly , assign) NSInteger position;

-(instancetype) initWithQuotes:(NSArray<Quote *> *)quotes
                      position:(NSInteger)position;

@end

NS_ASSUME_NONNULL_END
