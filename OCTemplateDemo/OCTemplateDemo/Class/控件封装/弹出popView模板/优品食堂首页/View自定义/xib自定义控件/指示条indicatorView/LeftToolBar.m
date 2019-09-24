//
//  LeftToolBar.m
//  youpinshitang_menu
//
//  Created by Ethon.Z on 2019/9/17.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "LeftToolBar.h"

@interface LeftToolBar ()
///特供 只有午餐的情况下展示
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tegongH;
///特供按钮
@property (weak, nonatomic) IBOutlet UIButton *tegongBtn;
///时间段按钮(早餐/午餐)
@property (weak, nonatomic) IBOutlet UIButton *dinnerBtn;
///零食
@property (weak, nonatomic) IBOutlet UIButton *lingshiBtn;
///饮料
@property (weak, nonatomic) IBOutlet UIButton *drinkBtn;
    
@property (assign, nonatomic) LeftToolBarType type;

@property (assign, nonatomic) NSInteger index;
    
@end

@implementation LeftToolBar

- (void)initOthers{
    [self updateDinnerbtnWithIndex:0];
}
- (void)setType:(LeftToolBarType)type{
    [self resetBtns];
    _type = type;
    switch (type) {
        case TeGong:
            [self.tegongBtn setTitleColor: [UIColor blackColor] forState:UIControlStateNormal];
            [self.tegongBtn setBackgroundColor:[UIColor whiteColor]];
            self.selectTitle = @"特供";

            break;
        case Dinner:
            [self.dinnerBtn setTitleColor: [UIColor blackColor] forState:UIControlStateNormal];
            [self.dinnerBtn setBackgroundColor:[UIColor whiteColor]];
            self.selectTitle =[self getBtnTitleWithIndex:self.index];

            break;
        case LingShi:
            [self.lingshiBtn setTitleColor: [UIColor blackColor] forState:UIControlStateNormal];
            [self.lingshiBtn setBackgroundColor:[UIColor whiteColor]];
            self.selectTitle = @"零食";
            break;
            
        case Drink:
            [self.drinkBtn setTitleColor: [UIColor blackColor] forState:UIControlStateNormal];
            [self.drinkBtn setBackgroundColor:[UIColor whiteColor]];
            self.selectTitle = @"饮料";

            break;
            
        default:
            break;
    }
    if (self.clickLeftBarBlock) {
        self.clickLeftBarBlock(self.type);
    }
}
///按钮恢复初始状态
- (void)resetBtns{
    [self.tegongBtn setTitleColor: [UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.dinnerBtn setTitleColor: [UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.lingshiBtn setTitleColor: [UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.drinkBtn setTitleColor: [UIColor lightGrayColor] forState:UIControlStateNormal];
    
    [self.tegongBtn setBackgroundColor:[UIColor clearColor]];
    [self.dinnerBtn setBackgroundColor:[UIColor clearColor]];
    [self.lingshiBtn setBackgroundColor:[UIColor clearColor]];
    [self.drinkBtn setBackgroundColor:[UIColor clearColor]];
}

- (void)updateDinnerbtnWithIndex:(NSInteger )index{
    [self resetBtns];
    self.type = Dinner;

    self.index = index;
    NSString *title = [self getBtnTitleWithIndex:index];
    [self.dinnerBtn setTitle:title forState:UIControlStateNormal];
    //午餐的时候 显示提供 设置type
    if (index == 1) {
        _tegongH.constant = 60;
        _tegongBtn.hidden = NO;
        self.type = TeGong;

    }else{
        _tegongH.constant = 0;
        _tegongBtn.hidden = YES;
    }
}
    
- (NSString *)getBtnTitleWithIndex:(NSInteger )index{
    NSString *title = @"";
    if (index == 0) {
        title = @"早餐";
    }else if (index == 1) {
        title = @"午餐";
    }else if (index == 2) {
        title = @"晚餐";

    }else if (index == 3) {
        title= @"宵夜";
    }
    self.selectTitle = title;

    return title;
}
- (IBAction)clickTegong:(id)sender {
    self.type = TeGong;
}

- (IBAction)clickTime:(id)sender {
    self.type = Dinner;
}
- (IBAction)clickLingshi:(id)sender {
    self.type = LingShi;
}
- (IBAction)clickDrink:(id)sender {
    self.type = Drink;

}

@end
