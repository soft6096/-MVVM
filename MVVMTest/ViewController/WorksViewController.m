//
//  WorksViewController.m
//  base
//
//  Created by 宇宙神帝 on 15/8/15.
//  Copyright (c) 2015年 kakalee. All rights reserved.
//

#import "WorksViewController.h"
#import "MJRefresh.h"
#import "WorksModel.h"
#import "WorksCell.h"

@interface WorksViewController () {
    IBOutlet UICollectionView *_collectionView;
    WorksViewModel *_worksViewModel;
    NSMutableArray *_data;
}
@end

@implementation WorksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_collectionView registerNib:[UINib nibWithNibName:@"WorksCell" bundle:nil] forCellWithReuseIdentifier:@"WorksCell"];
    
    _worksViewModel = [[WorksViewModel alloc]init];
    _collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [_worksViewModel refresh:true];
    }];
    
    _collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [_worksViewModel refresh:false];
    }];
    
    [_worksViewModel setBlockWithReturnBlock:^(id returnValue) {
        _data = returnValue;
        [_collectionView reloadData];
        [_collectionView.mj_header endRefreshing];
        [_collectionView.mj_footer endRefreshing];
    } WithErrorBlock:^(id errorCode) {
    } WithFailureBlock:^{
    }];
    [_collectionView.mj_header beginRefreshing];
}


#pragma datasource & delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _data.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WorksCell *worksCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WorksCell" forIndexPath:indexPath];
    worksCell.worksModel = [_data objectAtIndex:indexPath.row];
    return worksCell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = (self.view.frame.size.width - 20) / 3;
    return CGSizeMake(width, width * 1.5);
}

- (UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(5, 5, 5, 5);
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 5.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 5.0;
}
@end
