//
//  ETBaseTableViewCell.m
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/7/19.
//  Copyright © 2019  . All rights reserved.
//

#import "ETBaseTableViewCell.h"

@implementation ETBaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self addOtherSubviews];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
//纯代码创建cell
+ (instancetype )cellWithTableView:(UITableView *)tableView cellStyle:(UITableViewCellStyle )cellStyle{
    NSString *xibName = NSStringFromClass([self class]);
    
    ETBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:xibName];
    if (cell == nil) {
        cell = [[self alloc] initWithStyle:cellStyle reuseIdentifier:xibName];
        [cell addOtherSubviews];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}
//xib创建cell
+ (instancetype )xibCellWithTableView:(UITableView *)tableView{
    NSString *xibName = NSStringFromClass([self class]);

    ETBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:xibName];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:xibName owner:self options:nil].firstObject;
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }

    return cell;
}
//添加其他子视图
- (void)addOtherSubviews{
    
}
@end
