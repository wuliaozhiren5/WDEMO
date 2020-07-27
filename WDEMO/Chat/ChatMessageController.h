//
//  ChatMessageController.h
//  WDEMO
//
//  Created by rrtv on 2020/7/27.
//  Copyright © 2020 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChatMessageDataModel.h"
#import "ChatMemberListView.h"

NS_ASSUME_NONNULL_BEGIN
@class ChatMessageController;

@protocol TMessageControllerDelegate <NSObject>

/**
 *  控制器点击回调
 *  您可以通过该回调实现：重置 InputControoler，收起键盘。
 *
 *  @param controller 委托者，消息控制器
 */
- (void)didTapInMessageController:(ChatMessageController *)controller;

@end

@interface ChatMessageController : UIViewController

@property (nonatomic, strong) UITableView *tableView;

/**
*  执行 TMessageControllerDelegate 协议的委托
*/
@property (nonatomic, strong) ChatMemberListView *chatMemberListView;

/**
 *  执行 TMessageControllerDelegate 协议的委托
 */
@property (nonatomic, weak) id<TMessageControllerDelegate> delegate;
/**
 *  发送消息
 *  本函数整合调用了 IM SDK 的发送接口，可以轻松接入 SDK。
 *
 *  @param msg 消息单元数据
 */
- (void)sendMessage:(ChatMessageDataModel *)msg;

- (void)scrollToBottom:(BOOL)animate;

@end

NS_ASSUME_NONNULL_END
