//
//  RRTalkCommentDetailVC.h
//  NJVideo
//
//  Created by rrtv on 2021/12/13.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN
@protocol RRTalkCommentDetailVCDelegate;

@interface RRTalkCommentDetailVC : BaseViewController
////话题id
//@property (nonatomic, copy) NSString *talkId;
//hot--最热排序  new--最新排序
@property (nonatomic, copy) NSString *orderType;

@property (nonatomic, strong) RRSeniorCommentsModel *commentModel;
 
@property (nonatomic, weak) id <RRTalkCommentDetailVCDelegate> delegate;

@end

@protocol RRTalkCommentDetailVCDelegate <NSObject>
@optional
- (void)talkCommentDetailVC:(RRTalkCommentDetailVC *)vc deleteModel:(RRSeniorCommentsModel *)deleteModel;
- (void)closeTalkCommentDetailVC:(RRTalkCommentDetailVC *)vc;
@end
NS_ASSUME_NONNULL_END
