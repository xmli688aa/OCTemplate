//
//  CNOrderScoreView.h
//  Server
//
//  Created by cean.q on 2019/9/20.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "ETXibBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@class CNOrderScoreView;
@protocol CNOrderScoreViewDelegate <NSObject>
- (void)up:(CNOrderScoreView *)scoreView;
- (void)down:(CNOrderScoreView *)scoreView;
- (void)submit:(CNOrderScoreView *)scoreView;
@end

@interface CNOrderScoreView : ETXibBaseView
@property (nonatomic, weak) id <CNOrderScoreViewDelegate> delegate;
+ (instancetype)scoreView;
- (void)show;
- (void)remove;
- (void)addScore:(NSInteger)score bill:(NSInteger)count;
- (void)subtractScore:(NSInteger)score bill:(NSInteger)count;
@end

NS_ASSUME_NONNULL_END
