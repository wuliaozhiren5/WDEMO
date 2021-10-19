//
//  RRSeasonSeniorCommentsDetailVC.h
//  PUClient
//
//  Created by WDEMO on 2021/3/24.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "BaseViewController.h"
//#import "RRNavScrollViewControllerDelegate.h"
#import "RRSeniorCommentsModel.h"

NS_ASSUME_NONNULL_BEGIN
@protocol RRSeasonSeniorCommentsDetailVCDelegate;

//高级评论 二级页面
@interface RRSeasonSeniorCommentsDetailVC : BaseViewController
//@property (nonatomic, copy) NSString *commentId;
@property (nonatomic, copy) NSString * __nullable replyId;  //子id
@property (nonatomic, strong) RRSeniorCommentsModel *commentModel;
//@property (nonatomic, strong) RRSeniorCommentsModel *__nullable replyModel;
@property (nonatomic, weak) id <RRSeasonSeniorCommentsDetailVCDelegate> delegate;

//@property (nonatomic, weak) UIViewController<RRNavScrollViewControllerDelegate> *fatherVC;

//展示全部文字
@property (nonatomic, assign) BOOL isShowMore;

- (instancetype)initWithIsHalf:(BOOL)isHalf;
- (instancetype)initWithIsHalf:(BOOL)isHalf
                          type:(NSString *)type;
- (void)show;
- (void)dismiss;
@end

@protocol RRSeasonSeniorCommentsDetailVCDelegate <NSObject>

@optional
- (void)seasonSeniorCommentsSecondarySubVC:(RRSeasonSeniorCommentsDetailVC *)vc deleteModel:(RRSeniorCommentsModel *)deleteModel;
- (void)closeSeasonSeniorCommentsSecondarySubVC:(RRSeasonSeniorCommentsDetailVC *)vc;
@end
NS_ASSUME_NONNULL_END
