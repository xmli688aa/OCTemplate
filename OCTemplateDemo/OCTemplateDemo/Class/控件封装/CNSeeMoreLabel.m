//
//  CNSeeMoreLabel.m
//  CNLibrary
//
//  Created by cean.q on 2019/12/3.
//  Copyright © 2019 CEAN. All rights reserved.
//

#import "CNSeeMoreLabel.h"

@interface CNSeeMoreLabel ()
@property (nonatomic, strong) UIButton *seeMoreBtn;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, assign) CGSize labelSize;
@end

@implementation CNSeeMoreLabel

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self config];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self config];
}

- (void)config {
    self.label.userInteractionEnabled = YES;
    self.numberOfLines = 1;
    self.moreTitle = @"查看更多";
    self.packupTitle = @"收起";
    self.font = [UIFont systemFontOfSize:17];
    self.autoAdjustFrame = YES;
}

- (void)changeHeight:(CGFloat)height {
    // 改变视图高度
    if (_autoAdjustFrame) {
        CGRect frame = self.frame;
        frame.size.height = height;
        self.frame = frame;
    }
    if (_delegate && [_delegate respondsToSelector:@selector(labelChangeHeight:)]) {
        [_delegate labelChangeHeight:height];
    }
}

- (void)buttonAction:(UIButton *)sender {
    sender.selected = !sender.selected;
    // 收起
    if (!sender.selected) {
        [self adjustText];
        return;
    }
    // 展开
    self.label.numberOfLines = 0;
    if (_text) {
        self.label.text = _text;
    }
    [self changeHeight:ceilf(self.labelSize.height)];
}

- (void)adjustText {
    if (_text == nil) {
        self.seeMoreBtn.hidden = YES;
        return;
    }
    self.seeMoreBtn.selected = NO;
    CGSize size = [_text boundingRectWithSize:CGSizeMake(self.frame.size.width, MAXFLOAT)
                                      options:NSStringDrawingUsesLineFragmentOrigin
                                   attributes:@{NSFontAttributeName:self.font}
                                      context:nil].size;
    self.labelSize = size;
    // 文字高度少于预定行的高度，隐藏
    if (size.height <= self.font.lineHeight * _numberOfLines) {
        self.label.text = _text;
        self.seeMoreBtn.hidden = YES;
        return;
    }
    int cutLength = (size.width * _numberOfLines) / self.label.font.pointSize - _moreTitle.length;
    self.seeMoreBtn.hidden = NO;
    NSString *text = [_text substringToIndex:(cutLength - _numberOfLines - 1)];
    self.label.text = [text stringByAppendingString:@"..."];
    
    [self changeHeight:ceilf(self.font.lineHeight * _numberOfLines)];
}

- (void)setSeeMoreColor:(UIColor *)seeMoreColor {
    _seeMoreColor = seeMoreColor;
    [self.seeMoreBtn setTitleColor:seeMoreColor forState:UIControlStateNormal];
    [self.seeMoreBtn setTitleColor:seeMoreColor forState:UIControlStateSelected];
}

- (void)setMoreTitle:(NSString *)moreTitle {
    _moreTitle = moreTitle;
    [self.seeMoreBtn setTitle:moreTitle forState:UIControlStateNormal];
}

- (void)setPackupTitle:(NSString *)packupTitle {
    _packupTitle = packupTitle;
    [self.seeMoreBtn setTitle:packupTitle forState:UIControlStateSelected];
}

- (void)sizeToFit {
    [super sizeToFit];
    CGRect frame = self.frame;
    frame.size.height = self.label.frame.size.height;
    self.frame = frame;
}

- (void)setText:(NSString *)text {
    _text = text;
    [self adjustText];
}

- (void)setNumberOfLines:(NSInteger)numberOfLines {
    _numberOfLines = numberOfLines;
    self.label.numberOfLines = numberOfLines;
    [self adjustText];
}

- (void)setFont:(UIFont *)font {
    _font = font;
    self.seeMoreBtn.titleLabel.font = font;
    self.label.font = font;
    [self adjustText];
}

- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    self.label.textColor = textColor;
}

- (UIButton *)seeMoreBtn {
    if (!_seeMoreBtn) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:_moreTitle forState:UIControlStateNormal];
        [btn setTitle:_packupTitle forState:UIControlStateSelected];
        [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        btn.titleLabel.font = self.font;
        btn.translatesAutoresizingMaskIntoConstraints = NO;
        [self.label addSubview:btn];
        NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.label attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
        NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.label attribute:NSLayoutAttributeBottom multiplier:1.0 constant:6];
        [self addConstraints:@[right, bottom]];
        _seeMoreBtn = btn;
    }
    return _seeMoreBtn;
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_label];
        NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:_label attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
        NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:_label attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
        NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:_label attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
        [self addConstraints:@[top, left, right]];
    }
    return _label;
}
@end
