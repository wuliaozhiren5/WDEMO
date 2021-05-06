//
//  AuthorModel.h
//  PUClient
//
//  Created by RRLhy on 15/8/13.
//  Copyright (c) 2015年 RRLhy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    RewardVideo = 0,
    RewardInfo,
} RewardType;

@interface AuthorModel : NSObject

@property (nonatomic,assign)NSInteger level;

@property (nonatomic,copy)NSString * nickName;

@property (nonatomic,copy)NSString * headImgUrl;

@property (nonatomic,copy)NSString * ID;

@property (nonatomic,copy)NSString * roleName;

@property (nonatomic,assign)BOOL isConfirmed;

@property (nonatomic,copy)NSString * sign;

/**
 up主名字
 */
@property (nonatomic,copy)NSString * name;

/**
 up主角色 来自哪方
 */
@property (nonatomic,copy)NSString * roleInfo;
@property (nonatomic, copy) NSString *certLabel;

@property (nonatomic,copy)NSString * url;

/**
 //speical  normal cooperative speical
 */
@property (nonatomic,copy)NSString * userIntro;

@property (nonatomic,copy)NSString * headImg;

// Update - 20161205 描述

//@property (nonatomic,copy)NSString * des;
@property (nonatomic,copy)NSString * intro;
@property (nonatomic,copy)NSString * fansCount;
@property (nonatomic,copy)NSString * videoCount;
@property (nonatomic,assign)NSInteger seasonCount;
@property (nonatomic,copy)NSString * subjectCount;
@property (nonatomic,copy)NSString * score;
@property (nonatomic, copy) NSString * videoID;
@property (nonatomic,assign) RewardType type;

@property (nonatomic,assign)BOOL isFocus;
/*
 *合并字幕组view 跟author 统一用author
 */

//@property (nonatomic, strong) NSArray<RRMedalModel*> *medalList;

//@property (nonatomic,strong)UIColor * titleColor;
//@property (nonatomic,strong)UIColor * lastReplyNameColor;
//@property (nonatomic,strong)UIColor * commentNameColor;
//@property (nonatomic,strong)UIColor * topicDetailNameColor;

//3.8.0合辑新增
@property (nonatomic,copy) NSString *avatar;

@end
