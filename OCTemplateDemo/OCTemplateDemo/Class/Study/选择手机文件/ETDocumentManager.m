//
//  ETDocumentTool.m
//  DarkMode
//
//  Created by ET on 2020/12/8.
//  Copyright © 2020 https://github.com/wsl2ls   ----- . All rights reserved.
//

#import "ETDocumentManager.h"

@interface ETDocumentManager ()<UIDocumentPickerDelegate>

//@property (nonatomic, copy) SuccessBlock successBlock;
@property (nonatomic, copy) void (^successBlock)(ETDocumentModel *model);
@property (nonatomic, copy) NSString *userSelectType;

@property (nonatomic, copy) void (^cancleBlock)(void);
@end

@implementation ETDocumentManager
+ (instancetype)shareInstance{
    static ETDocumentManager *instance = nil;
    if (!instance) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            instance = [[ETDocumentManager alloc] init];
        });
    }
    return instance;
}
- (void)selectDocumentFromPhoneWithType:(NSString *)type successBlock:(void(^)(ETDocumentModel *model))successBlock cancelBlock:(void(^)(void))cancelBlcok{
    if (![type isKindOfClass:[NSString class]]) {
        type = @"";
    }
    if (type.length) {
        type = [type lowercaseString];//转成小写
    }
    self.userSelectType = type;
    self.successBlock = successBlock;
    self.cancleBlock = cancelBlcok;
    // 项目支持可以选择的文件类型
    NSArray *supportTypes = [self supportTypes];
    UIDocumentPickerViewController *documentPicker = [[UIDocumentPickerViewController alloc] initWithDocumentTypes:supportTypes inMode:UIDocumentPickerModeOpen];
//    documentPicker.view.backgroundColor = EBGlobalBackgroundColor;
    documentPicker.delegate = self;
//    documentPicker.modalPresentationStyle = UIModalPresentationFormSheet;
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    //不设置的话 会导致documentPicker底部有部分灰色
    [UITabBar appearance].translucent = YES;
    [UITabBar appearance].backgroundColor = [UIColor whiteColor];;

    [vc presentViewController:documentPicker animated:YES completion:nil];
}
- (NSArray *)getTypesWithType:(NSString *)type{
    NSMutableArray *supportTypes = [NSMutableArray array];
    if (type.length == 0) {
        return [self supportTypes];
    }else{
        NSArray *types = [type componentsSeparatedByString:@"&"];
        for (NSString *supportType in [self supportTypes]) {
            for (NSString *type in types) {
                if ([supportType hasSuffix:type]) {
                    if (![supportTypes containsObject:type]) {
                        [supportTypes addObject:supportType];
                    }
                }
            }
        }
    }
    return supportTypes.copy;
}
//支持的类型
- (NSArray *)supportTypes{
    NSArray *types = @[
        @"public.data",//该格式支持所有类型
        @"com.microsoft.powerpoint.ppt",
        @"com.microsoft.powerpoint.pptx",
        @"com.microsoft.word.doc",
        @"com.microsoft.word.docx",
        @"com.microsoft.excel.xls",
        @"com.adobe.pdf",
        @"public.mp3",
        @"public.archive",
        @"public.text",
        @"public.plain-text",
        @"public.source-code",
        @"public.shell-script",
        @"public.script",
        @"public.xml",
        @"public.url",
        @"public.image",
        @"public.movie",
        @"public.audio",
        @"public.mpeg4",
        @"public.font",

    ];
    return types;
}
#pragma mark - UIDocumentPickerDelegate
//ios11之后
- (void)documentPicker:(UIDocumentPickerViewController *)controller didPickDocumentsAtURLs:(NSArray<NSURL *> *)urls {
    NSURL *url = urls.firstObject;
    [self dealFileWithUrl:url];
}
//ios8-ios11
- (void)documentPicker:(UIDocumentPickerViewController *)controller didPickDocumentAtURL:(NSURL *)url{
    [self dealFileWithUrl:url];
}
- (void)dealFileWithUrl:(NSURL *)url{
    //获取授权
    BOOL fileUrlAuthozied = [url startAccessingSecurityScopedResource];
    
    if (fileUrlAuthozied) {
        NSFileCoordinator *fileCoordinator = [[NSFileCoordinator alloc] init];
        NSError *error;
        [fileCoordinator coordinateReadingItemAtURL:url options:0 error:&error byAccessor:^(NSURL *newURL) {
           NSString *fileType = [newURL.lastPathComponent componentsSeparatedByString:@"."].lastObject;
            fileType = [fileType lowercaseString];
            if (self.userSelectType.length && ![self.userSelectType containsString:fileType]) {
                NSString *supportType = [self.userSelectType stringByReplacingOccurrencesOfString:@"&" withString:@"、"];
                supportType = [NSString stringWithFormat:@"仅支持%@文件格式，请重新上传",supportType];
//                [EBHUDMask showOnlyMessageAbout2_0s:[NSString stringWithFormat:@"仅支持%@文件格式，请重新上传",supportType]];
//                UIWindow *window = [UIApplication sharedApplication].keyWindow;
//                MBProgressHUD *progress = [[MBProgressHUD alloc] initWithView:window];
//                [window addSubview:progress];
//                [progress showAnimated:YES];
//                progress.label.text = supportType;
//                [progress hideAnimated:YES afterDelay:2];
                return;;
            }
            //读取文件
            NSString *fileName = [newURL lastPathComponent];
            NSError *error = nil;
            NSData *fileData = [NSData dataWithContentsOfURL:newURL options:NSDataReadingMappedIfSafe error:&error];
            ETDocumentModel *model = [[ETDocumentModel alloc] init];
            model.fileName = fileName;
            model.fileData = fileData;
            model.allowAuthozied = YES;
            model.error = error;
            if (self.successBlock) {
                self.successBlock(model);
            }
            [UITabBar appearance].translucent = NO;
            [[UIApplication sharedApplication].keyWindow.rootViewController dismissViewControllerAnimated:YES completion:NULL];
        }];
        [url stopAccessingSecurityScopedResource];
    } else {
        //授权失败
        ETDocumentModel *model = [[ETDocumentModel alloc] init];
        model.allowAuthozied = NO;
        if (self.successBlock) {
            self.successBlock(model);
        }
    }
}
// called if the user dismisses the document picker without selecting a document (using the Cancel button)
- (void)documentPickerWasCancelled:(UIDocumentPickerViewController *)controller{
    [UITabBar appearance].translucent = NO;
    if (self.cancleBlock) {
        self.cancleBlock();
    }
}


@end
