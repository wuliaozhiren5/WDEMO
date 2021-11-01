//
//  RRTopBarUserView.h
//  NJVideo
//
//  Created by rrtv on 2021/8/24.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RRTopBarUserView : UIView
@property (nonatomic, strong) UIImageView *avaterImgV;//头像
@property (nonatomic, strong) UILabel *nickNameLab;//昵称
@property (nonatomic, strong) UIImageView *vipImgV;//vip图片
//用于跳转
@property (nonatomic, copy)   NSString *userId;

/// Description
/// @param headImgUrl 头像
/// @param nickName 昵称
/// @param isVip 是否vip
/// @param vipLeveL vip等级
/// @param isExpired vip是否过期
- (void)headImgUrl:(NSString *)headImgUrl
          nickName:(NSString *)nickName
             isVip:(BOOL)isVip
          vipLeveL:(NSInteger)vipLeveL
         isExpired:(BOOL)isExpired;
@end

NS_ASSUME_NONNULL_END
