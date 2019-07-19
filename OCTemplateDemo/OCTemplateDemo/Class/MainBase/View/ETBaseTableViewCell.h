//
//  ETBaseTableViewCell.h
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/7/19.
//  Copyright © 2019 zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ETBaseTableViewCell : UITableViewCell

/**
 xib创建TableViewCell

 @param tableView tableView
 @return TableViewCell
 */
+ (instancetype )xibCellWithTableView:(UITableView *)tableView;


/**
 纯代码创建TableViewCell

 @param tableView tableView
 @param cellStyle 样式
 @return TableViewCell
 */
+ (instancetype )cellWithTableView:(UITableView *)tableView cellStyle:(UITableViewCellStyle )cellStyle;


@end

NS_ASSUME_NONNULL_END