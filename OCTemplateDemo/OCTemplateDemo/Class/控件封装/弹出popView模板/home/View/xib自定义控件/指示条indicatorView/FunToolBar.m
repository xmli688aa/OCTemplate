
//
//  FunToolBar.m
//  youpinshitang_menu
//
//  Created by Ethon.Z on 2019/9/17.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "FunToolBar.h"

@interface FunToolBar ()
@property (weak, nonatomic) IBOutlet UIButton *zaocanBtn;
@property (weak, nonatomic) IBOutlet UIButton *wucanBtn;
@property (weak, nonatomic) IBOutlet UIButton *wancanBtn;
@property (weak, nonatomic) IBOutlet UIButton *xiaoyeBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *indicatorViewX;

///指示条
@property (weak, nonatomic) IBOutlet UIView *indicatorView;

@property (assign, nonatomic) NSInteger index;

@end

@implementation FunToolBar

#define space  45
#define count  4
#define w  (kScreenWidth -space*2)/count
- (void)awakeFromNib{
    [super awakeFromNib];
    _indicatorViewX.constant = w *0 + space + (w - _indicatorView.frame.size.width)/2;
    self.index = 0;
}
- (void)layoutSubviews{
    [super layoutSubviews];

}

- (void)setIndex:(NSInteger)index{
    _index = index;
    CGRect frame = _indicatorView.frame;
//    CGFloat space = 45;
//    NSInteger count = 4;
//    CGFloat w = (kScreenWidth -space*2)/count;
    CGFloat offsetX = (w - frame.size.width)/2;
    switch (index) {
        case 0:
            frame.origin.x = w *0 + space + offsetX;
            [_zaocanBtn setTitleColor:UIColor.orangeColor forState:UIControlStateNormal];
            [_wucanBtn setTitleColor:UIColor.lightGrayColor forState:UIControlStateNormal];
            [_wancanBtn setTitleColor:UIColor.lightGrayColor forState:UIControlStateNormal];
            [_xiaoyeBtn setTitleColor:UIColor.lightGrayColor forState:UIControlStateNormal];

            break;
        case 1:
            frame.origin.x = w *1 + space + offsetX;;
            [_zaocanBtn setTitleColor:UIColor.lightGrayColor forState:UIControlStateNormal];
            [_wucanBtn setTitleColor:UIColor.orangeColor forState:UIControlStateNormal];
            [_wancanBtn setTitleColor:UIColor.lightGrayColor forState:UIControlStateNormal];
            [_xiaoyeBtn setTitleColor:UIColor.lightGrayColor forState:UIControlStateNormal];
            break;
            
        case 2:
            frame.origin.x = w *2 + space + offsetX;;
            [_zaocanBtn setTitleColor:UIColor.lightGrayColor forState:UIControlStateNormal];
            [_wucanBtn setTitleColor:UIColor.lightGrayColor forState:UIControlStateNormal];
            [_wancanBtn setTitleColor:UIColor.orangeColor forState:UIControlStateNormal];
            [_xiaoyeBtn setTitleColor:UIColor.lightGrayColor forState:UIControlStateNormal];
            break;
        case 3:
            frame.origin.x = w *3 + space + offsetX;;
            [_zaocanBtn setTitleColor:UIColor.lightGrayColor forState:UIControlStateNormal];
            [_wucanBtn setTitleColor:UIColor.lightGrayColor forState:UIControlStateNormal];
            [_wancanBtn setTitleColor:UIColor.lightGrayColor forState:UIControlStateNormal];
            [_xiaoyeBtn setTitleColor:UIColor.orangeColor forState:UIControlStateNormal];
            break;
            
        default:
            break;
    }
    _indicatorView.frame = frame;
    if (self.clickToolBarBlcok) {
        self.clickToolBarBlcok(self.index);
    }

}
- (IBAction)clickZaocan:(id)sender {
    self.index = 0;
 
}
- (IBAction)clickWucan:(id)sender {
    self.index = 1;

}

- (IBAction)clickWancan:(id)sender {
    self.index = 2;
  
}
- (IBAction)clickXiaoye:(id)sender {
    self.index = 3;
  
}

@end
