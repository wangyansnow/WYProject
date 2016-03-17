//
//  WYBaseController.m
//  WYProject
//
//  Created by 王启镰 on 16/3/16.
//  Copyright © 2016年 wanglijinrong. All rights reserved.
//

#import "WYBaseController.h"


@interface WYBaseController ()

@end

@implementation WYBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 50)];
    [btn setTitle:@"Push JPTableViewController" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(handleBtn:) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)handleBtn:(UIButton *)btn {
    UIViewController *VC = [UIViewController new];
    VC.view.backgroundColor = [UIColor grayColor];
    [self.navigationController pushViewController:VC animated:YES];
    
}


@end
