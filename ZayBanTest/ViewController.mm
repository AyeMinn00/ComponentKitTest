//
//  ViewController.m
//  ZayBanTest
//
//  Created by Ko Ko Aye on 11/01/2021.
//

#import "ViewController.h"
#import "PhotoComponentProvider.h"
#import "PhotoComponent.h"
#import "ImageDownloader.h"
#import "Photo.h"
#import <ComponentKit/ComponentKit.h>

@interface ViewController () < UICollectionViewDelegateFlowLayout> {
	UICollectionView *_collectionView;
	CKCollectionViewDataSource *_dataSource;
}

@end

@implementation ViewController

+ (instancetype)viewController {
	return [[ViewController alloc] initWithNibName:nil bundle:nil];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if(self) {
		// create collection view
        self.navigationItem.title = @"Component Kit";
		_collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero
		                   collectionViewLayout:[[UICollectionViewFlowLayout alloc] init] ];
		_imageDownloader = [[ImageDownloader alloc] init];
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];

	[self.view addSubview:_collectionView];
	[_collectionView setTranslatesAutoresizingMaskIntoConstraints:NO];
	NSArray<NSString *> *formats = @[@"H:|[C]|", @"V:|[C]|"];
	for (NSString *format in formats) {
		[self.view
		 addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:format
		                 options:0
		                 metrics:nil
		                 views:@{@"C": _collectionView}]];
	}

	_collectionView.delegate = self;
	_collectionView.backgroundColor = [UIColor whiteColor];
	self.view.backgroundColor = [UIColor whiteColor];

	// setup datasource
	_dataSource = [[CKCollectionViewDataSource alloc]
	               initWithCollectionView:_collectionView
	               supplementaryViewDataSource:nil
	               configuration:[[CKDataSourceConfiguration alloc]
	                              initWithComponentProvider:[PhotoComponentProvider class]
	                              context:self
	                              sizeRange:[[CKComponentFlexibleSizeRangeProvider
	                                          providerWithFlexibility:CKComponentSizeRangeFlexibleHeight]
	                                         sizeRangeForBoundingSize:self.view.bounds.size]]];

	// render initial data
	CKDataSourceChangeset *initialData = [[[CKDataSourceChangesetBuilder dataSourceChangeset]
	                                       withInsertedSections:[NSIndexSet indexSetWithIndex:0]] build];
	[_dataSource applyChangeset:initialData mode:CKUpdateModeAsynchronous userInfo:nil];

	// add data
    Photo *p = [[Photo alloc] initWithIdentifier:@"1" _url:@"http://45.77.175.222/get-company/rvfeNJp7wocptxNqSjkmR48EFSwNnwloJCIEnz5N.png"];
    Photo *p2 = [[Photo alloc] initWithIdentifier:@"2" _url:@"https://dramaslot.com/wp-content/uploads/2019/05/Heaven-Sword.jpg"];
    Photo *p3 = [[Photo alloc] initWithIdentifier:@"3" _url:@"https://64.media.tumblr.com/c0c57e8f8535b9d7e45d349b4f772042/tumblr_po1le834Ns1syv3zao1_1280.jpg"];
    Photo *p4 = [[Photo alloc] initWithIdentifier:@"4" _url:@"https://i.mydramalist.com/BmmD7s.jpg"];
    NSMutableArray<Photo *> *data = [NSMutableArray arrayWithObjects:p, p2, p3, p4, nil];
    for(NSInteger i=0; i<10000; ++i){
        NSString *imgUrl = @"";
        if(i % 2 == 0){
            imgUrl = @"https://dramaslot.com/wp-content/uploads/2019/05/Heaven-Sword.jpg";
        }else if(i % 3 == 0){
            imgUrl = @"https://i.mydramalist.com/BmmD7s.jpg";
        }else {
            imgUrl = @"https://64.media.tumblr.com/c0c57e8f8535b9d7e45d349b4f772042/tumblr_po1le834Ns1syv3zao1_1280.jpg";
        }
        Photo *p = [[Photo alloc] initWithIdentifier:@"1" _url:imgUrl];
        [data addObject:p];
    }
//    NSArray *images = @[p , p2, p3 , p4];
	NSMutableDictionary<NSIndexPath *, Photo *> *imglist = [NSMutableDictionary dictionaryWithCapacity:data.count];
	for (NSInteger idx = 0; idx < [data count]; ++idx) {
		[imglist setObject:data[idx]
		 forKey:[NSIndexPath indexPathForRow:idx inSection:0]];
	}
	CKDataSourceChangeset *newData = [[[CKDataSourceChangesetBuilder dataSourceChangeset] withInsertedItems:imglist] build];
	[_dataSource applyChangeset:newData mode:CKUpdateModeAsynchronous userInfo:nil];

}

- (void)onTap:(Photo *)photo {
    NSLog(@"tap photo %@" ,photo.identifier);
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [_dataSource sizeForItemAtIndexPath:indexPath];
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

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    Photo *photo = (Photo *)[_dataSource modelForItemAtIndexPath:indexPath];
    NSLog(@"Photo is %@", [photo identifier]);
}

@end
