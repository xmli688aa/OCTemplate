
//
//  ETManagerTool.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/9/29.
//  Copyright © 2019 zhao. All rights reserved.
//

#import "ETToolManager.h"
#import <CoreText/CoreText.h>

@implementation ETToolManager
//获取当前屏幕显示的viewcontroller
+ (UIViewController *)getCurrentVC {
    UIViewController *result = nil;
    UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    do {
        if ([rootVC isKindOfClass:[UINavigationController class]]) {
            UINavigationController *navi = (UINavigationController *)rootVC;
            UIViewController *vc = [navi.viewControllers lastObject];
            result = vc;
            rootVC = vc.presentedViewController;
            continue;
        } else if([rootVC isKindOfClass:[UITabBarController class]]) {
            UITabBarController *tab = (UITabBarController *)rootVC;
            result = tab;
            rootVC = [tab.viewControllers objectAtIndex:tab.selectedIndex];
            continue;
        } else if([rootVC isKindOfClass:[UIViewController class]]) {
            result = rootVC;
            rootVC = nil;
        }
    } while (rootVC != nil);
    
    return result;
}

+ (UIImage *)screenShot{
    CGRect screenRect = [UIScreen mainScreen].bounds;
    UIGraphicsBeginImageContext(screenRect.size);
    UIGraphicsGetCurrentContext();
    UIViewController *currentVC = [self getCurrentVC];
    [currentVC.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();        //image就是截取的图片
    UIGraphicsEndImageContext();
    return image;
}

//传入需要截取的view
+ (UIImage *)screenShotView:(UIView *)view{
    UIImage *imageRet = [[UIImage alloc]init];
    UIGraphicsBeginImageContextWithOptions(view.frame.size, false, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    imageRet = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imageRet;
}


+ (void)addGradientColorWithView:(UIView *)view startColor:(UIColor *)startColor endColor:(UIColor *)endColor isVertical:(BOOL )isVertical{
    CAGradientLayer * gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = view.bounds;
    gradientLayer.colors = @[(__bridge id)startColor.CGColor,(__bridge id)endColor.CGColor];
    //    startPoint & endPoint设置为(0,0)(1.0,0)代表水平方向渐变,(0,0)(0,1.0)代表竖直方向渐变
    gradientLayer.startPoint = CGPointMake(0, 0);
    
    if (isVertical) {
        gradientLayer.endPoint = CGPointMake(0, 1.0);
    }else{
        gradientLayer.endPoint = CGPointMake(1.0,0);
    }
    gradientLayer.locations = @[@0,@1];
    [view.layer addSublayer:gradientLayer];
    
}
//给UILabel设置行间距和字间距
+ (void)setLabelSpace:(UILabel*)label withString:(NSString*)str  lineSpace:(CGFloat )lineSpae{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:str];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpae; // 行间距
    //    [paragraphStyle setMinimumLineHeight:20.0];
    //    [paragraphStyle setMaximumLineHeight:20.0];
    
    NSRange range = NSMakeRange(0, [str length]);
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
    label.attributedText = attributedString;
    
    //    //设置字间距 NSKernAttributeName:@1.5f
    ////    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f
    ////    };
    //    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:str];
    //    label.attributedText = attributeStr;
    
}
///获取label的行数和内容
+ (NSArray *)getLinesArrayOfStringInLabel:(UILabel *)label{
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

+ (NSDateComponents*)dateComponentsWithDate:(NSDate *)inputDate{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags;
    unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    comps = [calendar components:unitFlags fromDate:inputDate];
    return comps;
}
+ (NSString *)stringFromDate:(NSDate *)date format:(NSString*)format{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    return destDateString;
}
+ (NSDate *)dateFromString:(NSString *)dateString format:(NSString *)format{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: format];
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    return destDate;
}

///计算两个日期相隔时间(多少秒)
+ (NSTimeInterval )calculateTimeBetweenBeginTime:(NSString *)beginTime endTime:(NSString *)endTime{
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    //要注意beginTime和endTime 格式一定要统一(yyyy-MM-dd hh:mm:ss)
    [dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    NSDate *beginD = [dateFormatter dateFromString:beginTime];
    NSDate *endD = [dateFormatter dateFromString:endTime];
    NSTimeInterval value = [endD timeIntervalSinceDate:beginD];
    
    return value;
}
/**正则验证手机号*/
+ (BOOL)isValidatePhone:(NSString *)phone{
    NSString *phoneRegex = @"^(1)[3456789]\\d{9}";
    NSPredicate *phonePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    if (![phonePredicate evaluateWithObject:phone]) {
        
        return NO;
    }
    return YES;
}
/**正则验证邮箱*/
+ (BOOL)isValidateEmail:(NSString *)originalEmail{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *email = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [email evaluateWithObject:originalEmail];
}

/** 正则表达式验证密码是否合法 YES 合法，NO 不合法 */
+ (BOOL)isValidatePwd:(NSString *)originalPwd{
    NSString *pwdRegex = @"^[a-zA-Z0-9]{6,16}";
    NSPredicate *pwd = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pwdRegex];
    return [pwd evaluateWithObject:originalPwd];
}
/** 转换货币字符串 */
+ (NSString *)getMoneyString:(double)money {
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    numberFormatter.roundingMode = NSNumberFormatterRoundFloor;
    numberFormatter.maximumFractionDigits = 2;
    // 设置格式
    [numberFormatter setPositiveFormat:@"###,##0.00;"];
    NSString *formattedNumberString = [numberFormatter stringFromNumber:[NSNumber numberWithDouble:money]];
    return formattedNumberString;
}

@end
