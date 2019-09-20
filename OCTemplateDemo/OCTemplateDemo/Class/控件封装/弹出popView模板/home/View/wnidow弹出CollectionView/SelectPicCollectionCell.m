//
//  SelectPicCollectionCell.m
//  Server
//
//  Created by Ethon.Z on 2019/9/18.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "SelectPicCollectionCell.h"

@interface SelectPicCollectionCell ()
@property (weak, nonatomic) IBOutlet UIImageView *mealIconImageView;
@property (weak, nonatomic) IBOutlet UIImageView *iconSelectImageView;

@end

@implementation SelectPicCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setMealModel:(MealModel *)mealModel{
    _mealModel = mealModel;
    _mealIconImageView.image = [UIImage imageNamed:mealModel.iconName];
    _iconSelectImageView.hidden = !mealModel.selected;
}



@end
