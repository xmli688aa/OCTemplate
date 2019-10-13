
//
//  ETCollectionTemplateVC.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/10/13.
//  Copyright © 2019 zhao. All rights reserved.
//

#import "ETCollectionTemplateVC.h"
#import "CollectionTemplateCell.h"

@interface ETCollectionTemplateVC ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ETCollectionTemplateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerNib:[UINib nibWithNibName:@"CollectionTemplateCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"CollectionTemplateCell"];
    //设置collection的偏移量
    self.collectionView.contentInset = UIEdgeInsetsMake(100, 0, 20, 0);
    self.collectionView.backgroundColor = UIColor.systemRedColor;
}

#pragma mark - UICollectionViewDataSource, UICollectionViewDelegate
    
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 30;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionTemplateCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionTemplateCell" forIndexPath:indexPath];
    return cell;
}
//每个item的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGSize size = CGSizeMake(90,90);
    return size;
}
//每个item之间的行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 15;
}
////每个item之间的列间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 30;
}
//边距设置:整体边距的优先级，始终高于内部边距的优先级 (可能会导致内部边距设置无效)
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
 return UIEdgeInsetsMake(20, 20, 20, 20);//分别为上、左、下、右
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",indexPath.row);
}


@end
