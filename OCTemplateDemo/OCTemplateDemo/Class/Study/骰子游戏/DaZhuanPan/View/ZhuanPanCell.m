
//
//  ZhuanPanCell.m
//  DrinkGame
//
//  Created by Ethon.Z on 2019/8/22.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "ZhuanPanCell.h"
#import "ZhuanPanModel.h"
#import "ETCustomTextField.h"
@interface ZhuanPanCell ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet ETCustomTextField *textField;
@end

@implementation ZhuanPanCell

- (void)awakeFromNib {
    [super awakeFromNib];
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary]; // 创建属性字典
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:14]; // 设置font
    attrs[NSForegroundColorAttributeName] = [UIColor whiteColor]; // 设置颜色
    NSAttributedString *attStr = [[NSAttributedString alloc] initWithString:@"请输入你的自定义规则" attributes:attrs]; // 初始化富文本占位字符串
    self.textField.attributedPlaceholder = attStr;
    
    //设置TextField文字输入限制
    self.textField.textFieldType = ZhuanPanRules;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}
- (void)setIsSet:(BOOL)isSet{
    _isSet = isSet;
    if (!_isSet) {
        self.textField.enabled = NO;
    }
}
- (void)setModel:(ZhuanPanModel *)model{
    _model = model;
    _numberLabel.text = [NSString stringWithFormat:@"%ld",(long)model.number ];
    _textField.text = model.content;
   
}
#pragma mark - UITextFieldDelegate
- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField.text.length > 0) {
        _model.content = textField.text;
    }
}









@end
