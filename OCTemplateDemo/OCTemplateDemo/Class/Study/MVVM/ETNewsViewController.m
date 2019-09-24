//
//  ETNewsViewController.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/7/28.
//  Copyright © 2019 . All rights reserved.
//

#import "ETNewsViewController.h"
#import "ETNewsVM.h"
#import "ETNews.h"
@interface ETNewsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *newsData;
@property (nonatomic, strong) ETNewsVM *newsVM;
@end

@implementation ETNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.newsVM = [ETNewsVM new];
    [self.newsVM loadNewsData:^(NSArray * newsData) {
        self.newsData = newsData;
        [self.tableView reloadData];
    }];

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.newsData.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    ETNews *news = self.newsData[indexPath.row];
    cell.textLabel.text = news.title;
    cell.detailTextLabel.text = news.content;
    return cell;
}


@end
