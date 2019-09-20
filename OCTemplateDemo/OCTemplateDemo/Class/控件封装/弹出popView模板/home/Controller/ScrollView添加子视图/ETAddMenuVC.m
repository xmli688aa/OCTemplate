
//
//  ETAddMenuVC.m
//  youpinshitang_menu
//
//  Created by Ethon.Z on 2019/9/18.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "ETAddMenuVC.h"
#import "ETMenuTypePopView.h"
#import "ETSelectPicPopView.h"
#import "MealModel.h"
#import "MBProgressHUD+Add.h"

@interface ETAddMenuVC ()
@property (weak, nonatomic) IBOutlet UITextField *foodNameTextField;

//早餐 午餐 晚餐 宵夜
@property (assign, nonatomic) MenuType selectMenuType;
@property (weak, nonatomic) IBOutlet UILabel *menuTypeLabel;

//特供View只有午餐的时候才会显示
@property (weak, nonatomic) IBOutlet UIView *tegongView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tegongViewH;
//菜品照片
@property (weak, nonatomic) IBOutlet UIImageView *foodImageView;
//菜品是否是特供
@property (assign, nonatomic) BOOL tegong;
@property (weak, nonatomic) IBOutlet UIButton *tegongBtn;
@property (weak, nonatomic) IBOutlet UILabel *jifenLabel;

@property (strong, nonatomic) MealModel *selectMealmodel;

@end

@implementation ETAddMenuVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
}
- (void)viewDidLoad{
    [super viewDidLoad];
    _tegong = NO;

}
- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 选择分类
- (IBAction)selectType:(id)sender {
    [ETMenuTypePopView showMenuTypePopViewWithBlock:^(MenuType selectMenuType) {
        NSLog(@"%ld",selectMenuType);
        self.selectMenuType = selectMenuType;
        [self updateUIWithSelectMenuType:selectMenuType];
    }];
}
- (void)updateUIWithSelectMenuType:(MenuType )selectMenuType{
    _menuTypeLabel.textColor = UIColor.blackColor;
    _tegongView.hidden = YES;
    _tegongViewH.constant = 0;
    switch (selectMenuType) {
        case MenuType_Zaocan:
            _menuTypeLabel.text = @"早餐";
            break;
        case MenuType_Wucan:
            _menuTypeLabel.text = @"午餐";
            _tegongView.hidden = NO;
            _tegongViewH.constant = 118;
            break;
        case MenuType_Wancan:
            _menuTypeLabel.text = @"晚餐";
            break;
        case MenuType_xiaoye:
            _menuTypeLabel.text = @"宵夜";
            break;
        default:
            break;
    }
    _foodImageView.image = [UIImage imageNamed:@""];
}
#pragma mark - 选择照片
- (IBAction)selectPic:(id)sender {
    if (self.selectMenuType == MenuType_None) {
        //没有选中分类
        [MBProgressHUD showError:@"请先选择分类" toView:self.view];
        return;
    }
    //网络请求 获取菜品总类
    NSArray *array = [self getMealModelsArrayWithSelectMenuType];
    [ETSelectPicPopView showSelectPicPopViewWithMealModelsArray:array selectBlock:^(MealModel * _Nonnull selectMealModel) {
        if (selectMealModel) {
            //选中了某个菜品
            self.foodImageView.image = [UIImage imageNamed:selectMealModel.iconName];
            self.jifenLabel.text = [NSString stringWithFormat:@"%ld",selectMealModel.jifen];
            self.selectMealmodel = selectMealModel;
        }
    }];
    
}

- (NSArray *)getMealModelsArrayWithSelectMenuType{
    MealModel *model1 = [[MealModel alloc] initWithType:@"早餐" name:@"包子" iconName:@"b_1_1" jifen:@"2"];
    MealModel *model2 = [[MealModel alloc] initWithType:@"早餐" name:@"包子" iconName:@"b_1_2" jifen:@"2"];
    MealModel *model3 = [[MealModel alloc] initWithType:@"早餐" name:@"包子" iconName:@"b_1_3" jifen:@"2"];
    MealModel *model4 = [[MealModel alloc] initWithType:@"早餐" name:@"包子" iconName:@"b_1_4" jifen:@"2"];
    MealModel *model5 = [[MealModel alloc] initWithType:@"早餐" name:@"包子" iconName:@"b_1_5" jifen:@"2"];
    MealModel *model6 = [[MealModel alloc] initWithType:@"早餐" name:@"包子" iconName:@"b_1_6" jifen:@"2"];
    return @[model1,model2,model3,model4,model5,model6];
}
#pragma mark - 是否特供
- (IBAction)clickTegongBtn:(id)sender {
    _tegong = !_tegong;
    if (_tegong) {
        [self.tegongBtn setImage:[UIImage imageNamed:@"btn_y"] forState:UIControlStateNormal];
    }else{
        [self.tegongBtn setImage:[UIImage imageNamed:@"btn_n"] forState:UIControlStateNormal];
    }
}
#pragma mark - 确认添加菜品
- (IBAction)conformAddMenu:(id)sender {
    //发送网络请求 添加菜品
    self.selectMealmodel.name = self.foodNameTextField.text;
    self.selectMealmodel.type = self.menuTypeLabel.text;
    self.selectMealmodel.tegong = self.tegong;
    
}


@end
