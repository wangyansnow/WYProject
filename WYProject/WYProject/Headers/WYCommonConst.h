//
//  WYCommonConst.h
//  WYProject
//
//  Created by 王启镰 on 16/3/17.
//  Copyright © 2016年 wanglijinrong. All rights reserved.
//

#ifndef WYCommonConst_h
#define WYCommonConst_h


#endif /* WYCommonConst_h */


/**
 *  当Xcode为Release时不输出，为Debug时输出
 *
 *  @param ...
 *
 *  @return
 */
#ifndef __OPTIMIZE__

#define NSLog(...) NSLog(__VA_ARGS__)

/**
 *  打印的时候可以看到类名、方法以及行数
 *
 */
#define NCLog(fmt,...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ## __VA_ARGS__);

#else

#define NSLog(...) {}
#define NCLog(fmt,...) {}

#endif

/** MainScreen Height - Width - bounds - scale **/
#define SCREEN_BOUNDS [UIScreen mainScreen].bounds
#define APP_WIDTH SCREEN_BOUNDS.size.width
#define APP_HEIGHT SCREEN_BOUNDS.size.height
#define SCALE [UIScreen mainScreen].scale

/** Hex Color **/
#define RGB_Color(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define RGB_ColorAlpha(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define RGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]
#define RGBALPHA(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:(a)]


#define WYVersion [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"]

/** Device **/
#define IS_IPHONE4 [[UIScreen mainScreen] bounds].size.height == 480.0
#define IS_IPHONE5 [[UIScreen mainScreen] bounds].size.height == 568.0  // 5和5S
#define IS_IPHONE6 [[UIScreen mainScreen] bounds].size.height == 667.0
#define IS_IPHONE6PLUS [[UIScreen mainScreen] bounds].size.height == 736.0

#define IS_IOS_7 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) ? YES : NO)
#define IS_IOS_8 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) ? YES : NO)
#define IS_IOS_9 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0) ? YES : NO)

/** SandBox Key **/
#define SANDBOX_VERSION_KEY @"sandBoxVersionKey"

/** Import Headers **/
#import <Masonry/Masonry.h>

