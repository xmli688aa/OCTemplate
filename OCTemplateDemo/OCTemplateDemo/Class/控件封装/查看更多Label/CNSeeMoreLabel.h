//
//  CNSeeMoreLabel.h
//  CNLibrary
//
//  Created by cean.q on 2019/12/3.
//  Copyright © 2019 CEAN. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CNSeeMoreLabelDelegate <NSObject>
- (void)labelChangeHeight:(CGFloat)height;
@end

@interface CNSeeMoreLabel : UIView
@property (nonatomic, weak) id delegate;
/// 是否自动调整 label frame，默认：YES
@property (nonatomic, assign) BOOL autoAdjustFrame;
/// 查看更多颜色，默认：蓝色
@property (nonatomic, strong) UIColor *seeMoreColor;
/// 查看更多标题，默认：查看更多
@property (nonatomic, copy) NSString *moreTitle;
/// 收起标题，默认：收起
@property (nonatomic, copy) NSString *packupTitle;
/// 文本内容
@property (nonatomic, copy) NSString *text;
/// 行数，默认：1行
@property (nonatomic, assign) NSInteger numberOfLines;
/// 字体，默认：17
@property (nonatomic, strong) UIFont *font;
/// 字体颜色
@property (nonatomic, strong) UIColor *textColor;
@end

NS_ASSUME_NONNULL_END
