//
//  UIButton+button.h
//  PUClient
//
//  Created by liurong on 2020/5/11.
//  Copyright © 2020 RRMJ. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger,  RRButtonDarkType) {
    RRButtonDarkTypeTitleWhiteGradient = 1,
    RRButtonDarkTypTitle333333 ,
    RRButtonDarkTypeTitleWhite ,
    RRButtonDarkTypeTitle919699,
};

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (buttonType)

/// 设置按钮禁用类型
/// 深色模式按钮渐变图片
-(void)setButtonDisableType:(RRButtonDarkType)buttonDarkType;

@end

NS_ASSUME_NONNULL_END
