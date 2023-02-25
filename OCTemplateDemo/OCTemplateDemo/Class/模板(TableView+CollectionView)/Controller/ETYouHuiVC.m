//
//  GatewayViewController.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/7/14.
//  Copyright © 2019  . All rights reserved.
//

#import "ETYouHuiVC.h"
#import "UIBarButtonItem+ETExtension.h"
#import "ETTableTemplateVC.h"
#import "ETCollectionTemplateVC.h"
#import <CoreText/CoreText.h>
#import "CNSeeMoreLabel.h"
#import "ETCodeTemplateVC.h"

@interface ETYouHuiVC ()<CNSeeMoreLabelDelegate>
@property (nonatomic, strong) UIBarButtonItem *rightItem;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
//查看更多
@property (weak, nonatomic) IBOutlet CNSeeMoreLabel *seeMoreView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *seeMoreViewH;
@property (nonatomic, copy) NSString *content;
@end

@implementation ETYouHuiVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNaviItem];
    _contentLabel.numberOfLines = 2;
    _contentLabel.font = [UIFont systemFontOfSize:14];
    _content = @"在ios中，UILabel常常需要计算高度来实现动态高度变化，以下是一些关于label字数行数计算方法的总结，以备需要之时查看数计算方法的总结，以备需要之时查看数计算方法的总结，以备需要之时查看数计算方法的总结，以备需要之时查看哈";
    _contentLabel.text = _content;
    _contentLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickContentLabel)];
    _contentLabel.userInteractionEnabled = YES;
    [_contentLabel addGestureRecognizer:tap];
    [self clickContentLabel];
    
    
    _seeMoreView.text = _content;
    _seeMoreView.delegate = self;
    
}
- (void)clickContentLabel{
    NSString *attribute = @"查看全部";
    _contentLabel.text = _content;
    if (_contentLabel.numberOfLines == 0) {
        _contentLabel.numberOfLines = 2;
    }else{
        _contentLabel.numberOfLines = 0;
        attribute = @"收起";
    }
    NSArray *array = [self getLinesArrayOfStringInLabel:_contentLabel];
    if (array.count >2 && _contentLabel.numberOfLines == 2) {
        NSString *first = array[0];
        NSString *second = array[1];
        _contentLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
        second = [second stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        _contentLabel.text = [NSString stringWithFormat:@"%@%@",first,second];
    }
    self.contentLabel.text = [NSString stringWithFormat:@"%@%@",self.contentLabel.text,attribute];
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:self.contentLabel.text];
    [attrStr addAttributes:@{
        NSUnderlineStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle],
        NSForegroundColorAttributeName:UIColor.redColor
    } range:NSMakeRange(self.contentLabel.text.length - attribute.length, attribute.length)];
    _contentLabel.attributedText = attrStr;
}
- (void)labelChangeHeight:(CGFloat)height{
    _seeMoreViewH.constant = height;
}


- (void)setNaviItem{
    UIBarButtonItem *leftItem = [UIBarButtonItem itemWithTitle:nil target:self action:@selector(clickLeft) image:@"tab_message_click"];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem *rightItem = [UIBarButtonItem itemWithTitle:@"编辑" target:self action:@selector(clickRight) image:nil];
    _rightItem = rightItem;
    self.navigationItem.rightBarButtonItem = rightItem;
}
- (void)clickRight{
    NSLog(@"点击右上角");
    self.rightItem.insideBtn.selected = !self.rightItem.insideBtn.selected;
    if (self.rightItem.insideBtn.selected) {
        [self.rightItem.insideBtn setTitle:@"完成" forState:UIControlStateNormal];
    }else{
        [self.rightItem.insideBtn setTitle:@"编辑" forState:UIControlStateNormal];
    }
}
- (void)clickLeft{
    NSLog(@"点击左上角");
}

#pragma mark - 进入tableView Xib模板控制器
- (IBAction)tableViewTemplate:(id)sender {
    [self.navigationController pushViewController:[ETTableTemplateVC new] animated:YES];
}
#pragma mark - 进入tableView 纯代码模板控制器
- (IBAction)toCodeTableVIewTemplate:(id)sender {
    
    [self.navigationController pushViewController:[ETCodeTemplateVC new] animated:YES];
    
}

#pragma mark - 进入collection模板控制器

- (IBAction)collectionTemplate:(id)sender {
    
    [self.navigationController pushViewController:[ETCollectionTemplateVC new] animated:YES];
}
- (NSArray *)getLinesArrayOfStringInLabel:(UILabel *)label{
    NSString *text = [label text];
    UIFont *font = [label font];
    CGRect rect = [label frame];
    
    CTFontRef myFont = CTFontCreateWithName(( CFStringRef)([font fontName]), [font pointSize], NULL);
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:text];
    [attStr addAttribute:(NSString *)kCTFontAttributeName value:(__bridge  id)myFont range:NSMakeRange(0, attStr.length)];
    CFRelease(myFont);
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString(( CFAttributedStringRef)attStr);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0,0,rect.size.width,100000));
    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, NULL);
    NSArray *lines = ( NSArray *)CTFrameGetLines(frame);
    NSMutableArray *linesArray = [[NSMutableArray alloc]init];
    for (id line in lines) {
        CTLineRef lineRef = (__bridge  CTLineRef )line;
        CFRange lineRange = CTLineGetStringRange(lineRef);
        NSRange range = NSMakeRange(lineRange.location, lineRange.length);
        NSString *lineString = [text substringWithRange:range];
        CFAttributedStringSetAttribute((CFMutableAttributedStringRef)attStr, lineRange, kCTKernAttributeName, (CFTypeRef)([NSNumber numberWithFloat:0.0]));
        CFAttributedStringSetAttribute((CFMutableAttributedStringRef)attStr, lineRange, kCTKernAttributeName, (CFTypeRef)([NSNumber numberWithInt:0.0]));
        //NSLog(@"''''''''''''''''''%@",lineString);
        [linesArray addObject:lineString];
    }
    
    CGPathRelease(path);
    CFRelease( frame );
    CFRelease(frameSetter);
    return (NSArray *)linesArray;
}
@end
