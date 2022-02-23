//
//  RRStarScoreView.h
//  NJVideo
//
//  Created by WDEMO on 2020/12/21.
//  Copyright © 2020 RRMJ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RRStarScoreView : UIView
/// Description
/// @param count 个数
/// @param width 宽
/// @param height 高
/// @param spacing 间距
- (void)createScoreViewWithCount:(NSInteger)count
                           width:(CGFloat)width
                          height:(CGFloat)height
                         spacing:(CGFloat)spacing;

/// Description
/// @param count 个数
/// @param width 宽
/// @param height 高
/// @param spacing 间距
/// @param defaultStarImageName 默认心
/// @param halfStarImageName 半心
/// @param fullStarImageName 全心
- (void)createScoreViewWithCount:(NSInteger)count
                           width:(CGFloat)width
                          height:(CGFloat)height
                         spacing:(CGFloat)spacing
            defaultStarImageName:(NSString *)defaultStarImageName
               halfStarImageName:(NSString *)halfStarImageName
               fullStarImageName:(NSString *)fullStarImageName;

///// Description
///// @param count 个数
///// @param width 宽
///// @param height 高
///// @param spacing 间距
///// @param defaultStarImageName 默认心
///// @param halfStarImageName 半心
///// @param fullStarImageName 全心
///// @param block 回调分数 block
//- (void)createScoreViewWithCount:(NSInteger)count
//                           width:(CGFloat)width
//                          height:(CGFloat)height
//                         spacing:(CGFloat)spacing
//            defaultStarImageName:(NSString *)defaultStarImageName
//               halfStarImageName:(NSString *)halfStarImageName
//               fullStarImageName:(NSString *)fullStarImageName withBlock:(void(^)(float score))block;

/// Description
/// @param score  score 0.0-10.0
- (void)score:(CGFloat)score;

/// 影评分数
/// @param score 星级（10分：5星、8分：4星、6分：3星、4分：2星、2分：1星）
- (void)dramaCommentScore:(CGFloat)score;

@end

NS_ASSUME_NONNULL_END
