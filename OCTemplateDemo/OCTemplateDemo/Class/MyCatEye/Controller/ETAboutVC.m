//
//  MyCatEyeViewController.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/7/14.
//  Copyright © 2019   All rights reserved.
//

#import "ETAboutVC.h"
#import "AppDelegate.h"
#import "ETTeacher.h"
#import "ETManagerTool.h"

@interface ETAboutVC ()
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UIView *targetView;

@property (weak, nonatomic) IBOutlet UILabel *label;
@end

@implementation ETAboutVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self testLabelFontDifferentScreen];
//    [self addOpenDrawerBtn];
    //测试字典转模型时 服务器返回不同的字段 对应的是一个值处理方法
//    [self testMJExtension];
}
- (void)testMJExtension{
    NSDictionary *dictionary = @{
        @"name":@"Tom",
        @"age":@(10)
    };
    ETTeacher *teacher = [ETTeacher mj_objectWithKeyValues:dictionary];
    KDSLog(@"%@",teacher.name);
//    @"name" : @"personName",//前边的是你想用的key，后边的是返回的key
//    @"name" : @"teacherName
    NSDictionary *dictionary1 = @{
         @"personName":@"Jack",
         @"age":@"10"
     };
     ETTeacher *teacher1 = [ETTeacher mj_objectWithKeyValues:dictionary1];
     KDSLog(@"%@",teacher1.name);
    
    NSDictionary *dictionary2 = @{
         @"teacherName":@"Robert",
         @"age":@"10"
     };
     ETTeacher *teacher2 = [ETTeacher mj_objectWithKeyValues:dictionary2];
     KDSLog(@"%@",teacher2.name);
}
- (void)testLabelFontDifferentScreen{
    //由于UIFont+ETFontSize分类 label在不同尺寸的手机上 字体大小会改变
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, 300, 30)];
    label.text = @"测试我的字体大小";
    label.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:label];
    NSLog(@"%f",label.font.pointSize);
    NSLog(@"%f",self.label.font.pointSize);
}
- (void)addOpenDrawerBtn{
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 100, 80, 44)];
    [btn setTitle:@"点击" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.resumeEventInterval = 4;
}
- (void)click{
    NSLog(@"点击");
    AppDelegate * appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [appDelegate openDrawer];
    
}

- (IBAction)getScreenPartImage:(id)sender {
    self.myImageView.image = [ETManagerTool screenShotView:self.targetView];
}

- (IBAction)getScreenImage:(id)sender {
    self.myImageView.image = [ETManagerTool screenShot];
}


@end
