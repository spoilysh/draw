//
//  ViewController.m
//  test
//
//  Created by fisher hk on 2018/10/12.
//  Copyright © 2018年 ysh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    if (@available(iOS 11.0, *)) {
        NSLog(@"safeInsets = %lf", [UIApplication sharedApplication].keyWindow.safeAreaInsets.top);
    } else {
        // Fallback on earlier versions
    }
    
    
    
}


@end
