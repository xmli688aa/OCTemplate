//
//  ShaiziRulesPopView.m
//  DrinkGame
//
//  Created by Ethon.Z on 2019/8/22.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "ShaiziRulesPopView.h"

@interface ShaiziRulesPopView ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ShaiziRulesPopView

+ (void)showRulesViewWithContent:(NSString *)content{
    ShaiziRulesPopView *popView = [[NSBundle mainBundle] loadNibNamed:@"ShaiziRulesPopView" owner:nil options:nil].firstObject;
    popView.contentStr = content;
    popView.frame = [UIScreen mainScreen].bounds;
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:popView];
}


- (IBAction)close:(id)sender {
    [self removeFromSuperview];
}

- (void)setContentStr:(NSString *)contentStr{
    _contentStr = contentStr;
    
    _textView.attributedText = [self setupAttributeString:_contentStr highLightTextArray:@[@"游戏规则",@"基本玩法",@"基本规则",@"温馨提示",@"遊戲規則",@"基本玩法",@"基本規則",@"溫馨提示"]];
    

}

#pragma mark - 富文本设置部分字体颜色

- (NSMutableAttributedString *)setupAttributeString:(NSString *)text highLightTextArray:(NSArray *)highLightTexttArray {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 8;// 字体的行间距
    
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:text];
    [attributeStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:[text rangeOfString:text]];
    [attributeStr addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:[text rangeOfString:text]];
    [attributeStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14.0f] range:[text rangeOfString:text]];

    for (NSString *rangeText in highLightTexttArray) {
        NSRange hightlightTextRange = [text rangeOfString:rangeText];
        if (hightlightTextRange.length > 0) {
            [attributeStr addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:15.0f] range:hightlightTextRange];
        }
    }
       
    return attributeStr;

    
}

@end
