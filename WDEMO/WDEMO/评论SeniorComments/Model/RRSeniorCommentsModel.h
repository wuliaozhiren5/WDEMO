//
//  RRSeniorCommentsModel.h
//  PUClient
//
//  Created by rrtv on 2021/4/13.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AuthorModel.h"
//@class RRSeniorCommentsReplyModel;
@class RRSeniorCommentsImageModel;

NS_ASSUME_NONNULL_BEGIN
#pragma mark - RRSeniorCommentsModel 评论
//评论
@interface RRSeniorCommentsModel : NSObject

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *type;

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

@property (nonatomic, strong) AuthorModel *author; //

//@property (nonatomic, strong) AuthorModel *reply2User; //不用

@property (nonatomic, copy) NSString *authorId;//UseId;

@property (nonatomic, copy) NSString *authorName;//昵称

@property (nonatomic, copy) NSString *reply2UseId;//UseId

@property (nonatomic, copy) NSString *reply2UserName;//昵称

//@property (nonatomic, copy) NSString *reply2Id;//不用

@property (nonatomic, copy) NSArray <RRSeniorCommentsImageModel *>*images; //图片数组

@property (nonatomic, copy)  NSArray <RRSeniorCommentsModel *> *replies;
@end


@interface RRSeniorCommentsListModel : NSObject

@property (nonatomic, assign) BOOL isEnd;

@property (nonatomic, assign) BOOL end;

@property (nonatomic, assign) NSInteger total;

@property (nonatomic, assign) NSInteger currentPage;

@property (nonatomic, copy) NSArray <RRSeniorCommentsModel *> *content;
@end


#pragma mark - RRSeniorCommentsReplyModel 回复
////回复
//@interface RRSeniorCommentsReplyModel : RRSeniorCommentsModel
//
////@property (nonatomic, copy) NSString *authorId;
//
//@property (nonatomic, copy) NSString *authorName;
//
//@property (nonatomic, copy) NSString *reply2UseId;
//
//@property (nonatomic, copy) NSString *reply2UserName;
//@end
 

@interface RRSeniorCommentsReplyListModel : NSObject

@property (nonatomic, assign) BOOL isEnd;

@property (nonatomic, assign) BOOL end;

@property (nonatomic, assign) NSInteger total;

@property (nonatomic, assign) NSInteger currentPage;

@property (nonatomic, copy) NSArray <RRSeniorCommentsModel *> *content;
@end


//图片
@interface RRSeniorCommentsImageModel : NSObject

@property (nonatomic, copy) NSString *url;

@property (nonatomic, assign) NSInteger width;

@property (nonatomic, assign) NSInteger height;
@end

NS_ASSUME_NONNULL_END
