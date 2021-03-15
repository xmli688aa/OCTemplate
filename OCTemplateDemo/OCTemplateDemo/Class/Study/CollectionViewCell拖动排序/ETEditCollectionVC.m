//
//  ETEditCollectionVC.m
//  DarkMode
//
//  Created by ET on 2020/12/6.
//  Copyright © 2020 https://github.com/wsl2ls   ----- . All rights reserved.
//

#import "ETEditCollectionVC.h"
#import "ETCollectionSortCell.h"
#import "ETEditModel.h"

@interface ETEditCollectionVC ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation ETEditCollectionVC

- (NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
        [_dataArray addObjectsFromArray:@[
            [[ETEditModel alloc] initWithTitle:@"编辑1"],
            [[ETEditModel alloc] initWithTitle:@"编辑2"],
            [[ETEditModel alloc] initWithTitle:@"编辑3"],
            [[ETEditModel alloc] initWithTitle:@"编辑4"],
            [[ETEditModel alloc] initWithTitle:@"编辑5"],
            [[ETEditModel alloc] initWithTitle:@"编辑6"],
            [[ETEditModel alloc] initWithTitle:@"编辑7"],
        ]];
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"长按排序";
    [self addCollectionView];

}
- (void)addCollectionView{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake((kScreenWidth-50.0)/4, 85);
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 0.1;
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    self.collectionView = collectionView;
    [self.view addSubview:collectionView];
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [collectionView registerClass:[ETCollectionSortCell class] forCellWithReuseIdentifier:@"ETSortBtnCell"];
    //添加手势
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handlelongGesture:)];
    [collectionView addGestureRecognizer:longPress];
    
    
}

#pragma mark 长按响应方法
- (void)handlelongGesture:(UILongPressGestureRecognizer *)longPress {
    [self action:longPress];
}

- (void)action:(UILongPressGestureRecognizer *)longPress {
    switch (longPress.state) {
        case UIGestureRecognizerStateBegan:
            {
                //手势开始
                //判断手势落点位置是否在row上
                NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:[longPress locationInView:self.collectionView]];
                if (indexPath == nil) {
                    break;
                }
                ETCollectionSortCell *cell = (ETCollectionSortCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
                [self.collectionView bringSubviewToFront:cell];
                //iOS9 方法 移动cell
                [self.collectionView beginInteractiveMovementForItemAtIndexPath:indexPath];
            }
            break;
        case UIGestureRecognizerStateChanged:
            {
                //iOS9 方法 移动过程中随时更新cell位置
                [self.collectionView updateInteractiveMovementTargetPosition:[longPress locationInView:self.collectionView]];
            }
            break;
        case UIGestureRecognizerStateEnded:
            {
                //手势结束
                //iOS9方法 移动结束后关闭cell移动
                [self.collectionView endInteractiveMovement];
            }
            break;
        default:
            [self.collectionView cancelInteractiveMovement];
            break;
    }
}

#pragma mark - UICollectionViewDelegate, UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return  1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ETCollectionSortCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ETSortBtnCell" forIndexPath:indexPath];
    ETEditModel *model = self.dataArray[indexPath.row];
    cell.model = model;
    return  cell;
}
//开启collectionView可以移动
- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
//处理collectionView移动过程中的数据操作
- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    //取出移动row 数据
    ETEditModel *model = self.dataArray[sourceIndexPath.row];
//    //从数据源中移除该数据
    [self.dataArray removeObject:model];
//    //将数据插入到数据源中目标位置
    [self.dataArray insertObject:model atIndex:destinationIndexPath.row];

}

@end
