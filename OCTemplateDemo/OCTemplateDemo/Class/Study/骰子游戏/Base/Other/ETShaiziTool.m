
//
//  Tool.m
//  DrinkGame
//
//  Created by Ethon.Z on 2019/8/21.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "ETShaiziTool.h"
#import "ShaiziModel.h"
#import "ZhuanPanModel.h"
#import <AudioToolbox/AudioToolbox.h>
#import <MJExtension/MJExtension.h>

@implementation ETShaiziTool
static ETShaiziTool *_manager;
static dispatch_once_t onceToken ;

+ (instancetype)share{
    if (_manager == nil) {
        _manager = [[ETShaiziTool alloc] init];
    }
    return _manager;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    dispatch_once(&onceToken, ^{
        _manager = [super allocWithZone:zone];
    });
    return _manager;
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}
- (id)mutableCopyWithZone:(NSZone *)zone
{
    return self;
}

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
            rules = @"基本規則： 可選擇最少3顆，最多6顆骰子進行搖點，然後猜大小，猜中者贏。 大小的規則如下： 骰子数量3颗:点数>8为大点数<=8为小\n骰子数量4颗:点数>11为大 点数<=11为小\n骰子数量5颗:点数>15为大点数<=15为小\n骰子数量6颗:点数>18为大点数<=18为小 ";

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

- (NSArray *)trueWordsArray{
    if (_trueWordsArray == nil) {
        _trueWordsArray = @[
                            @"1.如果可以回到过去，你最想做什么？或者改变什么",
                            @"2.如果可以去到未来，你最想知道什么？",
                            @"3.如果你早上起床发现自己性别发生了转换，你第一件事会做什么？",
                            @"4.最满意自己身体的哪个部位？",
                            @"5.最不满意的部位",
                            @"6.用3个词语形容自己的性格",
                            @"7.最信任的人是？",
                            @"8.最讨厌自己的一点",
                            @"9.觉得自己最大的优点",
                            @"10.如果穿越的话，想去哪个朝代？",
                            @"11.觉得自己目前最需要什么？",
                            @"12.有没有什么个人的小怪癖？",
                            @"13.心目中理想的家庭婚姻模式（畅想一下婚姻）",
                            @"14.最不能容忍另一半的什么行为？",
                            @"15.形容一下理想（现任）爱人。",
                            @"16.如果有来生，你选择当什么？",
                            @"17.独自旅行的话会选择什么目的地？",
                            @"18.对你人生影响最大的人是？",
                            @"19.你目前的心境是？",
                            @"20.是否赞成网络、手机的实名制？",
                            @"21.用一种水果形容左边的人.",
                            @"22.如果变成动物，你会选择变成什么?",
                            @"23.做过最浪漫的事？",
                            @"24.你做过最羞耻的一件事是？",
                            @"25.你觉得是提分手的人和被提分手的人哪个更难过？",
                            @"26.上一个幸福到傻笑的时刻是？",
                            @"27.有没有什么有趣的脑洞？",
                            @"28.你怎么平衡友谊和爱情的权重？",
                            @"29.你认为对于犯人、罪人（他可能还逍遥法外）可以施与私刑吗？还是交于法律？",
                            @"30.如果你处于豫章书院类似的地方，你会为了自己出卖、伤害他人吗？",
                            @"31.你觉得自己给世界给身边的人带来了什么？",
                            @"32.分手后会删前任的联系方式吗？",
                            @"33.怎么理解“极致的爱”？",
                            @"34.你认为明星偶像的私生活应该被窥探干预吗？",
                            @"35.有没有在某个场合听某首歌突然飙泪？",
                            @"36.引起你与个人经历共鸣的电影是？",
                            @"37.身上哪个部位最敏感",
                            @"38.有什么事想做很久了？还没去做的原因是什么？",
                            @"39.如果跟你喜欢的人约会，碰到前任的现任，会有什么表现?",
                            @"40.对你来说，怎样才算是“完美”的一天？",
                            @"41.心情特别烦躁的时候会有什么习惯？",
                            @"42.描述一次自己的神操作。",
                            @"43.如果突然获得500万(税后)，会怎么安排？",
                            @"44.和朋友一起自由行，筹划这次旅行的时候你可以承担那些任务？",
                            @"45.你有多在乎他人的眼光和评价？",
                            @"46.你最希望拥有的才华是?",
                            @"47.你希望以何种方式死去？",
                            @"48.当今哪些所谓美德你认为被高估？",
                            @"49.谈谈最近说过的一个谎言。",
                            @"50.谈谈最近一次失眠的理由。",
                            ];
    }
    return _trueWordsArray;
}
- (NSArray *)dareArray{
    if (_dareArray == nil) {
        _dareArray = @[
                       @"1.对手机里第一个异性当场打电话表白，开免提。",
                       @"2.男女互换衣服。（男生穿不下女生的也得把套在脖子上）",
                       @"3.找个在场异性拍合照发到朋友圈，配文这是我的男/女朋友",
                       @"4.打开手机相册 我选三张照片 说出这三张照片背后的故事",
                       @"5.背一位异性绕场一周",
                       @"6.唱青藏高原最后一句",
                       @"7.做一个大家都满意的鬼脸",
                       @"8.抱一位异性直到下一轮真心话大冒险结束",
                       @"9.向一位异性表白3分钟",
                       @"10.与一位异性十指相扣，对视10秒",
                       @"11.邀请一位异性为你唱情歌，或邀请一位异性与你情歌对唱",
                       @"12.做自己最性感、最妩媚的表情或动作",
                       @"13.跳草裙舞、脱衣舞",
                       @"14.蹲在凳子上作便秘状",
                       @"15.亲一位异性，部位不限",
                       @"16.深情地吻墙10秒",
                       @"17.模仿古代特殊职业女子拉客",
                       @"18.模仿脑白金广告，边唱边跳",
                       @"19.抓着铁门喊“放我出去！",
                       @"20.对人美眉挤眉弄眼",
                       @"21.用胳膊从正面量左数第一个异性的胸围",
                       @"22.原地转10圈（就近靠下）",
                       @"23.跳肚皮舞 ",
                       @"24.跳钢管舞",
                       @"25.对外大喊我是猪",
                       @"26.走猫步",
                       @"27.摆3个芙蓉姐姐S形",
                       @"28.和左数第一个异性亲一下",
                       @"29.脱一件衣服持续到结束",
                       @"30.背起右边第一个女生",
                       @"31.做好莱坞kiss",
                       @"32.大喊 燃烧吧，小宇宙",
                       @"33.选一个男生 一边捶他的胸一边说： 你好讨厌哦",
                       @"34.躺在床上摆pose说 饭在锅里，我在床上",
                       @"35.一人先用嘴吸住一纸牌，另一人用嘴从另一面将纸牌吸住移走",
                       @"36.抱起异性，保持5秒钟 ",
                       @"37.把左边第一个异性面对面抱起来，让ta用双腿夹住",
                       @"38.和左数第一个异性对喝交杯酒",
                       @"39.和左数第一个异性对喂花生米",
                       @"40.跳舞转圈",
                       @"41.和右数第一个异性拥抱 ",
                       @"42.亲右数第一个异性脸",
                       @"43.和右数第一个异性对亲脖子 ",
                       ];
    }
    return _dareArray;
}
@end
