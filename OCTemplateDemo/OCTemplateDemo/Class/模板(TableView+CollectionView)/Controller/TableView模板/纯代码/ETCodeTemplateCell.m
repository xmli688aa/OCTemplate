//
//  ETCodeTemplateCell.m
//  OCTemplateDemo
//
//  Created by zhaowz on 2020/8/10.
//  Copyright © 2020 zhao. All rights reserved.
//

#import "ETCodeTemplateCell.h"

@interface ETCodeTemplateCell ()

@end

@implementation ETCodeTemplateCell

+ (instancetype )cellWithTableView:(UITableView *)tableView{
    NSString *reusedID = NSStringFromClass([self class]);
    ETCodeTemplateCell *cell = [tableView dequeueReusableCellWithIdentifier:reusedID];
    if (cell == nil) {
        cell = [[ETCodeTemplateCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reusedID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI{
    //在这里添加子视图
    UILabel *label = [[UILabel alloc] initWithFrame:self.bounds];
    label.font = [UIFont systemFontOfSize:14];
    label.text = @"会更好了好玩了";
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:label];

}
- (void)layoutSubviews{
    //这里布局Frame
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
