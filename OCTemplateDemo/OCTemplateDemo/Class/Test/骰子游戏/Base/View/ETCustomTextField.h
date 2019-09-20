//
//  ETCustomTextField.h
//  DrinkGame
//
//  Created by Ethon.Z on 2019/8/24.
//  Copyright © 2019 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef enum : NSUInteger {
    UserName,       //用户名称
    ZhuanPanRules,  //转盘规则
 
} ETTextFieldType;

@interface ETCustomTextField : UITextField
///textField类型
@property (assign, nonatomic) ETTextFieldType textFieldType;
@end

NS_ASSUME_NONNULL_END
