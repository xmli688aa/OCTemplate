//
//  ETViewTagVC.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/9/24.
//  Copyright © 2019 zhao. All rights reserved.
//

#import "ETViewTagVC.h"

@interface ETViewTagVC ()
///渐变色View
@property (weak, nonatomic) IBOutlet UIView *gradientView;

@end

@implementation ETViewTagVC

- (void)viewDidLoad {
    [super viewDidLoad];

    [ETToolManager addGradientColorWithView:self.gradientView startColor:UIColor.redColor endColor:UIColor.yellowColor isVertical:YES];
    
}

/*
 viewWithTag:
 1.内部原理
 1>.首先会跟自己匹配
 2>.如果自己不匹配,会遍历所有的子控件;首先会遍历subViews数组中第0个控件,如果不匹配,会遍历这个控件的子控件,依次遍历
 3>.如果都不匹配,会返回nil
 
 2.作用
 1>.找子控件
 2>.区分子控件
 
 */
//- (UIView *)viewWithTag:(NSInteger)tag
//{
//    if (self.tag == tag) return self;
//
//    for (UIView *subView in self.subViews) {
//        if (subView.tag == tag) {
//            return subView;
//        } else {
//
//        }
//    }
//
//    return nil;
//
//}


- (IBAction)removeTagView:(id)sender {
    UIView *view = [self.view viewWithTag:100];
    [view removeFromSuperview];
}

@end
