//
//  NJScrollSliderView.h
//  iOS_Obj_ScrollSliderView
//
//  Created by Mr nie on 16/5/16.
//  Copyright © 2016年 程序猿:NiePlus   博客地址:http://nieplus.blog.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NJTool.h"
#import "FontHeader.h"

@interface NJScrollSliderView : UIView

@property(nonatomic, strong) NSArray *viewControllers;

@property(nonatomic, strong) NSArray *titles;

@property(nonatomic, strong) UIScrollView *scrollView;

@property(nonatomic, strong) UIView *topView;


@end
