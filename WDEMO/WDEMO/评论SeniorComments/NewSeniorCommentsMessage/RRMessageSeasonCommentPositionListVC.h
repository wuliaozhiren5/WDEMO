//
//  RRMessageSeasonCommentPositionListVC.h
//  PUClient
//
//  Created by rrtv on 2021/6/1.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "BaseViewController.h"
#import "RRSeasonSeniorCommentsPraiseBtnInputBar.h"
//#import "RRCommentService.h"
#import "RRSeasonSeniorCommentsHearder.h"
#import "RRSeasonSeniorCommentsTextImageCell.h"
//#import "RRSeniorCommentsReplyListApi.h"
//#import "RRImageGetTokenApi.h"
//#import "RRImageUploadManager.h"
//#import "RRCommentCreateApi.h"
//#import "RRSeniorCommentCreateApi.h"
//#import "NSString+ZY.h"
//#import "RRCommentPositionListApi.h"
#import "RRSeniorCommentsModel.h"
#import "RRCommentPositionListModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface RRMessageSeasonCommentPositionListVC : BaseViewController

@property (nonatomic, strong) RRSeniorCommentsModel *commentModel;
//@property (nonatomic, strong) RRCommentService *service;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) RRSeasonSeniorCommentsPraiseBtnInputBar *bottomView;

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
类型
剧集老 season
剧集新 drama
视频 video
片单 album
影评 drama_comment
*/
@property (nonatomic,copy)NSString *targetType; //类型
@property (nonatomic,copy)NSString *targetTypeId;//跳转id

@property (nonatomic, assign) BOOL isNew;

@property (nonatomic, copy) NSMutableArray *data;//数据
@end


NS_ASSUME_NONNULL_END
