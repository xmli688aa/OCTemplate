
//
//  HomeTableViewCell.m
//  youpinshitang_menu
//
//  Created by Ethon.Z on 2019/9/17.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "HomeTableViewCell.h"

@interface HomeTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *countLb;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@property (weak, nonatomic) IBOutlet UILabel *jifenLabel;
@end

@implementation HomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
#ifdef SERVER
    [self.countLb removeFromSuperview];
    [self.addBtn removeFromSuperview];
#else
    
#endif
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setMealModel:(MealModel *)mealModel{
    _mealModel = mealModel;
    _iconImageView.image = [UIImage imageNamed:mealModel.iconName];
    _nameLabel.text = mealModel.name;
    _jifenLabel.text = [NSString stringWithFormat:@"%ld积分",mealModel.jifen];
#ifdef SERVER
    
#else
    self.countLb.text = [NSString stringWithFormat:@"预定%ld", mealModel.count];
#endif
}

#ifdef SERVER

#else
- (IBAction)add:(id)sender {
    !_addBlock ?: _addBlock();
}
#endif

@end
