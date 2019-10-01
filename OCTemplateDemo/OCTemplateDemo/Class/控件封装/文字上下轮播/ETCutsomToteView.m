
//
//  ETCutsomToteView.m
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/10/1.
//  Copyright (c) Hello  All rights reserves.
//
        

#import "ETCutsomToteView.h"
#import "ETToteModel.h"

@interface ETCutsomToteView ()
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end
@implementation ETCutsomToteView


- (void)setToteModel:(ETToteModel *)toteModel{
    _toteModel = toteModel;
    _contentLabel.text = [NSString stringWithFormat:@"%@ 总奖池: CNY %ld",toteModel.gameType,toteModel.money];
    
}

@end
