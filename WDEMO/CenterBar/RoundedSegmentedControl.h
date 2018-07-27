//
//  RoundedSegmentedControl.h
//  xxx
//
//  Created by xxx on 17/4/18.
//  Copyright © 2017年 developer. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol RoundedSegmentedControlDelegate;

@interface RoundedSegmentedControl : UIView
@property(nonatomic,assign)NSInteger selectIndex;
@property(nonatomic,weak)  id<RoundedSegmentedControlDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame
                   TitleArray:(NSArray *)titleArr
                  NormalColor:(UIColor *)normalColor
             HighlightedColor:(UIColor *)highlightedColor
    MovingViewBackgroundColor:(UIColor *)movingViewbgColor;

@end

@protocol RoundedSegmentedControlDelegate <NSObject>
- (void)roundedSegmentedControl:(RoundedSegmentedControl *)roundedSegmentedControl changeBarIndex:(NSInteger)index;
@end
