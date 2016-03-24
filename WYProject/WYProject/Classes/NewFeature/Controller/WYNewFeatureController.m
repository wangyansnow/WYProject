//
//  WYNewFeatureController.m
//  WYProject
//
//  Created by 王启镰 on 16/3/23.
//  Copyright © 2016年 wanglijinrong. All rights reserved.
//

#import "WYNewFeatureController.h"
#import <UIView+YYAdd.h>

@interface WYNewFeatureController () <UIScrollViewDelegate>

@end

@implementation WYNewFeatureController
{
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;
    UIButton *_startBtn;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI {
    [self prepareScrollView];
    [self preparePageControl];
    [self prepareStartBtn];
    
    [self.view addSubview:_scrollView];
    [self.view addSubview:_pageControl];
    [self.view addSubview:_startBtn];
    
    // 自动布局
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(20);
        make.bottom.mas_equalTo(self.view.bottom).offset(-30);
    }];
    
    [_startBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(44);
        make.bottom.mas_equalTo(self.view.bottom).offset(-50);
    }];
}

- (void)prepareScrollView {
    _scrollView = [[UIScrollView alloc] initWithFrame:SCREEN_BOUNDS];
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.delegate = self;
    _scrollView.bounces = NO;
    
    NSArray *imageNames = @[@"image_guidance_one", @"image_guidance_two", @"image_guidance_three", @"image_guidance_four", @"image_guidance_five"];
    for (NSInteger i = 0; i < imageNames.count; i++) {
        NSString *imgName = imageNames[i];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:SCREEN_BOUNDS];
        imageView.left = APP_WIDTH * i;
        imageView.image = [UIImage imageNamed:imgName];
        [_scrollView addSubview:imageView];
    }
    _scrollView.contentSize = CGSizeMake(APP_WIDTH * imageNames.count, APP_HEIGHT);
}

- (void)preparePageControl {
    _pageControl = [UIPageControl new];
    _pageControl.numberOfPages = 5;
    _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    _pageControl.pageIndicatorTintColor = [UIColor orangeColor];
}

- (void)prepareStartBtn {
    _startBtn = [UIButton new];
    _startBtn.layer.cornerRadius = 8;
    _startBtn.layer.masksToBounds = YES;
    _startBtn.hidden = YES;
    [_startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
    [_startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
    [_startBtn addTarget:self action:@selector(startBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_startBtn setTitle:@"点我开始" forState:UIControlStateNormal];
    [_startBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

- (void)startBtnClick {
    [[NSNotificationCenter defaultCenter] postNotificationName:Notify_SwitchRootViewController object:nil];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger currentIndex = scrollView.contentOffset.x / APP_WIDTH;
    _pageControl.currentPage = currentIndex;
    _startBtn.hidden = currentIndex != 4;
}


@end
