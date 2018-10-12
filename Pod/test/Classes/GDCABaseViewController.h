//
//  GDCABaseViewController.h
//  CSignSDK
//
//  Created by fisher hk on 2018/4/3.
//  Copyright © 2018年 fisher hk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GDCABaseViewController : UIViewController

//返回
- (void)back:(UIButton *)sender;

@end

/**
 com.gdca.sdk.pinsign
 http://192.168.10.121:8089/interiorIndex.view    开发环境
 
 http://192.168.10.113:8089/interiorIndex.view    测试环境
 
 http://119.145.171.200:8089/ca/sdkLogin/qrcode   //CA登录
 http://119.145.171.200:8089/ca/sdkLogin/callback   //回调
 
 $(BUILD_DIR)/$(CONFIGURATION)$(EFFECTIVE_PLATFORM_NAME)
 $(BUILD_DIR)/$(CONFIGURATION)$(EFFECTIVE_PLATFORM_NAME)
 
 else
 
 $(SRCROOT)/../ios_libs/$(CONFIGURATION)$(EFFECTIVE_PLATFORM_NAME)
 $(SRCROOT)/../ios_libs/$(CONFIGURATION)$(EFFECTIVE_PLATFORM_NAME)
 
 凭证号：a0f52945ed894e929be56d22f08d0b13
 签署号：6507546494ab49ce8554575853c27a76
 
 */
