//
//  WildGuessCollectionViewController.h
//  ZayBanTest
//
//  Created by Ko Ko Aye  on 22/01/2021.
//

#import <Foundation/Foundation.h>

#import <ComponentKit/CKComponent.h>
#import "Quote.h"
#import "QuoteContext.h"

NS_ASSUME_NONNULL_BEGIN

typedef CKComponent *_Nonnull(*WildeGuessQuoteComponentProvider)(Quote *_Nonnull, QuoteContext *_Nonnull);

@interface WildGuessCollectionViewController : UICollectionViewController

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout NS_UNAVAILABLE;
- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil NS_UNAVAILABLE;
- (nullable instancetype)initWithCoder:(NSCoder *)coder NS_UNAVAILABLE;

- (instancetype)initWithProvider:(WildeGuessQuoteComponentProvider)provider NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
