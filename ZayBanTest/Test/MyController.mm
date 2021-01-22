//
//  MyController.m
//  ZayBanTest
//
//  Created by Ko Ko Aye on 12/01/2021.
//

#import "MyController.h"
#import <ComponentKit/ComponentKit.h>
#import "NameComponentProvider.h"
#import "NetworkManager.h"
#import "FilterData.h"
#import "JobList.h"
#import "ImageDownloader.h"

@interface MyController () < UICollectionViewDelegateFlowLayout> {
	CKCollectionViewDataSource *_dataSource;
	UICollectionView *_collectionView;
}

@end

@implementation MyController

-(instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if(self) {
		self.navigationItem.title = @"MyController";
		UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        [layout setMinimumInteritemSpacing:8];
//        [layout setMinimumLineSpacing: 200];
//        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
		_collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
		_downloader = [[ImageDownloader alloc] init];
	}
	return self;
}

//- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout{
//    self = [super initWithCollectionViewLayout:layout];
//    if(self){
//        self.navigationItem.title = @"MyController";
//        _downloader = [[ImageDownloader alloc] init];
//    }
//    return self;
//}

- (void)viewDidLoad {
	[super viewDidLoad];
	NSLog(@"view did load");
	[self.view setBackgroundColor:[UIColor whiteColor]];
	[self.view addSubview:_collectionView];
	[_collectionView setTranslatesAutoresizingMaskIntoConstraints:NO];
//    NSArray<NSString *> *formats = @[@"H:|[C]|", @"V:|[C]|"];
//    for (NSString *format in formats) {
//        [self.view
//         addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:format
//                         options:0
//                         metrics:nil
//                         views:@{@"C": _collectionView}]];
//    }
	[[[_collectionView topAnchor] constraintEqualToAnchor:self.view.topAnchor] setActive:YES];
	[[[_collectionView bottomAnchor] constraintEqualToAnchor:self.view.bottomAnchor] setActive:YES];
	[[[_collectionView leadingAnchor] constraintEqualToAnchor:self.view.leadingAnchor] setActive:YES];
	[[[_collectionView trailingAnchor] constraintEqualToAnchor:self.view.trailingAnchor] setActive:YES];
	[_collectionView setBackgroundColor:[UIColor whiteColor]];
	_collectionView.delegate = self;
	// Range Provider
//    CKComponentFlexibleSizeRangeProvider *_sizeRangeProvider = [CKComponentFlexibleSizeRangeProvider providerWithFlexibility:CKComponentSizeRangeFlexibleWidthAndHeight];
//	const CKSizeRange sizeRange = [_sizeRangeProvider sizeRangeForBoundingSize:self.view.bounds.size];

	// Data source Configuration
//    CKDataSourceConfiguration *configuration = [[CKDataSourceConfiguration alloc] initWithComponentProviderFunc:ComponentProvider context:context sizeRange:sizeRange];
//	CKDataSourceConfiguration *configuration = [[CKDataSourceConfiguration alloc] initWithComponentProvider:[NameComponentProvider class] context:self sizeRange:sizeRange];
    CKDataSourceConfiguration *configuration = [[CKDataSourceConfiguration alloc] initWithComponentProvider:[NameComponentProvider class] context:self sizeRange:{
        CGSizeMake(self.view.bounds.size.width, 0),
        CGSizeMake(self.view.bounds.size.width, INFINITY)
    }];
	// Data source
	_dataSource = [[CKCollectionViewDataSource alloc] initWithCollectionView:_collectionView supplementaryViewDataSource:nil configuration:configuration];

	// render initial data
	CKDataSourceChangeset *initialData = [[[CKDataSourceChangesetBuilder dataSourceChangeset]
	                                       withInsertedSections:[NSIndexSet indexSetWithIndex:0]] build];

	[_dataSource applyChangeset:initialData mode:CKUpdateModeAsynchronous userInfo:nil];

	[self getJobPosts];

}

- (void)viewDidLayoutSubviews {
	[super viewDidLayoutSubviews];
//	[_collectionView.collectionViewLayout invalidateLayout];
//	[_dataSource reloadWithMode:CKUpdateModeAsynchronous userInfo:nil];
    NSLog(@"view did layout subviews %f ", self.view.bounds.size.width);
    
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
//    [_dataSource reloadWithMode:CKUpdateModeAsynchronous userInfo:nil];
//    NSLog(@"viewWillTransitionToSize");
//    [[_collectionView collectionViewLayout] invalidateLayout];
//    CKDataSourceConfiguration *configuration = [[CKDataSourceConfiguration alloc] initWithComponentProvider:[NameComponentProvider class] context:self sizeRange:{
//        CGSizeMake(self.view.bounds.size.width, 0),
//        CGSizeMake(self.view.bounds.size.width, INFINITY)
//    }];
//    [_dataSource updateConfiguration:configuration mode:CKUpdateModeAsynchronous userInfo:nil];
}

-(void) getFilterData {
	[[NetworkManager sharedManager] tokenCheckWithSuccess:^(id responseObject) {
	         FilterData *response = [[FilterData alloc] initWithDictionary: responseObject error:nil];
	         [self bindData:response];
	 } failure:^(NSString * failureReason, NSInteger statusCode) {
	         NSLog(@"failure reason %@ , status %ld", failureReason, (long) statusCode);
	 }];

}

-(void) getJobPosts {
	[[NetworkManager sharedManager] getJobPosts:^(id _Nonnull responseObject) {
	         JobList *response = [[JobList alloc] initWithDictionary:responseObject error:nil];
	         [self bindJob:response];
	 } failure:^(NSString * _Nonnull failureReason, NSInteger statusCode) {
	         NSLog(@"api fail job posts");
	 }];
}

-(void) bindData: (FilterData *)response {
	NSMutableArray<NSString *> *data = [[NSMutableArray alloc] init];
	for(ChoiceData *value in response.location) {
		[data addObject:value.name];
	}
	NSLog(@"data count %ld", data.count);
	NSMutableDictionary<NSIndexPath *, NSString *> *dataSet =
		[NSMutableDictionary dictionaryWithCapacity:data.count];

	for(NSInteger i = 0; i < [data count]; ++i) {
		[dataSet setObject:data[i] forKey:[NSIndexPath indexPathForRow:i inSection:0]];
	}

	CKDataSourceChangeset *newData = [[[CKDataSourceChangesetBuilder dataSourceChangeset] withInsertedItems:dataSet] build];
	[_dataSource applyChangeset:newData mode:CKUpdateModeAsynchronous userInfo:nil];
}

-(void) bindJob:(JobList *)response {
	NSMutableArray<Job *> *data = [[NSMutableArray alloc] init];
	for(Job *value in response.data) {
		[data addObject:value];
	}
	NSLog(@"data count %ld", data.count);
	NSMutableDictionary<NSIndexPath *, Job *> *dataSet =
		[NSMutableDictionary dictionaryWithCapacity:data.count];

	for(NSInteger i = 0; i < [data count]; ++i) {
		[dataSet setObject:data[i] forKey:[NSIndexPath indexPathForRow:i inSection:0]];
	}

	CKDataSourceChangeset *newData = [[[CKDataSourceChangesetBuilder dataSourceChangeset] withInsertedItems:dataSet] build];
	[_dataSource applyChangeset:newData mode:CKUpdateModeAsynchronous userInfo:nil];
}

- (void)onTap:(NSString *)str {
	NSLog(@"name is %@", str);
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView
        layout:(UICollectionViewLayout *)collectionViewLayout
        sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size = [_dataSource sizeForItemAtIndexPath:indexPath];
    NSLog(@"sizeForItemAtIndexPath %f", size.width );
    CGSize s = CGSizeMake(self.view.bounds.size.width, size.height);
    return s;
}

#pragma mark UICollectionViewDelegate
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

- (void)collectionView:(UICollectionView *)collectionView
        didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
	NSString *str = (NSString *)[_dataSource modelForItemAtIndexPath:indexPath];
	NSLog(@"select item at %ld , value is %@", [indexPath row], str);
}

- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
}

@end
