//
//  ViewController.m
//  iOS_Obj_ScrollSliderView
//
//  Created by Mr nie on 16/5/16.
//  Copyright © 2016年 程序猿:NiePlus   博客地址:http://nieplus.blog.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NJInstructionViewController *InstructionVC = [[NJInstructionViewController alloc] init];
    InstructionVC.navigationItem.title = @"产品详情";
    
    UINavigationController *NavC = [[UINavigationController alloc] initWithRootViewController:InstructionVC];
    [self presentViewController:NavC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
