//
//  GDCABaseViewController.m
//  CSignSDK
//
//  Created by fisher hk on 2018/4/3.
//  Copyright © 2018年 fisher hk. All rights reserved.
//

#import "GDCABaseViewController.h"

@interface GDCABaseViewController ()

@end

@implementation GDCABaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGB(0xF2F2F2);
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBar.translucent = NO;
//    self.navigationController.allowRotation = NO;
    
    [self setupNavigationBar];
    
}

- (void)setupNavigationBar {
    
    self.navigationController.navigationBar.barTintColor = [GDCASignManager shareInstance].themeColor;
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:[self imagesNamedFromCustomBundle:@"ding_back.png"] forState:0];
    backBtn.frame = CGRectMake(0, 0, 40, 40);
    [backBtn addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [GDCASignManager shareInstance].naviTitleColor};
}

//返回
- (void)back:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

//获取bundle的图片
- (UIImage *)imagesNamedFromCustomBundle:(NSString *)imgName {
    
    NSString * bundlePath = [[ NSBundle mainBundle] pathForResource:@"GDSignature" ofType:@"bundle"];
    NSString *imgPath= [bundlePath stringByAppendingPathComponent:imgName];
    
    return [UIImage imageWithContentsOfFile:imgPath];
}

@end
