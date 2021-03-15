//
//  ETEditModel.h
//  DarkMode
//
//  Created by ET on 2020/12/4.
//  Copyright © 2020 https://github.com/wsl2ls   ----- . All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ETEditModel : NSObject

@property (nonatomic, copy) NSString *title;
- (instancetype)initWithTitle:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
