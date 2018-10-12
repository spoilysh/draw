//
//  GDCABasenavigationController.m
//  GDSignature
//
//  Created by fisher hk on 2018/6/11.
//  Copyright © 2018年 fisher hk. All rights reserved.
//base navigationController

#import "GDCABasenavigationController.h"

@interface GDCABasenavigationController ()

@end

@implementation GDCABasenavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark 旋转屏幕相关
- (BOOL)shouldAutorotate
{
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait];
    return [self.topViewController supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    
    return UIInterfaceOrientationPortrait;
}

@end
