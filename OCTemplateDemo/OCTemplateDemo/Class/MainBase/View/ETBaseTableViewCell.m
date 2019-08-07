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
    [self setUI];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

+ (instancetype )cellWithTableView:(UITableView *)tableView cellStyle:(UITableViewCellStyle )cellStyle{
    NSString *xibName = NSStringFromClass([self class]);
    
    ETBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:xibName];
    if (cell == nil) {
        cell = [[self alloc] initWithStyle:cellStyle reuseIdentifier:xibName];
        [cell setUI];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}
- (void)setUI{
    
}
+ (instancetype )xibCellWithTableView:(UITableView *)tableView{
    NSString *xibName = NSStringFromClass([self class]);

    ETBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:xibName];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:xibName owner:self options:nil].firstObject;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }

    return cell;
}
@end
