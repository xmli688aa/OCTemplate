//
//  ETLancscapeVC.m
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/8/2.
//  Copyright © 2019 zhao. All rights reserved.
//

#import "ETLandscapeVC.h"

@interface ETLandscapeVC ()

@end

@implementation ETLandscapeVC

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNewOrientation:YES];
    
}


@end
