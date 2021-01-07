//
//  ScoreView.h
//  WDEMO
//
//  Created by rrtv on 2020/12/18.
//  Copyright © 2020 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ScoreView : UIView
/// Description
/// @param count 个数
/// @param width 宽
/// @param height 高
/// @param spacing 间距
- (void)createScoreViewWithCount:(NSInteger)count
                           width:(CGFloat)width
                          height:(CGFloat)height
                         spacing:(CGFloat)spacing;
- (void)score:(CGFloat)score;
@end

/// 组装成了带文字样式的
@interface ScoreTitleView : ScoreView
/// Description
/// @param titltFont 字体
/// @param titltColor 颜色
/// @param titltSpacing 与星星的间距
- (void)createScoreViewTitleWithTitltFont:(UIFont *)titltFont
                               titltColor:(UIColor *)titltColor
                             titltSpacing:(CGFloat)titltSpacing;
- (void)scoreTitleStr:(NSString *)titleStr;
@end

NS_ASSUME_NONNULL_END
