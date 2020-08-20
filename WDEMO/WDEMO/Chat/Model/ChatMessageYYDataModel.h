//
//  ChatMessageYYDataModel.h
//  WDEMO
//
//  Created by rrtv on 2020/7/31.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "ChatMessageDataModel.h"
#import <YYKit/YYKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ChatMessageDataModelClickNickName)(void);

@interface ChatMessageYYDataModel : ChatMessageDataModel

@property (nonatomic, strong) NSAttributedString *yyAttributedString;

@property (nonatomic, strong) YYTextLayout *layout;

@property (nonatomic, copy) ChatMessageDataModelClickNickName clickNickName;


/*
//TextFace 文字表情消息
@property (nonatomic, strong) NSMutableAttributedString *yyVipStr;
@property (nonatomic, strong) NSMutableAttributedString *yyRoomHostStr;
@property (nonatomic, strong) NSMutableAttributedString *yyNickNameStr;
@property (nonatomic, strong) NSMutableAttributedString *yyTextFaceStr;
@property (nonatomic, strong) NSMutableAttributedString *yyColonStr;
@property (nonatomic, strong) NSMutableAttributedString *yySpaceStr;
 
//Tip 公告
@property (nonatomic, strong) NSMutableAttributedString *yyTipStr;

//Enter 进入房间消息
//@property (nonatomic, strong) NSMutableAttributedString *yyNickNameStr;
@property (nonatomic, strong) NSMutableAttributedString *yyEnterStr;
*/

@end

NS_ASSUME_NONNULL_END
