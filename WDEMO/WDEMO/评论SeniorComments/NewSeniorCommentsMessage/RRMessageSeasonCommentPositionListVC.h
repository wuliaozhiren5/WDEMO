//
//  RRMessageSeasonCommentPositionListVC.h
//  PUClient
//
//  Created by rrtv on 2021/6/1.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "BaseViewController.h"
//#import "RRSeasonSeniorCommentsInputBar.h"
#import "RRSeasonSeniorCommentsSecondaryInputBar.h"
//#import "RRCommentService.h"
#import "RRSeasonSeniorCommentsHearder.h"
//#import "RRSeasonSeniorCommentsNoReplyListCell.h"
#import "RRSeasonSeniorCommentsSecondaryReplyCell.h"
//#import "RRSeniorCommentsReplyListApi.h"
//#import "RRImageGetTokenApi.h"
//#import "RRImageUploadManager.h"
//#import "RRCommentCreateApi.h"
//#import "RRSeniorCommentCreateApi.h"
//#import "NSString+ZY.h"
//#import "RRCommentPositionListApi.h"
#import "RRSeniorCommentsModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RRMessageSeasonCommentPositionListVC : BaseViewController

@property (nonatomic, strong) RRSeniorCommentsModel *commentModel;
//@property (nonatomic, strong) RRCommentService *service;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) RRSeasonSeniorCommentsSecondaryInputBar *bottomView;

@property (nonatomic, strong) UIView *header;
@property (nonatomic, strong) UILabel *headerLab;

//@property (nonatomic, strong) RRDataSource *dataSource;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) NSInteger rows;

@property (nonatomic, assign) BOOL isReplying;

//展示全部文字
@property (nonatomic, assign) BOOL isShowMore;

@property (nonatomic, copy) NSString *commentId;//父id
@property (nonatomic, copy) NSString *__nullable replyId;  //子id

/**
剧集  season,
视频 video
*/
@property (nonatomic,copy)NSString *targetType; //类型
@property (nonatomic,copy)NSString *targetTypeId;//跳转id

@property (nonatomic, assign) BOOL isNew;

@property (nonatomic, copy) NSMutableArray *data;//数据

@end


NS_ASSUME_NONNULL_END
