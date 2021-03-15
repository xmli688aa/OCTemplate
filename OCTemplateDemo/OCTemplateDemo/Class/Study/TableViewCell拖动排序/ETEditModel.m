//
//  ETEditModel.m
//  DarkMode
//
//  Created by ET on 2020/12/4.
//  Copyright © 2020 https://github.com/wsl2ls   ----- . All rights reserved.
//

#import "ETEditModel.h"

@implementation ETEditModel
- (instancetype)initWithTitle:(NSString *)title{
    if (self = [super init]) {
        self.title = title;
    }
    return self;;
}
@end
