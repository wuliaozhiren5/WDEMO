//
//  PersonalCenterBar.h
//  xxx
//
//  Created by xxx on 16/12/7.
//  Copyright © 2016年 developer. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol PersonalCenterBarDelegate;

@interface PersonalCenterBar : UIView

@property(nonatomic,assign)NSInteger selectIndex;
//小红点
@property(nonatomic,assign)NSInteger tipIndex;
//隐藏小红点
@property(nonatomic,assign)NSInteger hiddenTipIndex;
//底部线
@property(nonatomic,assign)BOOL hiddenLine;

@property(nonatomic,weak)  id<PersonalCenterBarDelegate> delegate;

//- (instancetype)initWithFrame:(CGRect)frame TitleArray:(NSArray *)titleArr NormalColor:(UIColor *)normalColor HighlightedColor:(UIColor *)highlightedColor;

/**
 <#Description#>

 @param frame 大小
 @param titleArr title的数组
 @param normalColor 字体的正常颜色
 @param highlightedColor 字体的高亮颜色
 @param normalTitleFont 正常字体的大小
 @param highlightedTitleFont 高亮字体的大小
 @param moveLineColor 移动横线的颜色
 @param moveLineWidth 移动横线的宽度
 @param bottomLineColor 底部横线的颜色
 @param bottomLineHeight 底部横线的高度
 @return <#return value description#>
 */
- (instancetype)initWithFrame:(CGRect)frame
                   TitleArray:(NSArray *)titleArr
                  NormalColor:(UIColor *)normalColor
             HighlightedColor:(UIColor *)highlightedColor
                NormalTitleFont:(UIFont *)normalTitleFont
           HighlightedTitleFont:(UIFont *)highlightedTitleFont
                MoveLineColor:(UIColor *)moveLineColor
                MoveLineWidth:(CGFloat)moveLineWidth
              BottomLineColor:(UIColor *)bottomLineColor
              BottomLineHeight:(CGFloat)bottomLineHeight;
@end

@protocol PersonalCenterBarDelegate <NSObject>
@optional
- (void)personalCenterBar:(PersonalCenterBar *)personalCenterBar changeBarIndex:(NSInteger)index;

@end
