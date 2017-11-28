//
//  ViewController.m
//  Animation_demo
//
//  Created by gaojianlong on 2017/11/20.
//  Copyright © 2017年 JLB. All rights reserved.
//

#import "ViewController.h"
#import "BasicAnimationController.h"
#import "AnimationGroupController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic , strong) UIView *myView;
@property (nonatomic , strong) UITableView *table;
@property (nonatomic , strong) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"动画列表";
    [self initViews];
}

- (void)initViews
{
    [self.view addSubview:self.table];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
        {
            BasicAnimationController *vc = [[BasicAnimationController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 1:
        {
            
            break;
        }
        case 2:
        {
            AnimationGroupController *vc = [[AnimationGroupController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 3:
        {
            
            break;
        }
        default:
            break;
    }
    
}

- (UITableView *)table
{
    if (!_table) {
        _table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) style:UITableViewStylePlain];
        _table.delegate = self;
        _table.dataSource = self;
        
        UIView *footer = [[UIView alloc] init];
        footer.backgroundColor = [UIColor whiteColor];
        _table.tableFooterView = footer;
    }
    return _table;
}

- (NSArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = @[
                       @"CABasicAnimation(基本动画)",
                       @"CAKeyframeAnimation(关键帧动画)",
                       @"CAAnimationGroup(动画组)",
                       @"CATransition(转场动画)",
                       ];
    }
    return _dataArray;
}

@end
