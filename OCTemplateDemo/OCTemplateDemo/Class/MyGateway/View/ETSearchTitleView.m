//
//  ETSearchTitleView.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/7/21.
//  Copyright © 2019  . All rights reserved.
//

#import "ETSearchTitleView.h"


@interface ETSearchTitleView ()<UITextFieldDelegate>
@property (nonatomic, strong) UITextField * searchBar;
@property (nonatomic, strong) UIButton *publishBtn;
@property (nonatomic, strong) UIButton *coverBtn;
@end


@implementation ETSearchTitleView

- (void)setUI{

    [self setBackgroundColor:[UIColor redColor]];
    UITextField * searchBar = [[UITextField alloc] init];
    searchBar.frame = CGRectMake(20, kStatusBarHeight, kScreenWidth -20*2 -20 -50, 40);
    searchBar.backgroundColor = [UIColor whiteColor];
    searchBar.placeholder = @"搜索内容";
    searchBar.delegate = self;
    searchBar.clearButtonMode=UITextFieldViewModeWhileEditing;
    [self addSubview:searchBar];
    self.searchBar = searchBar;
    
    UIButton *publishBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth -50 -20, kStatusBarHeight, 50, 50)] ;
    [publishBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [publishBtn addTarget:self action:@selector(clickPublishBtn) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:publishBtn];
    self.publishBtn = publishBtn;
    self.coverBtn = [[UIButton alloc] initWithFrame:self.searchBar.frame];
    [self.coverBtn addTarget:self action:@selector(clickCoverBtn) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.coverBtn];
}
- (void)clickPublishBtn{
    switch (self.funType) {
        case RightBtnType_Publish:
            NSLog(@"点击了发布按钮");
            if (self.deleagete && [self.deleagete respondsToSelector:@selector(didClickRightBtn:)]) {
                [self.deleagete didClickRightBtn:RightBtnType_Publish];
            }
            break;
        case RightBtnType_Cancel:
            NSLog(@"点击了取消按钮");
            if (self.deleagete && [self.deleagete respondsToSelector:@selector(didClickRightBtn:)]) {
                [self.deleagete didClickRightBtn:RightBtnType_Cancel];
            }
            break;
        default:
            break;
    }
}
- (void)setFunType:(RightBtnType)funType{
    _funType = funType;
    if (funType == RightBtnType_Publish) {
        [_publishBtn setTitle:@"发布" forState:UIControlStateNormal];
        [_publishBtn setTitle:@"发布" forState:UIControlStateSelected];
        self.coverBtn.hidden = NO;
//        _publishBtn.backgroundColor = UIColor.greenColor;

    }else{
        [_publishBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_publishBtn setTitle:@"取消" forState:UIControlStateSelected];
        self.coverBtn.hidden = YES;
//        _publishBtn.backgroundColor = UIColor.yellowColor;
        [self.searchBar becomeFirstResponder];
    }
}
- (void)clickCoverBtn{
    
    if (self.deleagete && [self.deleagete respondsToSelector:@selector(textFieldDidBeginEditing)]) {
        [self.deleagete textFieldDidBeginEditing];
    }
}
#pragma UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField*)textField{
    NSLog(@"textFieldDidBeginEditing");
 
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (self.deleagete && [self.deleagete respondsToSelector:@selector(textFieldInputString:)]) {
        [self.deleagete textFieldInputString:textField.text];
    }
    return YES;
    
}



@end
