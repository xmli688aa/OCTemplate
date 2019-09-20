
//
//  CNSelectOrderTCell.m
//  youpinshitang_menu
//
//  Created by cean.q on 2019/9/19.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "CNSelectOrderTCell.h"
#import "CNOrderBtn.h"

@interface CNSelectOrderTCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *countLb;

@property (weak, nonatomic) IBOutlet UILabel *jifenLabel;
@property (weak, nonatomic) IBOutlet UILabel *orderLb;
@property (weak, nonatomic) IBOutlet UIView *selectView;
@property (weak, nonatomic) IBOutlet CNOrderBtn *deliverBtn;
@property (nonatomic, assign) NSInteger orderCount;
@end

@implementation CNSelectOrderTCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.orderCount = 1;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setMealModel:(MealModel *)mealModel{
    _mealModel = mealModel;
    _iconImageView.image = [UIImage imageNamed:mealModel.iconName];
    _nameLabel.text = mealModel.name;
    _jifenLabel.text = [NSString stringWithFormat:@"%@积分",mealModel.jifen];
    self.countLb.text = [NSString stringWithFormat:@"预定%ld", mealModel.count];
    self.deliverBtn.enabled = !mealModel.isDeliver;
}

- (IBAction)add:(id)sender {
    self.orderCount++;
    !_addBlock ?: _addBlock(self.mealModel);
}

- (IBAction)subtract:(id)sender {
    if (self.orderCount > 0) {
        self.orderCount--;
        !_subtractBlock ?: _subtractBlock(self.mealModel);
    }
}

- (IBAction)delever:(UIButton *)sender {
    sender.enabled = NO;
    !_orderBlock ?: _orderBlock();
}

- (void)setOrderCount:(NSInteger)orderCount {
    _orderCount = orderCount;
    self.orderLb.text = [NSString stringWithFormat:@"%ld", orderCount];
}

- (void)setIsOrder:(BOOL)isOrder {
    _isOrder = isOrder;
    self.selectView.hidden = isOrder;
}

- (void)hidOrderBtn:(BOOL)hidden {
    self.deliverBtn.hidden = hidden;
}

@end
