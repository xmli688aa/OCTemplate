//
//  SecondViewController.h
//  RACDemo
//
//  Created by Ethon.Z on 2019/4/23.
//  Copyright © 2019 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import  <ReactiveCocoa.h>


NS_ASSUME_NONNULL_BEGIN

@interface SecondViewController : UIViewController

@property (strong, nonatomic)RACSubject *subject;

@end

NS_ASSUME_NONNULL_END
