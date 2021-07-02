//
//  MyReply.h
//  PUClient
//
//  Created by RRLhy on 15/9/18.
//  Copyright © 2015年 RRLhy. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AuthorModel.h"
@class targetModel;
//我的回复
@interface MyReply : NSObject

@property (nonatomic,strong)AuthorModel * author;

@property (nonatomic,copy)NSString * content;

@property (nonatomic,assign)NSTimeInterval createTime;

@property (nonatomic,copy)NSString * ID;

@property (nonatomic,copy)NSString * type;

@property (nonatomic,copy)NSDictionary * oriView;//

@property (nonatomic,copy)NSString * actionType;

@property (nonatomic,strong)targetModel *target;//类型

@property (nonatomic, strong)NSArray * results;

@property (nonatomic, copy) NSString *targetLink;

//parentId 父评论id
@property (nonatomic, copy) NSString *parentId;

//actionId 评论id
@property (nonatomic, copy) NSString *actionId;

@property (nonatomic, copy) NSString *envImgUrl;

//赞 评论id
@property (nonatomic, copy) NSString *likeCommentId;

//赞 父评论id
@property (nonatomic, copy) NSString *likeParentCommentId;

@property (nonatomic, copy) NSString *reply2UserId;

@property (nonatomic, copy) NSString *reply2NickName;

//@property (nonatomic, copy) NSString *reply2Content;

@property (nonatomic, strong) NSArray *commentImages;

@end


@interface targetModel : NSObject
//seasonid
//videoid
@property (nonatomic,copy)NSString * ID;
/**
剧集  season,drama
视频 video
*/
@property (nonatomic,copy)NSString * targetType; //类型

@property (nonatomic,copy)NSString * title;

@property (nonatomic,copy)NSString * comefrom;

@end

@interface MyReplyListModel : NSObject

@property (nonatomic, assign)NSInteger total;

@property (nonatomic, assign)NSInteger currentPage;

@property (nonatomic, copy)NSArray<MyReply *> *results;

@property (nonatomic, assign)BOOL isEnd;

@end
