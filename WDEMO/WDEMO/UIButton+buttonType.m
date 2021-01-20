//
//  UIButton+button.m
//  Client
//
//  Created by liurong on 2020/5/11.
//  Copyright © 2020 RRMJ. All rights reserved.
//

#import "UIButton+buttonType.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "ACMacros.h"
#import "UIImage+GradientColor.h"//渐变色
#import "UIColor+TUIDarkMode.h"

@implementation UIButton (buttonType)

-(void)setButtonDisableType:(RRButtonDarkType)buttonDarkType{
    
    [RACObserve(self, enabled) subscribeNext:^(id  _Nullable x) {
        [self changeButtonType:buttonDarkType];
    }];
    [[self rac_signalForSelector:@selector(traitCollectionDidChange:)] subscribeNext:^(id  _Nullable x) {
        [self changeButtonType:buttonDarkType];
    }];
    
}

- (void)changeButtonType:(RRButtonDarkType)buttonDarkType{
    switch (buttonDarkType) {
        case RRButtonDarkTypeTitleWhiteGradient:
            [self setTitleWhiteGradient];
            break;
        case RRButtonDarkTypTitle333333:
            [self setTitle333333];
            break;
        case RRButtonDarkTypeTitleWhite:
            [self setTitleWhite];
            break;
        case RRButtonDarkTypeTitle919699:
            [self setTitle919699];
            break;
            
        default:
            break;
    }
    
}


-(void)setTitle333333{
    
    //    self.backgroundColor = kCOLOR_dynamicProvider_333333_DADBDC;
    //    [self setTitleColor:kCOLOR_dynamicProvider_F2F4F5_2E2E2E forState:UIControlStateNormal];
    
}

-(void)setTitle919699{
    //    self.backgroundColor = kCOLOR_dynamicProvider_F2F4F5_2E2E2E;
    //    if (self.enabled) {
    //
    //        [self setTitleColor:kCOLOR_919699 forState:UIControlStateNormal];
    //
    //    }else{//禁止的时候动态变化
    //
    //        [self setTitleColor:kCOLOR_dynamicProvider_DADBDC forState:UIControlStateNormal];
    //
    //    }
    
}

-(void)setTitleWhite{
    if (self.enabled) {
        
        [self setTitleColor:kCOLOR_FFFFFF forState:UIControlStateNormal];
        self.backgroundColor = kCOLOR_00BBFF;
        
    }else{//禁止的时候动态变化
        
        //        self.backgroundColor = kCOLOR_dynamicProvider_DADBDC;
        //        [self setTitleColor:kCOLOR_dynamicProvider_FFFFFF_2C2C2C forState:UIControlStateNormal];
        
        //修改
        self.backgroundColor = kCOLOR_DADBDC;
        [self setTitleColor:kCOLOR_FFFFFF forState:UIControlStateNormal];
    }
    
}

- (void)setTitleWhiteGradient{
    if (self.enabled) {
        [self setSelectGradientColor];
        [self setTitleColor:kCOLOR_FFFFFF forState:UIControlStateNormal];
    }else{
        //        [self setDisabledGradientBackColor];
        //        [self setTitleColor:kCOLOR_dynamicProvider_FFFFFF_2C2C2C forState:UIControlStateNormal];
        
        //修改
        [self setDisabledGradientBackColor];
        [self setTitleColor:kCOLOR_DADBDC forState:UIControlStateNormal];
    }
}



- (void)setDisabledGradientBackColor {
    //    UIColor *topColor = kCOLOR_CACBCC;
    //    UIColor *bottomColor = kCOLOR_DADBDC;
    //    [RACObserve(self, frame) subscribeNext:^(id  _Nullable x) {
    //            UIImage *bgImg = [UIImage gradientColorImageFromColors:@[topColor, bottomColor] gradientType:GradientTypeLeftToRight imgSize:self.frame.size];
    //            self.backgroundColor = [UIColor colorWithPatternImage:bgImg];
    //    }];
    
    
    //修改 wwc
    UIColor *topColor  = [UIColor d_colorWithColorLight:kCOLOR_CACBCC dark:kCOLOR_414141];
    UIColor *bottomColor = [UIColor d_colorWithColorLight:kCOLOR_DADBDC dark:kCOLOR_212121];
    UIImage *bgImg = [UIImage gradientColorImageFromColors:@[topColor, bottomColor] gradientType:GradientTypeLeftToRight imgSize:self.frame.size];
    self.backgroundColor = [UIColor colorWithPatternImage:bgImg];
}

- (void)setSelectGradientColor {
    //    UIColor *topColor = kCOLOR_00D5FF;
    //    UIColor *bottomColor = kCOLOR_00BBFF;
    //    [RACObserve(self, frame) subscribeNext:^(id  _Nullable x) {
    //        UIImage *bgImg = [UIImage gradientColorImageFromColors:@[topColor, bottomColor] gradientType:GradientTypeLeftToRight imgSize:self.frame.size];
    //        self.backgroundColor = [UIColor colorWithPatternImage:bgImg];
    //    }];
    
    //修改 wwc
    UIColor *topColor  = [UIColor d_colorWithColorLight:kCOLOR_00D5FF dark:kCOLOR_00D5FF];
    UIColor *bottomColor = [UIColor d_colorWithColorLight:kCOLOR_00BBFF dark:kCOLOR_00BBFF];
    UIImage *bgImg = [UIImage gradientColorImageFromColors:@[topColor, bottomColor] gradientType:GradientTypeLeftToRight imgSize:self.frame.size];
    self.backgroundColor = [UIColor colorWithPatternImage:bgImg];
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection{
    [super traitCollectionDidChange: previousTraitCollection];
    if (@available(iOS 13.0, *)) {
        if(UITraitCollection.currentTraitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
            //            [self.titleLabel setText:@"DarkMode"];
            NSLog(@"暗黑模式");
            NSLog(@"DarkMode");
        } else {
            //            [self.titleLabel setText:@"LightMode"];
            NSLog(@"正常模式");
            NSLog(@"LightMode");
            
        }
    }
}
@end
