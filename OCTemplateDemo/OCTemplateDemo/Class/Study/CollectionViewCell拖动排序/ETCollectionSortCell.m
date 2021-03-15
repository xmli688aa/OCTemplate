//
//  ETSortBtnCell.m
//  DarkMode
//
//  Created by ET on 2020/12/6.
//  Copyright © 2020 https://github.com/wsl2ls   ----- . All rights reserved.
//

#import "ETCollectionSortCell.h"
#import "ETEditModel.h"

@interface ETCollectionSortCell ()
@property (nonatomic, strong) UILabel *nameLabel;
@end

@implementation ETCollectionSortCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUI];
    }
    return  self;
}
- (void)setUI{
    self.backgroundColor = [UIColor greenColor];

    UIView *bgView = [[UIView alloc] init];
    [self.contentView addSubview:bgView];
    bgView.backgroundColor = [UIColor redColor];
    bgView.layer.cornerRadius = 6;

    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.contentView).mas_offset(5);
        make.top.mas_equalTo(self.contentView).offset(5);
        make.left.mas_equalTo(self.contentView).offset(5);
        make.bottom.mas_equalTo(self.contentView).offset(-5);
        make.right.mas_equalTo(self.contentView).offset(-5);
    }];
    _nameLabel = [[UILabel alloc] init];
    [bgView addSubview:_nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(bgView);
    }];
}
- (void)setModel:(ETEditModel *)model{
    _model = model;
    _nameLabel.text = model.title;
}

@end
