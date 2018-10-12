//
//  GDCAOCRBaseViewController.h
//  GDSignature
//
//  Created by fisher hk on 2018/6/6.
//  Copyright © 2018年 fisher hk. All rights reserved.
//OCR基本控制器

#import "GDCABaseViewController.h"
#import "GDCAIDFaceButton.h"
#import "GDCACameraViewController.h"
#import "GDCAIDinfoViewController.h"

@class GDCAUserInfo;

typedef void(^AuthFailureHandleBlock)(NSInteger code, NSString *msg);
typedef void(^AuthSuccessHandleBlock)(NSString *msg);
typedef void(^AuthUserInfoHandleBlock)(GDCAUserInfo *userInfo);

@interface GDCAOCRBaseViewController : GDCABaseViewController

@property (nonatomic, strong) GDCAUserInfo *backUserInfoM; //存放背面信息
@property (nonatomic, strong) GDCAUserInfo *faceUserInfoM; //存放背面信息
@property (nonatomic, copy) NSString *facePhotoBase64;//人面照片base64
@property (nonatomic, copy) NSString *backPhotoBase64;//国徽面base64
    
@property (nonatomic, strong) GDCAIDFaceButton *idFaceBtn;
@property (nonatomic, strong) GDCAIDFaceButton *idBackBtn;
@property (nonatomic, assign) BOOL isSuccess;
@property (nonatomic, assign) BOOL isFacePhotoSuccess;
@property (nonatomic, assign) BOOL isBackPhotoSuccess;
@property (nonatomic, strong) UIButton *nextBtn;

@property (nonatomic, copy) AuthSuccessHandleBlock authSuccessBlock;
@property (nonatomic, copy) AuthFailureHandleBlock authFailureBlock;
@property (nonatomic, copy) AuthUserInfoHandleBlock authUserInfoBlock; //用户信息

//验证照片信息
- (void)identifierType:(NSInteger)type attachment:(NSString *)attachment;

//点击下一步处理
- (void)complete;

//弹窗
- (void)alertView:(NSString *)title;

@end
