//
//  ETBRPickTestVC.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/10/13.
//  Copyright © 2019 zhao. All rights reserved.
//

#import "ETBRPickTestVC.h"
#import "BRPickerView.h"

@interface ETBRPickTestVC ()


@end

@implementation ETBRPickTestVC
- (void)viewDidLoad{
    [super viewDidLoad];

}
- (IBAction)selectTime:(id)sender {
    [BRDatePickerView showDatePickerWithMode:BRDatePickerModeYMD title:@"选择日期" selectValue:nil isAutoSelect:NO resultBlock:^(NSDate * _Nullable selectDate, NSString * _Nullable selectValue) {
        NSLog(@"选择了：%@",selectValue);
    }];
//    [BRDatePickerView showDatePickerWithTitle:@"选择日期" dateType:BRDatePickerModeDate defaultSelValue:nil resultBlock:^(NSString *selectValue) {
        
//    }];
    
}
- (IBAction)selectArea:(id)sender {
    [BRAddressPickerView showAddressPickerWithMode:BRAddressPickerModeArea selectIndexs:nil isAutoSelect:NO resultBlock:^(BRProvinceModel * _Nullable province, BRCityModel * _Nullable city, BRAreaModel * _Nullable area) {
        NSLog(@"选择了：%@ %@ %@",province.name,city.name,area.name);
    }];
//    [BRAddressPickerView showAddressPickerWithDefaultSelected:nil resultBlock:^(BRProvinceModel *province, BRCityModel *city, BRAreaModel *area) {
//
//    }];
}

- (IBAction)slectSex:(id)sender {
    NSArray *dataSource = @[@"男",@"女"];
    [BRStringPickerView showPickerWithTitle:@"选择性别" dataSourceArr:dataSource selectIndex:0 resultBlock:^(BRResultModel * _Nullable resultModel) {
        NSLog(@"选择了：%@",resultModel.value);

    }];
//    [BRStringPickerView showStringPickerWithTitle:@"选择性别" dataSource:dataSource defaultSelValue:@"女" resultBlock:^(id selectValue) {
//
//    }];
}
@end
