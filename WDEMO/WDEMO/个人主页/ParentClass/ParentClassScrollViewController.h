//
//  ParentClassScrollViewController.h
//  WDEMO
//
//  Created by rrtv on 2021/2/19.
//  Copyright © 2021 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol scrollDelegate <NSObject>
//切换tab
-(void)scrollViewChangeTab:(UIScrollView *)scrollView;
//滚动
-(void)scrollDidScroll:(UIScrollView *)scrollView; 
@end

@interface ParentClassScrollViewController : UIViewController
@property(strong, nonatomic)UIScrollView *scrollView; 
@property(nonatomic,weak)id<scrollDelegate>delegate;

@end
NS_ASSUME_NONNULL_END
