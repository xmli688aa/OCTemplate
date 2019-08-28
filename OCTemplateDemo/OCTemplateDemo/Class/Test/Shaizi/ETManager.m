
//
//  Tool.m
//  DrinkGame
//
//  Created by Ethon.Z on 2019/8/21.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "ETManager.h"
#import "ShaiziModel.h"
#import "ZhuanPanModel.h"
#import <AudioToolbox/AudioToolbox.h>
#import "ETGlobalConstant.h"

@implementation ETManager
+ (void)playShaiziSoundAndShake{
    if ([self getSystemShakeStatus]) {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    }
    if ([self getSystemSoundStatus]) {
        AudioServicesPlaySystemSound(1108);
    }
}
///打开系统声音
+ (void)openSystemSound{
    [kUserDefaults setObject:@"on" forKey:kCacheSystemSound];
    [kUserDefaults synchronize];
}
+ (void)closeSystemSound{
    [kUserDefaults setObject:@"off" forKey:kCacheSystemSound];
    [kUserDefaults synchronize];
}
+ (BOOL)getSystemSoundStatus{
    NSString *status = [kUserDefaults objectForKey:kCacheSystemSound];
    if ([status isEqualToString:@"off"]) {
        return NO;
    }
    return YES;
}
+ (void)openSystemShake{
    [kUserDefaults setObject:@"1" forKey:kCacheSystemShake];
    [kUserDefaults synchronize];
}
+ (void)closeSystemShake{
    [kUserDefaults setObject:@"2" forKey:kCacheSystemShake];
    [kUserDefaults synchronize];
}
+ (BOOL)getSystemShakeStatus{
    NSString *status = [kUserDefaults objectForKey:kCacheSystemShake];
    if ([status isEqualToString:@"2"]) {
        return NO;
    }
    return YES;
}



+ (NSMutableArray *)createDataArrayWithShaiziCount:(NSInteger )count{
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 1; i <= count; i++) {
        ShaiziModel *model = [[ShaiziModel alloc] init];
        NSInteger dianshu = arc4random_uniform(6) + 1;
        NSLog(@"sianshu:%ld",(long)dianshu);
        model.dianshu = dianshu;
        [array addObject:model];
    }
    
    
    return array;
}
+ (NSString *)getRulesWithGameType:(ShaiziGameType )gameType{
    NSString *rules = @"";
    switch (gameType) {
        case Game_789:
            rules = @"基本規則： 先倒點酒作為起始點 大家輪流擲骰子，擲出7點的倒酒，擲出8點的喝杯中酒的一半，擲出9點的把杯中酒全部喝完； 然後繼續倒酒作為起始，周而復始。 溫馨提示： 1、擲出7，8，9的人還要再擲，直到不是7，8，9為止，輪下一個人； 2、擲出兩個點數相同的時候，輪換順序顛倒，如原來順時針，則變為逆時針； 例如，原來擲骰子順序為A->B->C，B擲出兩個四點，則順序變為B->A->C 其中如果有人擲出2個1點，他可以指定任意一人喝完所有杯中酒，然後還是從這個人開始繼續遊戲； 3、由於喝酒速度比較快，一般量力而行的會限定倒酒上限，比如2個杯子 4、起始酒量隨意，可以一點，也可以滿杯，但是玩多了就會知道：害人終會害己，往往倒滿杯的那人自己會解決";
            break;
        case Game_BigOrSmall:
            rules = @"游戏规则\n 奇偶奇偶几个红黑格哦啊好女孩化工二娃宏伟阿哥\n哇哦还能合格后挖化工嗯啊哈哈个啊我还\n基本玩法\n h猴哥挖会更好化工儿好汉歌哦啊\n我还个和我安徽慰";

            break;
        case Game_Dahua:
            rules = @"1.基本玩法\n每人手上有一個骰盅，裝有5顆骰子。 遊戲開始後，大家先搖骰，然後從莊家開始按逆時針的順序發話，莊家先猜\n前面的數位代表骰子的數目，後面的數位代表骰子面朝上的點數。假設莊家說5個4，意思是猜所有人的骰子裡，至少有5個骰子是4點。\n接下來由下一家發話，下一家如果覺得莊家不足5個4，可以叫所有人開骰鐘看骰子，所叫點數的骰子數目夠的話（比如有5個4、6個4或更多數目的4），下一家就輸了，反之下一家贏，莊家輸，本局結束。\n但是，如果下一家相信莊家，覺得所有玩家的骰子加起來至少有5個4，那麼下一家必須重新叫一組數位，這一組數位不能比莊家叫的那組數字小，並且其中有個數字比莊家的大，比如叫6個4(前面的數字比莊家的大)、5個5(後面的數位比莊家的大)都是可以的。至此，下一家操作完畢，由下下家發話，重複進行，直到有玩家開盅，本局才結束。\n2.遊戲規則\n 骰子為1的點數可以代表任何數。假設當前搖出的是11223，那麼可以看成22223、22333、22345、22366等等。如果有玩家叫過1點了，1就不能代表任何數了。假設當前搖出的是11233，那麼就不能看成22233等等。在輪到某玩家發話時，包括自己在內的玩家都可以選擇雙開，雙開的話，輸家的輸得的遊戲幣是要翻倍的。            如果玩家在一定的時間內沒有完成發話動作，則由系統叫個最小的數目，如果這組數位到了上限，則系統強行開鐘。";

            break;
            
        default:
            break;
    }
    return rules;
}

+ (NSMutableArray *)getZhuanPanRulesModelsArray{
    
    NSArray *tempArray = [kUserDefaults objectForKey:kCacheZhuanPanRules];
    if (tempArray == nil) {
        ZhuanPanModel *model1 = [[ZhuanPanModel alloc] initWithNumber:1 content:@"從現在起說的每句話最後以“喵”結尾"];
        ZhuanPanModel *model2 = [[ZhuanPanModel alloc] initWithNumber:2 content:@"選壹個異性，用嘴幫其脫壹件衣服"];
        ZhuanPanModel *model3 = [[ZhuanPanModel alloc] initWithNumber:3 content:@"表演自己高潮時的狀態"];
        ZhuanPanModel *model4 = [[ZhuanPanModel alloc] initWithNumber:4 content:@"免除壹次懲罰（免）"];
        ZhuanPanModel *model5 = [[ZhuanPanModel alloc] initWithNumber:5 content:@"給手機通訊錄第3個人打電話，說：我愛妳"];
        ZhuanPanModel *model6 = [[ZhuanPanModel alloc] initWithNumber:6 content:@"站起來唱海豚音高潮部分"];
        ZhuanPanModel *model7 = [[ZhuanPanModel alloc] initWithNumber:7 content:@"罰酒1杯"];
        ZhuanPanModel *model8 = [[ZhuanPanModel alloc] initWithNumber:8 content:@"跳江南Style 30秒"];
        ZhuanPanModel *model9 = [[ZhuanPanModel alloc] initWithNumber:9 content:@"講壹個妳最搞笑的舉動"];
        ZhuanPanModel *model10 = [[ZhuanPanModel alloc] initWithNumber:10 content:@"吃下每個人給妳夾的菜"];
        ZhuanPanModel *model11 = [[ZhuanPanModel alloc] initWithNumber:11 content:@"轉移懲罰至任壹玩伴（獎)"];
        ZhuanPanModel *model12 = [[ZhuanPanModel alloc] initWithNumber:12 content:@"誇在場最帥/美的人壹分鐘"];
        return  @[
                  model1,model2,model3,model4,model5,model6,model7,model8,model9,model10,model11,model12,
                  ].mutableCopy;
    }
    NSMutableArray *modelarry = [ZhuanPanModel mj_objectArrayWithKeyValuesArray:tempArray];
    
    return modelarry;
}

+ (void)saveZhuanPanModelArray:(NSMutableArray *)modelArray{
    NSMutableArray *tempArray = [NSMutableArray array];
    for (ZhuanPanModel *model in modelArray) {
        NSDictionary *dic = [model mj_keyValues];
        [tempArray addObject:dic];
    }
    [kUserDefaults setObject:tempArray forKey:kCacheZhuanPanRules];
    [kUserDefaults synchronize];
}
+ (NSMutableArray *)getCustomZhuanPanRulesModelsArray{
    
    NSArray *tempArray = [kUserDefaults objectForKey:kCacheCustomZhuanPanRules];
    if (tempArray == nil) {
        ZhuanPanModel *model1 = [[ZhuanPanModel alloc] initWithNumber:1 content:@""];
        ZhuanPanModel *model2 = [[ZhuanPanModel alloc] initWithNumber:2 content:@""];
        ZhuanPanModel *model3 = [[ZhuanPanModel alloc] initWithNumber:3 content:@""];
        ZhuanPanModel *model4 = [[ZhuanPanModel alloc] initWithNumber:4 content:@""];
        ZhuanPanModel *model5 = [[ZhuanPanModel alloc] initWithNumber:5 content:@""];
        ZhuanPanModel *model6 = [[ZhuanPanModel alloc] initWithNumber:6 content:@""];
        ZhuanPanModel *model7 = [[ZhuanPanModel alloc] initWithNumber:7 content:@""];
        ZhuanPanModel *model8 = [[ZhuanPanModel alloc] initWithNumber:8 content:@""];
        ZhuanPanModel *model9 = [[ZhuanPanModel alloc] initWithNumber:9 content:@""];
        ZhuanPanModel *model10 = [[ZhuanPanModel alloc] initWithNumber:10 content:@""];
        ZhuanPanModel *model11 = [[ZhuanPanModel alloc] initWithNumber:11 content:@""];
        ZhuanPanModel *model12 = [[ZhuanPanModel alloc] initWithNumber:12 content:@""];
        return  @[
                  model1,model2,model3,model4,model5,model6,model7,model8,model9,model10,model11,model12,
                  ].mutableCopy;
    }
    NSMutableArray *modelarry = [ZhuanPanModel mj_objectArrayWithKeyValuesArray:tempArray];
    
    return modelarry;
}

+ (void)saveCustomZhuanPanModelArray:(NSMutableArray *)modelArray{
    NSMutableArray *tempArray = [NSMutableArray array];
    for (ZhuanPanModel *model in modelArray) {
        NSDictionary *dic = [model mj_keyValues];
        [tempArray addObject:dic];
    }
    [kUserDefaults setObject:tempArray forKey:kCacheCustomZhuanPanRules];
    [kUserDefaults synchronize];
}

@end
