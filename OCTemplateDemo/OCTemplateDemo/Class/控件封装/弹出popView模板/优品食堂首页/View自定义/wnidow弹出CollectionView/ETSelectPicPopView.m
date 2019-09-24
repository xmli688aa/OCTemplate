//
//  ETSelectPicPopView.m
//  Server
//
//  Created by Ethon.Z on 2019/9/18.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "ETSelectPicPopView.h"
#import "SelectPicCollectionCell.h"

@interface ETSelectPicPopView ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSArray *dataArray;

@property (copy, nonatomic) void (^selectBlock)(MealModel *selectMealModel);
@property (strong, nonatomic) MealModel *selectModel;

@end

@implementation ETSelectPicPopView
    
+ (void)showSelectPicPopViewWithMealModelsArray:(NSArray *)mealModelsArray selectBlock:(void (^)(MealModel *selectMealModel))selectBlock{
    ETSelectPicPopView *popView = [[ETSelectPicPopView alloc] init];
    popView.dataArray = mealModelsArray;
    popView.selectBlock = selectBlock;
    
    popView.frame = [UIScreen mainScreen].bounds;
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:popView];
    [popView.collectionView registerNib:[UINib nibWithNibName:@"SelectPicCollectionCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"SelectPicCollectionCell"];

}
    
    
- (IBAction)close:(id)sender {
    if (self.selectBlock) {
        self.selectBlock(self.selectModel);
    }
    [self removeFromSuperview];
}
    
#pragma mark - UICollectionViewDataSource, UICollectionViewDelegate
    
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SelectPicCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SelectPicCollectionCell" forIndexPath:indexPath];
    MealModel *model = self.dataArray[indexPath.row];
    cell.mealModel = model;
    return cell;
}
    
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGSize size = CGSizeMake(90,90);
    return size;
}
    
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 15;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    for ( MealModel *model in self.dataArray) {
        model.selected = NO;
    }
    MealModel *model = self.dataArray[indexPath.row];
    model.selected = YES;
    self.selectModel = model;
    
    [collectionView reloadData];
    NSLog(@"%ld",indexPath.row);
}

    
@end
