//
//  ETSearchTitleView.h
//  OCTemplateDemo
//
//  Created by Ethon on 2019/7/21.
//  Copyright © 2019 zhao. All rights reserved.
//

#import "ETBaseView.h"

NS_ASSUME_NONNULL_BEGIN
typedef enum : NSUInteger {
    RightBtnType_Publish,
    RightBtnType_Cancel,
} RightBtnType;

@protocol ETSearchTitleViewDelegate <NSObject>

- (void)textFieldDidBeginEditing;
- (void)textFieldInputString:(NSString *)inputString;
- (void)didClickRightBtn:(RightBtnType )funType;
@end

@interface ETSearchTitleView : ETBaseView
@property (nonatomic, weak) id <ETSearchTitleViewDelegate> deleagete;
@property (nonatomic, assign) RightBtnType funType;


@end

NS_ASSUME_NONNULL_END
