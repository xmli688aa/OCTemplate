//
//  ETEditTableViewCell.m
//  DarkMode
//
//  Created by ET on 2020/12/5.
//  Copyright © 2020 https://github.com/wsl2ls   ----- . All rights reserved.
//

#import "ETEditTableViewCell.h"
#import "ETEditModel.h"

@interface ETEditTableViewCell ()
@property (nonatomic, strong) UILabel *nameLabel;

@end

@implementation ETEditTableViewCell


- (void)addOtherSubviews{
    UIView *bgView = [[UIView alloc] init];
//    bgView.backgroundColor = UIColor.redColor;
// bgView 是添加到self上面 不是contentView上面
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self);
    }];
    
    UIImageView *icon = [[UIImageView alloc] init];
    icon.backgroundColor = [UIColor redColor];
    icon.image = [UIImage imageNamed:@"wsl"];
    [bgView addSubview:icon];
    
    
    [icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgView).offset(5);
        make.left.equalTo(bgView).offset(10);
        make.bottom.equalTo(bgView).offset(-5);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    _nameLabel = [[UILabel alloc] init];
    _nameLabel.textColor = [UIColor blackColor];
    [bgView addSubview:_nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(icon.mas_right).offset(5);
        make.centerY.equalTo(icon);
    }];
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor lightGrayColor];
    [bgView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(10);
        make.right.equalTo(bgView.mas_right);
        make.height.equalTo(@0.5);
        make.bottom.equalTo(bgView);
    }];
    
}
- (void)setModel:(ETEditModel *)model{
    _model = model;
    self.nameLabel.text = model.title;
}
//循环遍历找出拖动的图片 然后替换
- (void)setEditing:(BOOL)editing animated:(BOOL)animated{
    [super setEditing:editing animated:animated];
    if (editing) {
        for (UIView *view in self.subviews) {
            if ([NSStringFromClass(view.class) rangeOfString:@"Reorder"].location != NSNotFound) {
                for (UIView *subView in view.subviews) {
                    if ([subView isKindOfClass: UIImageView.class]) {
                        ((UIImageView *)subView).image = [UIImage imageNamed:@"Reorder_Image"];
                    }
                }
            }
        }
    }
}
@end
