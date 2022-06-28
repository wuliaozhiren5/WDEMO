//
//  AlertView.h
//  WDEMO
//
//  Created by aimeiju on 2022/6/27.
//  Copyright © 2022 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AlertView : UIView 
//取消
@property (nonatomic, copy) void (^cancel)(void);
//确认
@property (nonatomic, copy) void (^confirm)(void);
-(void)showInView:(UIView *)view;
-(void)show;
-(void)hidden;
@end

NS_ASSUME_NONNULL_END
