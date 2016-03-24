//
//  WYNavigationController.m
//  WYProject
//
//  Created by 王启镰 on 16/3/17.
//  Copyright © 2016年 wanglijinrong. All rights reserved.
//

#import "WYNavigationController.h"

@interface WYNavigationController () <UIGestureRecognizerDelegate>
{
    NSMutableArray *_titles;
    UIImageView *_navBarhairlineImageView;
}
@end

@implementation WYNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _navBarhairlineImageView = [self getNavHairlineImageViewUnder:self.navigationBar];
    _titles = [NSMutableArray new];
    [self initialScreenGesture];
    self.navigationBar.barTintColor = [UIColor blackColor];
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor colorWithWhite:0.9 alpha:1.0]};
}

- (void)initialScreenGesture {
    // 1.获取系统自带滑动手势的target对象
    id target = self.interactivePopGestureRecognizer.delegate;
    // 2.创建全屏滑动手势,调用系统自带手势的target的滑动方法
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
    // 3.设置手势代理,拦截手势触发
    panGesture.delegate = self;
    // 4.给导航控制器的view添加全屏滑动手势
    [self.view addGestureRecognizer:panGesture];
    // 5.禁止系统自带的滑动手势
    self.interactivePopGestureRecognizer.enabled = NO;
}

- (void)back {
    NSLog(@"I am back");
    [self popViewControllerAnimated:YES];
}
///  递归查找导航栏底部线
- (UIImageView *)getNavHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:[UIImageView class]] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    if ([view isKindOfClass:[WYNavigationController class]]) {
        NSLog(@"怎么是我自己");
        return nil;
    }
    NSArray *arr = view.subviews;
    for (UIView *view in arr) {
        UIImageView *hairlineImageView = [self getNavHairlineImageViewUnder:view];
        if (hairlineImageView) {
            return hairlineImageView;
        }
    }
    
    return nil;
}

#pragma mark - overwrite
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (!self.showBackTitle) {
        viewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
        [_titles addObject:self.navigationBar.topItem.title ? : @""];
    }
    viewController.hidesBottomBarWhenPushed = (self.childViewControllers.count >= 1);
    [super pushViewController:viewController animated:animated];
}

- (NSArray<UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated {
    if (!self.showBackTitle) {
        if (self.viewControllers.count > 1) {
            NSString *title = _titles.firstObject;
            UIViewController *target = self.viewControllers[1];
            target.navigationItem.backBarButtonItem.title = title;
            _titles = [NSMutableArray new];
            [_titles addObject:title ?: @""];
        }
    }
    return [super popToRootViewControllerAnimated:animated];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    if (!self.showBackTitle) {
        UIViewController *target = self.viewControllers.lastObject;
        target.navigationItem.backBarButtonItem.title = _titles.lastObject;
        [_titles removeLastObject];
    }
    return [super popViewControllerAnimated:animated];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _navBarhairlineImageView.hidden = !self.showBottomLine;
}

#pragma mark - UIGestureRecognizerDelegate
/// 拦截手势触发
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return self.childViewControllers.count != 1;
}


@end
