//
//  RRChatController.h
//  WDEMO
//
//  Created by rrtv on 2020/7/22.
//  Copyright © 2020 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InputController.h"
#import "MessageController.h"
#import "ChatMessageData.h"

NS_ASSUME_NONNULL_BEGIN
@class ChatController;


/**
 *  ChatControllerDelegate 协议
 *  此协议旨在帮助开发者根据自身需求实现自定义消息。
 *  自定义消息的的具体实现方法，请参照链接
 */
@protocol TUIChatControllerDelegate <NSObject>

/**
 *  发送新消息时的回调
 *
 *  @param controller 委托者，当前聊天控制器。
 *  @param msgCellData TUIMessageCellData 即将发送的 msgCellData 。
 */
 
- (void)chatController:(ChatController *)controller didSendMessage:(ChatMessageData *)msgCellData;

@end



@interface ChatController : UIViewController

//********************************
//@property TUnReadView *unRead;
//********************************

/**
 *  TUIKit 聊天消息控制器
 *  负责消息气泡的展示，同时负责响应用户对于消息气泡的交互，比如：点击消息发送者头像、轻点消息、长按消息等操作。
 *  聊天消息控制器的详细信息请参考 Section\Chat\TUIMessageController.h
 */
@property MessageController *messageController;

/**
 *  TUIKit 信息输入控制器。
 *  负责接收用户输入，同时显示“+”按钮与语音输入按钮、表情按钮等。
 *  同时 TUIInputController 整合了消息的发送功能，您可以直接使用 TUIInputController 进行消息的输入采集与发送。
 *  信息输入控制器的详细信息请参考 Section\Chat\Input\TUIInputController.h
 */
@property InputController *inputController;

/**
 *  被委托类，负责实现并执行 TUIChatControllerDelegate 的委托函数
 */
@property (weak) id<TUIChatControllerDelegate> delegate;


/**
 *  发送自定义的个性化消息
 *
 */

- (void)sendMessage:(ChatMessageData *)msg;



@end

NS_ASSUME_NONNULL_END
