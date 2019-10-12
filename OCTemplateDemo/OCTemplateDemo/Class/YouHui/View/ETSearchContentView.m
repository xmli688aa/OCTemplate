//
//  ETSearchView.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/7/21.
//  Copyright © 2019  . All rights reserved.
//

#import "ETSearchContentView.h"

@interface ETSearchContentView ()
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation ETSearchContentView

- (void)updateSearchContent:(NSString *)inputString{
    self.contentLabel.text = inputString;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"点击了搜索内容");
}

@end
