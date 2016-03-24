//
//  WYRegisterController.m
//  WYProject
//
//  Created by 王启镰 on 16/3/23.
//  Copyright © 2016年 wanglijinrong. All rights reserved.
//

#import "WYRegisterController.h"

@interface WYRegisterController ()

@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *containerViewCenterY;

@end

@implementation WYRegisterController

- (void)viewDidLoad {
    [super viewDidLoad];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardFrameChanged:) name:UIKeyboardDidChangeFrameNotification object:nil];
    
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)keyboardFrameChanged:(NSNotification *)n {
    CGRect rect = [n.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    NSTimeInterval animationTime = [n.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    ///  是否需要做动画
    CGFloat shortOf = APP_HEIGHT * 0.5 - 50 - rect.size.height;
    if (shortOf > 0) return;
    CGFloat distance = rect.origin.y == APP_HEIGHT ? -shortOf : shortOf;
    
    self.containerViewCenterY.constant += distance;
    [UIView animateWithDuration:animationTime animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (IBAction)registerBtnClick {
    

}

- (IBAction)backLoginBtnClick {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
