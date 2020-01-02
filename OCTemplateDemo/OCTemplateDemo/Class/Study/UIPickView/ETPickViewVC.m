
//
//  ETPickViewVC.m
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2020/1/2.
//  Copyright (c) Hello  All rights reserves.
//
        

#import "ETPickViewVC.h"

@interface ETPickViewVC ()<UIPickerViewDataSource, UIPickerViewDelegate>
@property (strong, nonatomic) UIPickerView *pickView;
@property (strong, nonatomic) NSTimer *timer;
@end

@implementation ETPickViewVC

NSInteger rowCount = 10;

- (NSTimer *)timer{
    if (_timer == nil) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(scrollPickView) userInfo:nil repeats:YES];
        //不用scheduled方式初始化的，需要手动addTimer:forMode: 将timer添加到一个runloop中。而scheduled的初始化方法将以默认mode直接添加到当前的runloop中
//        _timer = [[NSTimer alloc] initWithFireDate:[NSDate dateWithTimeIntervalSinceNow:0.01] interval:2 target:self selector:@selector(scrollPickView) userInfo:nil repeats:YES];
//        _timer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(scrollPickView) userInfo:nil repeats:YES];
//        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
    }
    return _timer;
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addPickView];
//    [self.timer setFireDate:[NSDate distantPast]];

    [self.timer fire];
}
- (void)addPickView{
    _pickView = [[UIPickerView alloc] initWithFrame:CGRectMake(20, 100, kScreenWidth-40, 200)];
    [self.view addSubview:_pickView];
    _pickView.dataSource = self;
    _pickView.delegate = self;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickPickView)];
    [_pickView addGestureRecognizer:tap];
}
- (void)scrollPickView{
    NSLog(@"scrollPickView");
    NSInteger row = [self.pickView selectedRowInComponent:0];
     row++;
     /// 设置下一行即将展示的内容  到临界值就看到边界了
     if (row < rowCount) {
         [self.pickView selectRow:row inComponent:0 animated:YES];
     } else {
         [self.pickView selectRow:0 inComponent:0 animated:NO];
     }
}
- (void)clickPickView{
    NSLog(@"点击了PickView");
}
#pragma mark - UIPickerViewDataSource, UIPickerViewDelegate


- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
   return 1;
}

- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return rowCount;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component API_UNAVAILABLE(tvos){
    return 300;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component API_UNAVAILABLE(tvos){
    return 44;
}

//- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component API_UNAVAILABLE(tvos){
//    return [NSString stringWithFormat:@"哈hahhahheghkewahgkewahkghekwahgkewahkgehgwak:%ld",row];
//}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view API_UNAVAILABLE(tvos){
    // 重新定义row 的UILabel
    UILabel *pickerLabel = (UILabel *)view;
    if (!pickerLabel) {
        pickerLabel = [[UILabel alloc] init];
        [pickerLabel setTextColor:UIColorFromHex(0X666666)];
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:[UIFont systemFontOfSize:12.0f]];
        pickerLabel.userInteractionEnabled = YES;
        
        // 隐藏分割线
        for(UIView *singleLine in pickerView.subviews) {
            if (singleLine.frame.size.height < 1) {
                singleLine.hidden = YES;
            }
        }
    }
    pickerLabel.text = [NSString stringWithFormat:@"哈你好啊后哥啊我换个哦我哈:%ld",row];
    
    return pickerLabel;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component API_UNAVAILABLE(tvos){
    
}

@end
