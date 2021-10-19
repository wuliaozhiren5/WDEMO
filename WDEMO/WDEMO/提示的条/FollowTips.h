//
//  FollowTips.h
//  WDEMO
//
//  Created by WDEMO on 2020/11/20.
//  Copyright © 2020 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FollowTips : UIView
//@property (nonatomic, strong) PlayerModel *playerModel;
@property (nonatomic, copy) void (^followTipHidden)(void);
-(void)showInView:(UIView *)view;
-(void)show;
-(void)hidden;
////特殊情况：more中的关注按钮 与 提示条同时出现时状态同步
//-(void)followedHidden;
@end

NS_ASSUME_NONNULL_END
