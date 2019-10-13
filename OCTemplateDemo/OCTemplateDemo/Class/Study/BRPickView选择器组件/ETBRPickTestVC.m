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
    [BRDatePickerView showDatePickerWithTitle:@"选择日期" dateType:BRDatePickerModeDate defaultSelValue:nil resultBlock:^(NSString *selectValue) {
        
    }];
    
}
- (IBAction)selectArea:(id)sender {
    [BRAddressPickerView showAddressPickerWithDefaultSelected:nil resultBlock:^(BRProvinceModel *province, BRCityModel *city, BRAreaModel *area) {
        
    }];
}

- (IBAction)slectSex:(id)sender {
    NSArray *dataSource = @[@"男",@"女"];
    [BRStringPickerView showStringPickerWithTitle:@"选择性别" dataSource:dataSource defaultSelValue:@"女" resultBlock:^(id selectValue) {
        
    }];
}
@end
