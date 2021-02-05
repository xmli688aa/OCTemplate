//
//  ETiCarouselVC.m
//  OCTemplateDemo
//
//  Created by 赵伟志(EX-ZHAOWEIZHI002) on 2021/2/5.
//  Copyright © 2021 zhao. All rights reserved.
//

#import "ETiCarouselVC.h"
#import "iCarousel.h"

@interface ETiCarouselVC ()<iCarouselDataSource, iCarouselDelegate>

@property (weak, nonatomic) IBOutlet UIView *iCarOuselBgView;
@property (nonatomic, strong) iCarousel *myCarousel;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation ETiCarouselVC

- (NSMutableArray *)dataSource{
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
        [_dataSource addObject:[NSString stringWithFormat:@"start_page_1"]];
        [_dataSource addObject:[NSString stringWithFormat:@"start_page_2"]];
        [_dataSource addObject:[NSString stringWithFormat:@"start_page_3"]];
    }
    return _dataSource;
}
- (iCarousel *)myCarousel{
    if (_myCarousel == nil) {
        _myCarousel = [[iCarousel alloc] initWithFrame:self.iCarOuselBgView.bounds];
        _myCarousel.dataSource = self;
        _myCarousel.delegate = self;
        _myCarousel.bounces = NO;
        _myCarousel.pagingEnabled = YES;
        _myCarousel.type = iCarouselTypeRotary;
    }
    return _myCarousel;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.iCarOuselBgView addSubview:self.myCarousel];
    CGFloat viewWidth = kScreenWidth;
    NSLog(@"%f",viewWidth);
}



#pragma mark - iCarouselDataSource, iCarouselDelegate
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view {
    if (view == nil) {
        CGFloat viewWidth = kScreenWidth;
        view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, viewWidth, self.iCarOuselBgView.frame.size.height)];
    }
    ((UIImageView *)view).image = [UIImage imageNamed:[self.dataSource objectAtIndex:index]];
    ((UIImageView *)view).contentMode = UIViewContentModeScaleAspectFit;
    return view;


}

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    return self.dataSource.count;
}

- (void)encodeWithCoder:(nonnull NSCoder *)coder {
    
}

- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
    
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
     
}

//- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
//    return CGSizeMake(100, 100);
//}

- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
     
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
     
}

- (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
     
}

- (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator {
     
}

- (void)setNeedsFocusUpdate {
     
}

- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
    return YES;
}

- (void)updateFocusIfNeeded {
     
}

@end
