//
//  WYBaseController.m
//  WYProject
//
//  Created by 王启镰 on 16/3/16.
//  Copyright © 2016年 wanglijinrong. All rights reserved.
//

#import "WYBaseController.h"
#import <AVOSCloud/AVOSCloud.h>
#import <SVProgressHUD/SVProgressHUD.h>

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
    
    
    AVObject *testObject = [AVObject objectWithClassName:@"TestObject"];
    [testObject setObject:@"王启镰" forKey:@"name"];
    [testObject save];
}

- (void)handleBtn:(UIButton *)btn {
//    UIViewController *VC = [UIViewController new];
//    VC.view.backgroundColor = [UIColor grayColor];
//    [self.navigationController pushViewController:VC animated:YES];
    static int i = 1;
    NSString *name = [NSString stringWithFormat:@"王启镰%d", i++];
    AVObject *testObject = [AVObject objectWithClassName:@"TestObject"];
    [testObject setObject:name forKey:@"name"];
    [testObject save];
    
    [SVProgressHUD showSuccessWithStatus:@"保存数据成功" maskType:SVProgressHUDMaskTypeGradient];
}


@end
