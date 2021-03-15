//
//  ETDocumentModel.h
//  DarkMode
//
//  Created by ET on 2020/12/8.
//  Copyright © 2020 https://github.com/wsl2ls   ----- . All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ETDocumentModel : NSObject
///文件名
@property (nonatomic, strong) NSString *fileName;
///文件数据
@property (nonatomic, strong) NSData *fileData;
///错误信息
@property (nonatomic, strong) NSError *error;
///访问文件夹权限      YES：允许访问 NO:不允许访问
@property (nonatomic, assign) BOOL allowAuthozied;

@end

NS_ASSUME_NONNULL_END
