//
//  GDCAOCRBaseViewController.m
//  GDSignature
//
//  Created by fisher hk on 2018/6/6.
//  Copyright © 2018年 fisher hk. All rights reserved.
//

#import "GDCAOCRBaseViewController.h"

static NSInteger isFaceBaseTag = 10000;

@interface GDCAOCRBaseViewController ()<GDCACameraViewControllerDelegate>

@end

@implementation GDCAOCRBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"身份证上传";
    
    [self createSubviews];
}

//630*400
- (void)createSubviews {
    
    self.idFaceBtn = [GDCAIDFaceButton buttonWithType:UIButtonTypeCustom];
    self.idFaceBtn.tipsLabel.text = @"点击拍摄身份证人像面";
    self.idFaceBtn.tipsImage.image = [GDCACommonFunction imagesNamedFromCustomBundleWithImageName:@"idcard_back.png"];
    self.idFaceBtn.tag = (isFaceBaseTag + 1);
    [self.idFaceBtn addTarget:self action:@selector(openCamera:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.idFaceBtn];
    [self.idFaceBtn mas_makeConstraints:^(GDCAMASConstraintMaker *make) {
        make.top.mas_equalTo(suitH(30));
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(suitW(315));
        make.height.mas_equalTo(suitH(200));
    }];
    
    self.idBackBtn = [GDCAIDFaceButton buttonWithType:UIButtonTypeCustom];
    self.idBackBtn.tipsLabel.text = @"点击拍摄身份证国徽面";
    self.idBackBtn.tipsImage.image = [GDCACommonFunction imagesNamedFromCustomBundleWithImageName:@"idcard_front.png"];
    self.idBackBtn.tag = (isFaceBaseTag + 2);
    [self.idBackBtn addTarget:self action:@selector(openCamera:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.idBackBtn];
    [self.idBackBtn mas_makeConstraints:^(GDCAMASConstraintMaker *make) {
        make.top.equalTo(self.idFaceBtn.mas_bottom).offset(suitH(30));
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(suitW(315));
        make.height.mas_equalTo(suitH(200));
    }];
    
    self.nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    self.nextBtn.titleLabel.font = [UIFont systemFontOfSize:adjustFont(15)];
    [self.nextBtn setTitleColor:[GDCASignManager shareInstance].themeColor forState:UIControlStateNormal];
    self.nextBtn.backgroundColor = [UIColor whiteColor];
    self.nextBtn.layer.borderColor = [GDCASignManager shareInstance].themeColor.CGColor;
    self.nextBtn.layer.masksToBounds = YES;
    self.nextBtn.layer.borderWidth = 0.5;
    [self.nextBtn addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.nextBtn];
    [self.nextBtn mas_makeConstraints:^(GDCAMASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(suitW(339));
        make.height.mas_equalTo(suitH(44));
        make.bottom.equalTo(self.view).offset(-(iPhoneXSafeAreaHeight() + 20));
    }];
}

-(void)openCamera:(UIButton *)sender {
    
    GDCACameraViewController *vc = [[GDCACameraViewController alloc] init];
    vc.delegate = self;
    vc.isFace = (sender.tag == (isFaceBaseTag + 1));
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)nextAction:(UIButton *)sender {
    
    if (self.idFaceBtn.idPhoto.hidden) {
        [self alertView:@"请拍摄身份证人像面"];
        return;
    }
    if (!self.isFacePhotoSuccess) {
        [self alertView:@"请重新拍摄身份证人像面"];
        return;
    }
    if (self.idBackBtn.idPhoto.hidden) {
        [self alertView:@"请拍摄身份证国徽面"];
        return;
    }
    if (!self.isBackPhotoSuccess) {
        [self alertView:@"请重新拍摄身份证国徽面"];
        return;
    }
    
    [self complete];
    
//    UIImage *idcardImage = self.idFaceBtn.idPhoto.image;
//    if (idcardImage) {
//        idcardImage = [GDCACommonFunction compressImage:idcardImage toSize:CGSizeMake(idcardImage.size.width/1.5, idcardImage.size.height/1.5)];
//    }
//    NSData *imgData = UIImageJPEGRepresentation(idcardImage, 0.8);
//    NSString *photoData = [imgData base64EncodedStringWithOptions:0];
//    [self identifierType:0 attachment:photoData];
}

//点击下一步处理
- (void)complete {
    
}

//验证照片信息
- (void)identifierType:(NSInteger)type attachment:(NSString *)attachment {
    
}

- (void)back:(UIButton *)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        
    }];
    if (self.authFailureBlock) {
        self.authFailureBlock(USER_CANCEL_CODE, @"取消成功");
    }
}

#pragma mark  GDCACameraViewControllerDelegate
- (void)getIDPhotoWithPhoto:(UIImage *)photo isFace:(BOOL)isFace isSuccess:(BOOL)isSuccess {
    
    if (isFace) {
        self.idFaceBtn.idPhoto.image = photo;
        self.idFaceBtn.idPhoto.hidden = NO;
        self.isSuccess = isSuccess;
        self.idFaceBtn.maskImage.hidden = NO;
        UIImage *idcardImage = self.idFaceBtn.idPhoto.image;
        if (idcardImage) {
            idcardImage = [GDCACommonFunction compressImage:idcardImage toSize:CGSizeMake(idcardImage.size.width/1.5, idcardImage.size.height/1.5)];
        }
        NSData *imgData = UIImageJPEGRepresentation(idcardImage, 0.8);
        NSString *photoData = [imgData base64EncodedStringWithOptions:0];
        [self identifierType:0 attachment:photoData];
        
    } else {
        self.idBackBtn.idPhoto.image = photo;
        self.idBackBtn.idPhoto.hidden = NO;
        self.idBackBtn.maskImage.hidden = NO;
        UIImage *idCardImage = self.idBackBtn.idPhoto.image;
        if (idCardImage) {
            idCardImage = [GDCACommonFunction compressImage:idCardImage toSize:CGSizeMake(idCardImage.size.width/1.5, idCardImage.size.height/1.5)];
        }
        NSData *imgData = UIImageJPEGRepresentation(idCardImage, 0.8);
        NSString *photoData = [imgData base64EncodedStringWithOptions:0];
        
        [self identifierType:1 attachment:photoData];
    }
}

//弹窗
- (void)alertView:(NSString *)title {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:title preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    
    [alertController addAction:sureAction];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self presentViewController:alertController animated:YES completion:nil];
    });
}



@end
