//
//  NJScrollSliderView.m
//  iOS_Obj_ScrollSliderView
//
//  Created by Mr nie on 16/5/16.
//  Copyright © 2016年 程序猿:NiePlus   博客地址:http://nieplus.blog.com. All rights reserved.
//

#import "NJScrollSliderView.h"

#define Width (self.frame.size.width)
#define Height (self.frame.size.height)

@interface NJScrollSliderView ()<UIScrollViewDelegate>

@property(nonatomic, strong) UILabel *sliderLabel;

@end

@implementation NJScrollSliderView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        self.backgroundColor = [NJTool bgColor];
        [self initTopView];
        [self initScrollView];
    }
    return self;
}

- (void)setViewControllers:(NSArray *)viewControllers {
    _viewControllers = viewControllers;
    self.scrollView.contentSize = CGSizeMake(Width * self.viewControllers.count, Height - 64 - CGRectGetHeight(self.topView.frame));
    CGFloat btnWidth = (Width - (self.viewControllers.count + 1) * 10) / self.viewControllers.count;
    for (int i=0; i<viewControllers.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = i+ 1;
        if (i == 0) {
            [btn setTitleColor:[NJTool bgBlueColorForLabel] forState:UIControlStateNormal];
        } else {
            [btn setTitleColor:[NJTool titleBlackColor] forState:UIControlStateNormal];
        }
        btn.titleLabel.font = Font_16;
        [btn setTitle:self.titles[i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.frame = CGRectMake(10 + (btnWidth + 10) * i, 5, btnWidth, 30);
        if (IsIphone6p) {
            btn.frame = CGRectMake(10 + (btnWidth + 10) * i, 7.5, btnWidth, 30);
        }
        [self.topView addSubview:btn];
    }
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, CGRectGetHeight(self.topView.frame) - 2, btnWidth + 10, 2)];
    label.backgroundColor = [NJTool bgBlueColorForLabel];
    [self.topView addSubview:label];
    self.sliderLabel = label;
    
}

- (void)btnAction:(UIButton *)btn {
    CGRect rect = self.sliderLabel.frame;
    rect.origin.x = 5 + (btn.tag - 1) *(btn.frame.size.width + 10);
    [self.scrollView setContentOffset:CGPointMake(self.frame.size.width * (btn.tag - 1), 0) animated:YES];
}

- (void)initTopView {
    self.topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Width, 40)];
    if (IsIphone6p) {
        self.topView.frame = CGRectMake(0, 0, Width, 50);
    }
    self.topView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.topView];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.topView.frame) - 0.5, Width, 0.5)];
    label.backgroundColor = [NJTool titleGrayColor];
    [self.topView addSubview:label];
}

- (void)initScrollView {
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.topView.frame), Width, Height - CGRectGetHeight(self.topView.frame) - 64)];
    self.scrollView.backgroundColor = [NJTool bgColor];
    self.scrollView.contentSize = CGSizeMake(Width * self.viewControllers.count, Height - 64 - CGRectGetHeight(self.topView.frame));
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.bounces = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:self.scrollView];
}

- (void)layoutSubviews {
    for (int i=0; i<self.viewControllers.count; i++) {
        UIViewController *VC = self.viewControllers[i];
        UIView *view = VC.view;
        view.frame = CGRectMake(i * Width, 0, Width, Height -64 -CGRectGetHeight(self.topView.frame));
        [self.scrollView addSubview:view];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    int pageIndex = scrollView.contentOffset.x / self.frame.size.width;
    CGFloat offSet = scrollView.contentOffset.x / self.frame.size.width;
    CGRect rect = self.sliderLabel.frame;
    rect.origin.x = 5 + (offSet) *self.sliderLabel.frame.size.width;
    
    [UIView animateWithDuration:0.15 animations:^{
        self.sliderLabel.frame = rect;
    }];
    [self changeBtnColorWithIndex:pageIndex + 1];
    
}

- (void)changeBtnColorWithIndex:(NSInteger)index {
    for (int i=0; i<self.viewControllers.count; i++) {
        UIButton *btn = (UIButton *)[self.topView viewWithTag:i+1];
        if (i + 1 == index) {
            [btn setTitleColor:[NJTool bgBlueColorForLabel] forState:UIControlStateNormal];
        } else {
            [btn setTitleColor:[NJTool titleBlackColor] forState:UIControlStateNormal];
        }
        
    }
    
}

@end
