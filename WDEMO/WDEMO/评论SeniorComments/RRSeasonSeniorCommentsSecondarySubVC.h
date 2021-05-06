//
//  RRSeasonSeniorCommentsSecondarySubVC.h
//  PUClient
//
//  Created by rrtv on 2021/3/24.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "BaseViewController.h"
#import "RRSeniorCommentsModel.h"
#import "RRSeniorCommentsModel.h"

NS_ASSUME_NONNULL_BEGIN
@protocol RRSeasonSeniorCommentsSecondarySubVCDelegate;
//高级评论 二级页面
@interface RRSeasonSeniorCommentsSecondarySubVC : BaseViewController
@property (nonatomic, copy) NSString *commentId;
@property (nonatomic, strong) RRSeniorCommentsModel *commentModel;
@property (nonatomic, strong) RRSeniorCommentsModel *__nullable replyModel;
@property (nonatomic, weak) id <RRSeasonSeniorCommentsSecondarySubVCDelegate> delegate;

@property (nonatomic, weak) UIViewController *fatherVC;

//@property (nonatomic, weak) UIViewController<RRNavScrollViewControllerDelegate> *fatherVC;
- (instancetype)initWithIsHalf:(BOOL)isHalf;
- (void)show;
- (void)dismiss;
@end

@protocol RRSeasonSeniorCommentsSecondarySubVCDelegate <NSObject>

@optional
-(void)seasonSeniorCommentsSecondarySubVC:(RRSeasonSeniorCommentsSecondarySubVC *)vc deleteModel:(RRSeniorCommentsModel *)deleteModel;
 
@end
NS_ASSUME_NONNULL_END
