//
//  FullScreenChatController.h
//  PUClient
//
//  Created by rrtv on 2020/9/7.
//  Copyright © 2020 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FullScreenMessageController.h"
#import "ChatController.h"
#import "FullScreenInputController.h"
#import "FullScreenChatBottomInputBarViewController.h"


NS_ASSUME_NONNULL_BEGIN

@interface FullScreenChatController : UIViewController

@property(nonatomic, strong) FullScreenMessageController *messageController;

@property(nonatomic, strong) FullScreenInputController *inputController;

@property (nonatomic, strong) FullScreenChatBottomInputBarViewController *chatBottomInputBarViewController;

@property (nonatomic, weak) id<ChatControllerDelegate> delegate;

/**
*  编辑状态 是否正在编辑
*/
@property(nonatomic, assign, getter=isInputEditing) BOOL inputEditing;

- (instancetype)initWithMessages:(NSArray *)messages;

//出场动画
- (void)showAnimation;

//手动隐藏键盘
- (void)keyboardReset;

/**
 *  发送自定义的个性化消息
 *
 */
- (void)sendMessage:(ChatMessageDataModel *)msg;

@end

NS_ASSUME_NONNULL_END
