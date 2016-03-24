//
//  WYLoginController.m
//  WYProject
//
//  Created by 王启镰 on 16/3/23.
//  Copyright © 2016年 wanglijinrong. All rights reserved.
//

#import "WYLoginController.h"
#import "WYRegisterController.h"


@interface WYLoginController ()

@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *containerViewCenterY;

@end

@implementation WYLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardFrameChanged:) name:UIKeyboardDidChangeFrameNotification object:nil];
}

- (IBAction)loginBtnClick {
    
}

- (IBAction)registerBtnClick {
    WYRegisterController *registerVC = [WYRegisterController new];
    registerVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:registerVC animated:YES completion:nil];
}

- (void)keyboardFrameChanged:(NSNotification *)n {
    CGRect rect = [n.userInfo[@"UIKeyboardFrameEndUserInfoKey"] CGRectValue];
    NSTimeInterval animTime = [n.userInfo[@"UIKeyboardAnimationDurationUserInfoKey"] doubleValue];
    
    ///  是否需要做动画
    CGFloat shortOf = APP_HEIGHT * 0.5 - 50 - rect.size.height;
    if (shortOf > 0) return;
    
    CGFloat distance = rect.origin.y == APP_HEIGHT ? -shortOf : shortOf;
    
    self.containerViewCenterY.constant += distance;
    [UIView animateWithDuration:animTime animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



@end
