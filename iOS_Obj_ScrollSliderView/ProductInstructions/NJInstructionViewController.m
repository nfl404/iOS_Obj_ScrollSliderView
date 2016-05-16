//
//  NJInstructionViewController.m
//  iOS_Obj_ScrollSliderView
//
//  Created by Mr nie on 16/5/16.
//  Copyright © 2016年 程序猿:NiePlus   博客地址:http://nieplus.blog.com. All rights reserved.
//

#import "NJInstructionViewController.h"

@interface NJInstructionViewController ()

@property (nonatomic, strong) NJScrollSliderView *scrollSliderView;

@property (nonatomic, strong) NJFirstViewController *firstVC;

@property (nonatomic, strong) NJSecondViewController *secondVC;

@property (nonatomic, strong) NJThirdViewController *thirdVC;

@end

@implementation NJInstructionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.scrollSliderView = [[NJScrollSliderView alloc] initWithFrame:CGRectMake(0, 60, SWidth, SHeight)];
    self.scrollSliderView.titles = @[@"图片详情", @"产品参数", @"店铺推荐"];
    self.firstVC = [[NJFirstViewController alloc] init];
    self.secondVC = [[NJSecondViewController alloc] init];
    self.thirdVC = [[NJThirdViewController alloc] init];
    self.scrollSliderView.viewControllers = @[self.firstVC, self.secondVC, self.thirdVC];
    [self.view addSubview:self.scrollSliderView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
