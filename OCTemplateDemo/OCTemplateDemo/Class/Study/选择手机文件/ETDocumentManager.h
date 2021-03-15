//
//  ETDocumentTool.h
//  DarkMode
//
//  Created by ET on 2020/12/8.
//  Copyright © 2020 https://github.com/wsl2ls   ----- . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ETDocumentModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ETDocumentManager : NSObject

+ (instancetype)shareInstance;

/// 从手机中获取文件数据
/// @param successBlock 选取文件回调 根据EBDocumentModel判断
/// @param type 需要选择的格式 不限制传空即可 如限制doc和docx格式文件，可传doc&docx，中间用&符合隔开， wps格式传data
/// @param cancelBlcok 用户取消选择文件
- (void)selectDocumentFromPhoneWithType:(NSString *)type successBlock:(void(^)(ETDocumentModel *model))successBlock cancelBlock:(void(^)(void))cancelBlcok;
@end

NS_ASSUME_NONNULL_END
