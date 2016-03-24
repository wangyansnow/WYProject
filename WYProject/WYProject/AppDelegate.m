//
//  AppDelegate.m
//  WYProject
//
//  Created by 王启镰 on 16/3/16.
//  Copyright © 2016年 wanglijinrong. All rights reserved.
//

#import "AppDelegate.h"
#import "WYTabController.h"
#import "JSPatch/JSPatch.h"
#import "Bugly/CrashReporter.h"
#import <AVOSCloud/AVOSCloud.h>
#import "WYNewFeatureController.h"
#import "WYUser.h"
#import "WYLoginController.h"

#define CRASH_REPORT_APPID @"900022702"
#define LEAN_CLOUD_APPID @"n2csir8un13jsuqj12ufo9cc"
#define LEAN_CLOUD_APPKEY @"lt2nqmemvsrfibz468bcg7xd"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 检查热修复
//    [self checkForHotfix];
    
    // crash收集上报
    [self reportCrash];
    
    // 初始化leanCloud SDK
    [AVOSCloud setApplicationId:LEAN_CLOUD_APPID clientKey:LEAN_CLOUD_APPKEY];
    
    self.window = [[UIWindow alloc] initWithFrame:SCREEN_BOUNDS];
    self.window.rootViewController = [self getRootViewController];
//    self.window.rootViewController = [WYNewFeatureController new];
    [self.window makeKeyAndVisible];
    
    // 添加切换控制器监听
    [self addObserVer];
    
    return YES;
}

- (void)checkForHotfix {
    [JSPatch testScriptInBundle];
}
- (void)reportCrash {
#if DEBUG == 1
    [[CrashReporter sharedInstance] enableLog:YES];
#endif
    // 设置渠道号
    [[CrashReporter sharedInstance] setChannel:@"WYProject"];
    // 设置用户标识  --> [一般是从偏好设置中取到的用户名]
    [[CrashReporter sharedInstance] setUserId:@"王启镰"];
    [[CrashReporter sharedInstance] installWithAppId:CRASH_REPORT_APPID];
    
}

- (UIViewController *)getRootViewController {
    
    if ([self isNewVersion]) return [WYNewFeatureController new];
    if ([[WYUser sharedUser] isLogin]) return [WYTabController new];
    
    return [WYLoginController new];
}

///  检查更新
- (BOOL)isNewVersion {
    NSString *localVersion = [[NSUserDefaults standardUserDefaults] objectForKey:SANDBOX_VERSION_KEY];
    if (![localVersion isEqualToString:WYVersion]) {
        NSLog(@"版本更新");
        [[NSUserDefaults standardUserDefaults] setObject:WYVersion forKey:SANDBOX_VERSION_KEY];
        return YES;
    }
    return NO;
}

- (void)addObserVer {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(switchRootViewController) name:Notify_SwitchRootViewController object:nil];
}

- (void)switchRootViewController {
    self.window.rootViewController = [self getRootViewController];
}


@end
