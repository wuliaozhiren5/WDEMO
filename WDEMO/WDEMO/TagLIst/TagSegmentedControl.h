//
//  TagSegmentedControl.h
//  gaodengDemo
//
//  Created by Sun on 2020/7/11.
//  Copyright © 2020 Sun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol TagSegmentedControlDelegate;

@interface TagSegmentedControl : UIView
//列表
@property(copy , nonatomic)NSArray *tagArr;

@property(assign , nonatomic)NSInteger index;

@property(weak , nonatomic)id<TagSegmentedControlDelegate> delegate;


@property(assign , nonatomic)UIColor *textHighlightColor;
@property(assign , nonatomic)UIColor *textDefaultColor;
@property(assign , nonatomic)UIColor *textHighBackgroundColor;

@end

@protocol TagSegmentedControlDelegate <NSObject>

-(void)tagSegmentedControl:(TagSegmentedControl *)tagSegmentedControl
      didSelectItemAtIndex:(NSInteger)index;

@end


NS_ASSUME_NONNULL_END
