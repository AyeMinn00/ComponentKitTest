//
//  WildGuessCollectionViewController.m
//  ZayBanTest
//
//  Created by Ko Ko Aye  on 22/01/2021.
//

#import "WildGuessCollectionViewController.h"
#import "QuoteModelController.h"
#import "QuotesPage.h"
#import "QuoteComponentFactory.h"
#import <ComponentKit/ComponentKit.h>

@interface WildGuessCollectionViewController () <UICollectionViewDelegateFlowLayout>

@end

@implementation WildGuessCollectionViewController
{
	CKCollectionViewDataSource *_dataSource;
	QuoteModelController *_quoteModelController;
	CKComponentFlexibleSizeRangeProvider *_sizeRangeProvider;
	WildeGuessQuoteComponentProvider _provider;
}

static UICollectionViewLayout *makeLayout(){
	UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
	[flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
	[flowLayout setMinimumInteritemSpacing:0];
	[flowLayout setMinimumLineSpacing:0];
	return flowLayout;
}

- (instancetype)init
{
	return [self initWithProvider:&ComponentProvider];
}

- (instancetype)initWithProvider:(WildeGuessQuoteComponentProvider)provider
{
	if(self = [super initWithCollectionViewLayout:makeLayout()]) {
		_sizeRangeProvider = [CKComponentFlexibleSizeRangeProvider providerWithFlexibility:CKComponentSizeRangeFlexibleHeight];
		_quoteModelController = [QuoteModelController new];
		_provider = provider;
		self.title = @"Wilde Guess";
		self.navigationItem.prompt = @"Tap to reveal which quotes are from Oscar Wilde";
	}
	return self;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	NSSet<NSString *> *imageNames = [NSSet setWithObjects:
	                                 @"LosAngeles",
	                                 @"MarketStreet",
	                                 @"Drops",
	                                 @"Powell",
	                                 nil];

	self.collectionView.backgroundColor = [UIColor whiteColor];
	self.collectionView.delegate = self;
	QuoteContext *context = [[QuoteContext alloc] initWithImageNames:imageNames];

	// Size configuration
	const CKSizeRange sizeRange = [_sizeRangeProvider sizeRangeForBoundingSize:self.collectionView.bounds.size];
	CKDataSourceConfiguration *configuration =
		[[CKDataSourceConfiguration<Quote *, QuoteContext *> alloc] initWithComponentProviderFunc:_provider
		 context:context
		 sizeRange:sizeRange];

	// Create the data source
	_dataSource = [[CKCollectionViewDataSource alloc] initWithCollectionView:self.collectionView
	               supplementaryViewDataSource:nil
	               configuration:configuration];
    
    // Insert the initial section
      CKDataSourceChangeset *initialChangeset =
      [[[CKDataSourceChangesetBuilder dataSourceChangeset]
        withInsertedSections:[NSIndexSet indexSetWithIndex:0]]
       build];
      [_dataSource applyChangeset:initialChangeset mode:CKUpdateModeAsynchronous userInfo:nil];
      [self _enqueuePage:[_quoteModelController fetchNewQuotesPageWithCount:4]];
}

-(void) _enqueuePage:(QuotesPage *)quotesPage
{
	NSArray *quotes = quotesPage.quotes;
	NSInteger position = quotesPage.position;
	NSMutableDictionary<NSIndexPath *, Quote *> *items = [NSMutableDictionary new];
	for (NSInteger i = 0; i < [quotes count]; i++) {
        Quote *q = quotes[i];
        NSLog(@"Quote is %@" , q.text);
		[items setObject:quotes[i] forKey:[NSIndexPath indexPathForRow:position + i inSection:0]];
	}
	CKDataSourceChangeset *changeset =
		[[[CKDataSourceChangesetBuilder dataSourceChangeset]
		  withInsertedItems:items]
		 build];
	[_dataSource applyChangeset:changeset mode:CKUpdateModeAsynchronous userInfo:nil];
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
  return [_dataSource sizeForItemAtIndexPath:indexPath];
}

- (void)collectionView:(UICollectionView *)collectionView
       willDisplayCell:(UICollectionViewCell *)cell
    forItemAtIndexPath:(NSIndexPath *)indexPath
{
  [_dataSource announceWillDisplayCell:cell];
}

- (void)collectionView:(UICollectionView *)collectionView
  didEndDisplayingCell:(UICollectionViewCell *)cell
    forItemAtIndexPath:(NSIndexPath *)indexPath
{
  [_dataSource announceDidEndDisplayingCell:cell];
}

static CKComponent *ComponentProvider(Quote *quote, QuoteContext *context)
{
	return QuoteComponentFactory(quote, context);
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
  if (scrollView.contentSize.height == 0) {
    return;
  }
  if (scrolledToBottomWithBuffer(scrollView.contentOffset, scrollView.contentSize, scrollView.contentInset, scrollView.bounds)) {
    [self _enqueuePage:[_quoteModelController fetchNewQuotesPageWithCount:8]];
  }
}

static BOOL scrolledToBottomWithBuffer(CGPoint contentOffset, CGSize contentSize, UIEdgeInsets contentInset, CGRect bounds)
{
  CGFloat buffer = CGRectGetHeight(bounds) - contentInset.top - contentInset.bottom;
  const CGFloat maxVisibleY = (contentOffset.y + bounds.size.height);
  const CGFloat actualMaxY = (contentSize.height + contentInset.bottom);
  return ((maxVisibleY + buffer) >= actualMaxY);
}

@end
