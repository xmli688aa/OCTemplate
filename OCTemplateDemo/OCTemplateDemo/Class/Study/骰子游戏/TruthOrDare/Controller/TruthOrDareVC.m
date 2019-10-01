//
//  TruthOrDareVC.m
//  DrinkGame
//
//  Created by Ethon.Z on 2019/8/23.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "TruthOrDareVC.h"
#import "ETShaiziTool.h"
#import "ShaiziGameVC.h"
typedef enum : NSUInteger {
    TrueWords,
    Dare,
} GameSelect;

@interface TruthOrDareVC ()
@property (weak, nonatomic) IBOutlet UIButton *trueWordsBtn;
@property (weak, nonatomic) IBOutlet UIButton *dareBtn;

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

//游戏选择
@property (assign, nonatomic) GameSelect gameSelect;
//选择真心话数组的下标
@property (assign, nonatomic) NSInteger tureWordsSelectIndex;
//选择大冒险数组的下标
@property (assign, nonatomic) NSInteger dareSelectIndex;

@end

@implementation TruthOrDareVC

- (void)setGameSelect:(GameSelect)gameSelect{
    _gameSelect = gameSelect;
    if (gameSelect == TrueWords) {
        _trueWordsBtn.selected = YES;
        _dareBtn.selected = NO;
    }else{
        _trueWordsBtn.selected = NO;
        _dareBtn.selected = YES;
    }
    if (_trueWordsBtn.selected) {
        [_trueWordsBtn setBackgroundImage:[UIImage imageNamed:@"zhenxinhua_on"] forState:UIControlStateNormal];
    }else{
        [_trueWordsBtn setBackgroundImage:[UIImage imageNamed:@"zhenxinhua_off"] forState:UIControlStateNormal];
    }
    if (_dareBtn.selected) {
        [_dareBtn setBackgroundImage:[UIImage imageNamed:@"damaoxian_on"] forState:UIControlStateNormal];
    }else{
        [_dareBtn setBackgroundImage:[UIImage imageNamed:@"damaoxian_off"] forState:UIControlStateNormal];
    }
    [self updateContent];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gameSelect = TrueWords;
    [self hideNaVigationViewRightItem];
    _tureWordsSelectIndex = 0;
    _dareSelectIndex = 0;
}

#pragma mark - 真心话
- (IBAction)clickTrueWordsBtn:(id)sender {
    self.gameSelect = TrueWords;

}
#pragma mark - 大冒险
- (IBAction)clickDareBtn:(id)sender {
    self.gameSelect = Dare;

}
#pragma mark - 上一题
- (IBAction)lastTitle:(id)sender {
    switch (self.gameSelect) {
        case TrueWords:
            self.tureWordsSelectIndex --;
            if (self.tureWordsSelectIndex <= 0) {
                self.tureWordsSelectIndex = 0;
            }
            break;
        case Dare:
            self.dareSelectIndex --;
            if (self.dareSelectIndex <= 0) {
                self.dareSelectIndex = 0;
            }
            break;
        default:
            break;
    }
    [self updateContent];

}
#pragma mark - 下一题
- (IBAction)nextTitle:(id)sender {
    NSInteger trueWordsCount = ETShaiziTool.share.trueWordsArray.count;
    NSInteger dareCount = ETShaiziTool.share.dareArray.count;
    switch (self.gameSelect) {
        case TrueWords:
            self.tureWordsSelectIndex ++;
            if (self.tureWordsSelectIndex >= trueWordsCount - 1) {
                self.tureWordsSelectIndex = trueWordsCount - 1;
            }
            break;
        case Dare:
            self.dareSelectIndex ++;
            if (self.dareSelectIndex >= dareCount - 1) {
                self.dareSelectIndex = dareCount - 1;
            }
            break;
        default:
            break;
    }
    [self updateContent];
}
- (void)updateContent{
    switch (self.gameSelect) {
        case TrueWords:{
            NSString *content = ETShaiziTool.share.trueWordsArray[self.tureWordsSelectIndex];
            self.contentLabel.text = content;
        }
            break;
        case Dare:{
            NSString *content = ETShaiziTool.share.dareArray[self.dareSelectIndex];
            self.contentLabel.text = content;
        }
            break;
        default:
            break;
    }
}

@end
