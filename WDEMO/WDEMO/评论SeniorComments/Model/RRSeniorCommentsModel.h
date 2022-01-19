//
//  RRSeniorCommentsModel.h
//  PUClient
//
//  Created by WDEMO on 2021/4/13.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AuthorModel.h"
#import "RRHomeChannelModel.h"

@class RRSeniorCommentsImageModel;
@class RRTalkModel;

@class RRSeniorCommentsImageModel;
@class RRTalkModel;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - RRSeniorCommentsModel 评论Model
@interface RRSeniorCommentsModel : NSObject

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *type;//DRAMA 剧；VIDEO 视频；DRAMA_COMMENT 影评

@property (nonatomic, copy) NSString *typeId;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, assign) NSTimeInterval createTime;//接口下发的毫秒ms

@property (nonatomic, assign) NSTimeInterval updateTime;

@property (nonatomic, assign) BOOL liked;

@property (nonatomic, assign) NSInteger likeCount; //点赞数

@property (nonatomic, assign) NSInteger realLikeCount; //真实点赞数

@property (nonatomic, assign) NSInteger replyCount; //回复数

@property (nonatomic, assign) BOOL deleted; //删除标志

@property (nonatomic, assign) BOOL spoiler; //是否剧透

@property (nonatomic, assign) BOOL sticky; //是否置顶

@property (nonatomic, strong) AuthorModel *author; //

//@property (nonatomic, strong) AuthorModel *reply2User; //不用

@property (nonatomic, copy) NSString *authorId;//UseId;

@property (nonatomic, copy) NSString *authorName;//昵称

@property (nonatomic, copy) NSString *reply2UseId;//UseId

@property (nonatomic, copy) NSString *reply2UserName;//昵称

//@property (nonatomic, copy) NSString *reply2Id;//不用

@property (nonatomic, copy) NSArray <RRSeniorCommentsImageModel *>*images; //图片数组

@property (nonatomic, copy)  NSArray <RRSeniorCommentsModel *> *replies;

//影评
@property (nonatomic, assign) CGFloat score; //评分

//关联剧集
@property (nonatomic, strong) RRSeriesItemModel *drama; //剧集信息

//话题列表
@property (nonatomic, copy) NSArray<RRTalkModel *> *talkList;

@end

#pragma mark - RRSeniorCommentsListModel 评论List
@interface RRSeniorCommentsListModel : NSObject

@property (nonatomic, assign) BOOL isEnd;

@property (nonatomic, assign) BOOL end;

@property (nonatomic, assign) NSInteger total;

@property (nonatomic, assign) NSInteger currentPage;

@property (nonatomic, copy) NSArray <RRSeniorCommentsModel *> *content;
@end

#pragma mark - RRSeniorCommentsReplyListModel 回复List
@interface RRSeniorCommentsReplyListModel : NSObject

@property (nonatomic, assign) BOOL isEnd;

@property (nonatomic, assign) BOOL end;

@property (nonatomic, assign) NSInteger total;

@property (nonatomic, assign) NSInteger currentPage;

@property (nonatomic, copy) NSArray <RRSeniorCommentsModel *> *content;
@end

//#pragma mark - RRDramaCommentsListModel 影评Model
//@interface RRDramaCommentsModel : NSObject
//
//@property (nonatomic, copy) NSString *score;//评分
//@end

//#pragma mark - RRDramaCommentsListModel 影评List
//@interface RRDramaCommentsListModel : NSObject
//
//@property (nonatomic, assign) BOOL isEnd;
//
//@property (nonatomic, assign) BOOL end;
//
//@property (nonatomic, assign) NSInteger total;
//
//@property (nonatomic, assign) NSInteger currentPage;
//
//@property (nonatomic, copy) NSArray <RRSeniorCommentsModel *> *content;
//@end

#pragma mark - RRSeniorCommentsImageModel 图片
@interface RRSeniorCommentsImageModel : NSObject

@property (nonatomic, copy) NSString *url;

@property (nonatomic, assign) NSInteger width;

@property (nonatomic, assign) NSInteger height;
@end

#pragma mark - RRTalk 话题
@interface RRTalkModel : NSObject

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) BOOL enable;
@end
NS_ASSUME_NONNULL_END
