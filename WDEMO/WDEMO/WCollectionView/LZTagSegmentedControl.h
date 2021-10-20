//
//  LZTagSegmentedControl.h
//  xxx
//
//  Created by xxx on 2017/10/31.
//  Copyright © 2017年 developer. All rights reserved.
//
@protocol LZTagSegmentedControlDelegate;

#import <UIKit/UIKit.h>

@interface LZTagSegmentedControl : UIView

//列表
@property(copy , nonatomic)NSArray *tagArr;

@property(assign , nonatomic)NSInteger index;

@property(weak , nonatomic)id<LZTagSegmentedControlDelegate> delegate;

@end

@protocol LZTagSegmentedControlDelegate <NSObject>

- (void)tagSegmentedControl:(LZTagSegmentedControl *)tagSegmentedControl
      didSelectItemAtIndex:(NSInteger)index;

@end
