//
//  RRVideoCommentsDetailVC.h
//  PPVideo
//
//  Created by WDEMO on 2022/1/25.
//  Copyright © 2022 RRMJ. All rights reserved.
//

#import "BaseViewController.h"
#import "RRSeniorCommentsModel.h"
NS_ASSUME_NONNULL_BEGIN
@protocol RRVideoCommentsDetailVCDelegate;

@interface RRVideoCommentsDetailVC : BaseViewController
//
@property (nonatomic, copy) NSString * __nullable replyId;  //子id
@property (nonatomic, strong) RRSeniorCommentsModel *commentModel;

@property (nonatomic, weak) id <RRVideoCommentsDetailVCDelegate> delegate;

//展示全部文字
@property (nonatomic, assign) BOOL isShowMore;
- (instancetype)initWithIsHalf:(BOOL)isHalf;

- (instancetype)initWithIsHalf:(BOOL)isHalf
                          type:(NSString *)type;
@end

@protocol RRVideoCommentsDetailVCDelegate <NSObject>

@optional
//删除
- (void)videoCommentsDetailVC:(RRVideoCommentsDetailVC *)vc deleteModel:(RRSeniorCommentsModel *)deleteModel;
//关闭页面
- (void)closeVideoCommentsDetailVC:(RRVideoCommentsDetailVC *)vc;
//关闭all页面
- (void)closeAllVideoCommentsVC:(RRVideoCommentsDetailVC *)vc;
//拖拽
- (void)dragVideoCommentsDetailVCWithFrame:(CGRect)frame;

@end
NS_ASSUME_NONNULL_END
