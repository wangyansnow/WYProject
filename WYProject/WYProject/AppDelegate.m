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
    WYTabController *tabVC = [WYTabController new];
    self.window.rootViewController = tabVC;
    [self.window makeKeyAndVisible];
    
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

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
