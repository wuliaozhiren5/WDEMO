//
//  RRVideoCommentsVC.h
//  PPVideo
//
//  Created by rrtv on 2022/1/25.
//  Copyright © 2022 RRMJ. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN
@protocol RRVideoCommentsVCDelegate;

@interface RRVideoCommentsVC : BaseViewController

@property (nonatomic, copy) NSString *videoId;

@property (nonatomic, weak) id <RRVideoCommentsVCDelegate> delegate;

- (instancetype)initWithIsHalf:(BOOL)isHalf;

- (instancetype)initWithIsHalf:(BOOL)isHalf
                          type:(NSString *)type;
//获取条数
- (NSInteger)getTotal;

@end

@protocol RRVideoCommentsVCDelegate <NSObject>

@optional
//关闭页面
- (void)closeVideoCommentsVC:(RRVideoCommentsVC *)vc;
@end
NS_ASSUME_NONNULL_END
