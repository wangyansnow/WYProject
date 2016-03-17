//
//  WYTabController.m
//  WYProject
//
//  Created by 王启镰 on 16/3/16.
//  Copyright © 2016年 wanglijinrong. All rights reserved.
//

#import "WYTabController.h"
#import "WYBaseController.h"

@interface WYTabController ()

@end

@implementation WYTabController

+ (void)load {
    UITabBarItem *tabBarItemAppearance = [UITabBarItem appearance];
    
    NSDictionary *normalAttr = @{NSFontAttributeName: [UIFont systemFontOfSize:12.0], NSForegroundColorAttributeName: [UIColor whiteColor]};
    NSDictionary *selectedAttr = @{NSFontAttributeName: [UIFont systemFontOfSize:12.0], NSForegroundColorAttributeName: [UIColor orangeColor]};
    [tabBarItemAppearance setTitleTextAttributes:normalAttr forState:UIControlStateNormal];
    [tabBarItemAppearance setTitleTextAttributes:selectedAttr forState:UIControlStateSelected];
    
    // 字体和图片的偏移
    tabBarItemAppearance.titlePositionAdjustment = UIOffsetMake(0, 2);
    
    UITabBar *tabBarAppearance = [UITabBar appearance];
    tabBarAppearance.barTintColor = [UIColor blackColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initialAllChildViewController];
}

- (void)initialAllChildViewController {
    [self addChildControllerName:@"WYBaseController" normalImage:@"icon_tab_angel_default" selectedImage:@"icon_tab_angel_activation" title:@"天使"];
    [self addChildControllerName:@"WYBaseController" normalImage:@"icon_tab_discover_default" selectedImage:@"icon_tab_discover_activation" title:@"发现"];
    [self addChildControllerName:@"WYBaseController" normalImage:@"icon_tab_message_default" selectedImage:@"icon_tab_message_activation" title:@"消息"];
    [self addChildControllerName:@"WYBaseController" normalImage:@"icon_tab_mine_default" selectedImage:@"icon_tab_mine_activation" title:@"我"];
    
}

- (void)addChildControllerName:(NSString *)controllerName
                   normalImage:(NSString *)normalImage
                 selectedImage:(NSString *)selectedImage
                         title:(NSString *)title {
    Class class = NSClassFromString(controllerName);
    WYBaseController *controller = [class new];
    
    UIImage *normalImg = [[UIImage imageNamed:normalImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selectedImg = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    controller.title = title;
    
    UITabBarItem *item = controller.tabBarItem;
    item.image = normalImg;
    item.selectedImage = selectedImg;
    
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:controller];
    [self addChildViewController:navi];
}

@end
