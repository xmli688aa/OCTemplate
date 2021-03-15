//
//  ETDoucmentPickVC.m
//  DarkMode
//
//  Created by ET on 2020/12/8.
//  Copyright © 2020 https://github.com/wsl2ls   ----- . All rights reserved.
//

#import "ETDocumentPickVC.h"
#import "ETDocumentManager.h"
@interface ETDocumentPickVC ()

@end

@implementation ETDocumentPickVC

- (void)viewDidLoad {
    [super viewDidLoad];

}
- (IBAction)jumpDocumentVC:(id)sender {
    [[ETDocumentManager shareInstance] selectDocumentFromPhoneWithType:@"doc" successBlock:^(ETDocumentModel * _Nonnull model) {
        
    } cancelBlock:^(void){
        
    }];
    
}

- (IBAction)presentVC:(id)sender {
    Class class = NSClassFromString(@"ETPresentTempVC");
    UIViewController *tempVC = [[class alloc] init];

    if (tempVC) {
        tempVC.modalPresentationStyle = UIModalPresentationPageSheet;
        [self presentViewController:tempVC animated:YES completion:^{
            
        }];
    }
  
}





@end
