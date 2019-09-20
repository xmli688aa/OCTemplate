//
//  ETMenuTypePopView.m
//  Server
//
//  Created by Ethon.Z on 2019/9/18.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "ETMenuTypePopView.h"

@interface ETMenuTypePopView ()
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIImageView *zaocanImageView;
@property (weak, nonatomic) IBOutlet UIImageView *wucanImageView;
@property (weak, nonatomic) IBOutlet UIImageView *wancanImageView;
@property (weak, nonatomic) IBOutlet UIImageView *xiaoyeIamgeView;

@property (assign, nonatomic) MenuType menuType;
@property (copy, nonatomic) void (^conformBlcok)(MenuType menuType);

@end

@implementation ETMenuTypePopView

+ (void)showMenuTypePopViewWithBlock:(void (^)(MenuType selectMenuType))conformBlcok{
    ETMenuTypePopView *popView = [[ETMenuTypePopView alloc] init];
    
    popView.frame = [UIScreen mainScreen].bounds;
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:popView];
    popView.conformBlcok = conformBlcok;
    [popView hiddenImages];
    [popView selectZaocan:nil];
    
}
    
- (void)hiddenImages{
    for (UIView *subView in self.contentView.subviews) {
        for (UIView *subView1 in subView.subviews) {
            if ([subView1 isKindOfClass:[UIImageView class]]) {
                subView1.hidden = YES;
            }
        }
        
    }
}

- (IBAction)close:(id)sender {

    if (self.conformBlcok) {
        self.conformBlcok(self.menuType);
    }
    [self removeFromSuperview];
}
    


- (IBAction)selectZaocan:(id)sender {
    self.menuType = MenuType_Zaocan;
    [self hiddenImages];
    self.zaocanImageView.hidden = NO;
}

    
- (IBAction)selectWucan:(id)sender {
    self.menuType = MenuType_Wucan;

    [self hiddenImages];
    self.wucanImageView.hidden = NO;
}

- (IBAction)selectWancan:(id)sender {
    self.menuType = MenuType_Wancan;

    [self hiddenImages];
    self.wancanImageView.hidden = NO;
}

- (IBAction)selectXiaoye:(id)sender {
    self.menuType = MenuType_xiaoye;

    [self hiddenImages];
    self.xiaoyeIamgeView.hidden = NO;
}


@end
