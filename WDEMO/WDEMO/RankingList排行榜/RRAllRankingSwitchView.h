//
//  RRAllRankingSwitchView.h
//  NJVideo
//
//  Created by rrtv on 2021/12/3.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol RRAllRankingSwitchViewDelegate <NSObject>
//点击
- (void)clickAllRankingSwitchViewIndex:(NSInteger)index;
 
- (void)hiddenAllRankingSwitchView;
@end

@interface RRAllRankingSwitchView : UIView

@property (nonatomic, assign) NSInteger selectIndex;

@property (nonatomic, copy) NSArray *tagArr;

@property (nonatomic, weak) id<RRAllRankingSwitchViewDelegate> delegate;

//-(void)showInView:(UIView *)view;
//-(void)show;
- (void)hidden;

@end

NS_ASSUME_NONNULL_END
