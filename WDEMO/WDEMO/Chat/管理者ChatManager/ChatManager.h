//
//  ChatManager.h
//  PUClient
//
//  Created by rrtv on 2020/9/7.
//  Copyright © 2020 RRMJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChatController.h"
#import "FullScreenChatController.h"
//#import "RRIMMessageElem.h"
#import "ChatMessageDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChatManager : NSObject

@property (nonatomic, copy, readonly) NSArray *msgsArray;

@property (nonatomic, copy, readonly) NSArray *membersArray;

@property (nonatomic, strong) ChatController *halfChat;
 
@property (nonatomic, strong) FullScreenChatController *fullChat;

////房间信息
//@property (nonatomic, strong) RRSeriesLiveRoomModel *roomModel;

@property (nonatomic, assign) NSInteger unreadMessageCount;

@property (nonatomic, assign) BOOL resetUserListNextTime;
/**
*  编辑状态 是否正在编辑
*/
@property(nonatomic, assign, getter=isInputEditing) BOOL inputEditing;

- (void)sendMessages:(NSArray<ChatMessageDataModel*> *)msgArray;
//成员
//- (void)setMembers:(NSArray<RRIMUser*> *)userArray;
//- (void)addMembers:(NSArray<RRIMUser*> *)userArray;
//- (void)deleteMembers:(NSArray<RRIMUser*> *)userArray;

//标记为已读状态
- (void)readMessage;
//移除全屏聊天
- (void)removeFullChat;
//手动隐藏键盘
- (void)chatControllerKeyboardReset;

- (void)createHalfChat;

- (void)createFullChat;
@end

NS_ASSUME_NONNULL_END
