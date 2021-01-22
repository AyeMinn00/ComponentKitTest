//
//  AsyncVc.m
//  ZayBanTest
//
//  Created by Ko Ko Aye on 12/01/2021.
//

#import "AsyncVc.h"
#import "ZayBanTest-Swift.h"

@interface AsyncVc()

@property (nonatomic, strong) IGListAdapter *listAdapter;
@property (nonatomic , strong) ASCollectionNode *collectionNode;
@property (nonatomic , strong) PhotoDatasource *dataSource;

@end

@implementation AsyncVc

-(instancetype) init {
    ASDisplayNode *_node = [[ASDisplayNode alloc] init];
    if ( self = [super initWithNode:_node]){
        [self.node setAutomaticallyManagesSubnodes:true];
        self.navigationItem.title = @"Async Controller";
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _collectionNode = [[ASCollectionNode alloc] initWithCollectionViewLayout:layout];
        
        IGListAdapterUpdater *updater = [[IGListAdapterUpdater alloc] init];
        _listAdapter = [[IGListAdapter alloc] initWithUpdater:updater viewController:self workingRangeSize:0];
        [_listAdapter setASDKCollectionNode:_collectionNode];
        _dataSource = [[PhotoDatasource alloc] init];
        [_listAdapter setDataSource:_dataSource];
        
        self.node.layoutSpecBlock = ^ASLayoutSpec * _Nonnull(__kindof ASDisplayNode * _Nonnull node, ASSizeRange constrainedSize) {
            ASInsetLayoutSpec *layout =  [[ASInsetLayoutSpec alloc] init];
            [layout setInsets:UIEdgeInsetsZero];
            [layout setChild:self->_collectionNode];
            return layout;
        };
        
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    NSMutableArray<Picture *> *dataSet = [[NSMutableArray alloc] init];
    for(NSInteger i=0; i<10000; ++i){
        NSString *imgUrl = @"";
        if(i % 2 == 0){
            imgUrl = @"https://dramaslot.com/wp-content/uploads/2019/05/Heaven-Sword.jpg";
        }else if(i % 3 == 0){
            imgUrl = @"https://i.mydramalist.com/BmmD7s.jpg";
        }else {
            imgUrl = @"https://64.media.tumblr.com/c0c57e8f8535b9d7e45d349b4f772042/tumblr_po1le834Ns1syv3zao1_1280.jpg";
        }
        Picture *p = [[Picture alloc] initWithId:[[NSString alloc]initWithFormat:@"%ld",(long)i] url:[[NSURL alloc] initWithString:imgUrl]];
        [dataSet addObject:p];
    }
    
    _dataSource.dataSet = dataSet;
    [_listAdapter performUpdatesAnimated:true completion:nil];
    
}

@end
