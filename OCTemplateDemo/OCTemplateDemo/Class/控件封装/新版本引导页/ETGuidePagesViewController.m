//
//  ETGuidePagesViewController.m
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/8/19.
//  Copyright (c) Hello  All rights reserves.
//
        

#import "ETGuidePagesViewController.h"

#define s_w [UIScreen mainScreen].bounds.size.width
#define s_h [UIScreen mainScreen].bounds.size.height
#define VERSION_INFO_CURRENT @"currentversion"
#define kRGBAColor(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

@interface ETGuidePagesViewController ()<UIScrollViewDelegate>

@property (strong, nonatomic) NSArray *images;  //引导页图片名称
@property (strong, nonatomic) UIPageControl *page;
@property (strong, nonatomic) UIScrollView *scroll;
@property (strong, nonatomic) UIButton *enterBtn;
@end

@implementation ETGuidePagesViewController
- (NSArray *)images{
    if (_images == nil) {
        _images = @[
                    @"start_page_1",
                    @"start_page_2",
                    @"start_page_3"
                    ];
    }
    return _images;
}
- (UIScrollView *)scroll{
    if (_scroll == nil) {
        _scroll=[[UIScrollView alloc]init];
        _scroll.frame=self.view.bounds;
        _scroll.contentSize = CGSizeMake(self.images.count*self.view.bounds.size.width, 0);
        _scroll.pagingEnabled = YES;
        _scroll.showsHorizontalScrollIndicator = NO;
        _scroll.showsVerticalScrollIndicator = NO;
        _scroll.bounces = NO;
        _scroll.delegate = self;
    }
    return _scroll;
}
- (UIPageControl *)page{
    if (_page == nil) {
        _page=[[UIPageControl alloc]initWithFrame:CGRectMake(self.enterBtn.frame.origin.x, CGRectGetMinY(self.enterBtn.frame) -50, self.enterBtn.frame.size.width,30)];
        _page.numberOfPages=self.images.count;
        _page.currentPageIndicatorTintColor=[UIColor whiteColor];
    }
    return _page;
}
- (UIButton *)enterBtn{
    if (_enterBtn == nil) {
        //立即体验按钮
        CGFloat enterBtnW = 130;
        CGFloat enterBtnX = s_w/2 - enterBtnW/2;
        CGFloat enterBtnH = 40;
        CGFloat enterBtnY = s_h - 60 -enterBtnH;
        UIButton *enterBtn = [[ UIButton alloc] initWithFrame:CGRectMake(enterBtnX, enterBtnY, enterBtnW, enterBtnH)];
        [enterBtn setTitle:@"跳过" forState:UIControlStateNormal];
        enterBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [enterBtn addTarget:self action:@selector(jumpMainPage) forControlEvents:UIControlEventTouchUpInside];
        enterBtn.backgroundColor = kRGBAColor(122, 150, 242, 1);
        enterBtn.layer.masksToBounds = YES;
        enterBtn.layer.cornerRadius = enterBtnH/2;
        _enterBtn = enterBtn;
    }
    return _enterBtn;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //添加UIScrollView
    [self.view addSubview:self.scroll];
    //添加图片
    [self addImages];
    //添加立即体验按钮
    [self.view addSubview:self.enterBtn];
    //添加pageControl
    [self.view addSubview:self.page];
    
}
- (void)addImages{
    for (int i=0; i<self.images.count; i++) {
        UIImageView* imageView=[[UIImageView alloc]init];
        CGFloat imageX=i*s_w;
        CGFloat imageY=0;
        imageView.frame=CGRectMake(imageX, imageY, s_w, s_h);
        imageView.image=[UIImage imageNamed:self.images[i]];
        [_scroll addSubview:imageView];
    }
}
#pragma mark - 隐藏状态栏
- (BOOL)prefersStatusBarHidden{
    return  YES;
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint offset=scrollView.contentOffset;
    CGFloat offsetX=offset.x;
    int pageNum=(offsetX+0.5*_scroll.frame.size.width)/_scroll.frame.size.width;
    _page.currentPage=pageNum;
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //获取偏移量
    NSInteger currentPage = scrollView.contentOffset.x/_scroll.frame.size.width;;
    NSLog(@"page:%ld",(long)currentPage);
    if (currentPage == self.images.count-1) {
        [self.enterBtn setTitle:@"立即体验" forState:UIControlStateNormal];
    }else{
        [self.enterBtn setTitle:@"跳过" forState:UIControlStateNormal];
    }
}

#pragma mark - btn的点击监听事件
-(void)jumpMainPage{
    if (self.clickBlock) {
        self.clickBlock();
    }
    NSLog(@"进入首页");
}

#pragma mark - 版本判断
+ (BOOL)isShow{
//        return YES;
    // 读取版本信息
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *localVersion = [user objectForKey:VERSION_INFO_CURRENT];
    NSString *currentVersion =[[NSBundle mainBundle].infoDictionary objectForKey:@"CFBundleShortVersionString"];
    if (localVersion == nil || ![currentVersion isEqualToString:localVersion]) {
        [ETGuidePagesViewController saveCurrentVersion];
        return YES;
    }else
    {
        return NO;
    }
}
// 保存版本信息
+ (void)saveCurrentVersion{
    NSString *version =[[NSBundle mainBundle].infoDictionary objectForKey:@"CFBundleShortVersionString"];
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setObject:version forKey:VERSION_INFO_CURRENT];
    [user synchronize];
}

-(void)dealloc{
    NSLog(@"版本引导页销毁了");
}

@end
