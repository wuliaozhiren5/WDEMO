/******************************************************************************
 *
 *  本文件声明了用于实现消息收发逻辑的控制器类。
 *  消息控制器负责统一显示您发送/收到的消息，同时在您对这些消息进行交互（点击/长按等）时提供响应回调。
 *  消息控制器还负责对您发送的消息进行统一的数据处理，使其变为可以通过 IM SDK 发送的数据格式并进行发送。
 *  也就是说，当您使用本控制器时，您可以省去很大部分的数据处理上的工作，从而能够更快捷、更方便的接入 IM SDK。
 *
 *  TMessageControllerDelegate 协议和 TUIMessageController 类。
 *  TUIMessageController 是聊天界面的核心类，负责聊天界面大部分核心业务逻辑的处理与运算。
 *  该类的详细属性与功能，请参展本文件中 TUIMessageController 的具体声明。
 *
 ******************************************************************************/
#import <UIKit/UIKit.h>
#import "ChatMessageData.h"
#import "ChatMemberListView.h"

@class MessageController;


///////////////////////////////////////////////////////////////////////////////////
////
////                         TMessageControllerDelegate
////
///////////////////////////////////////////////////////////////////////////////////
//
///**
// *  我们不建议您直接修改 MessageController 中的回调委托。
// *  MessageController 的回调委托在 ChatController 中实现，负责大部分核心功能。如果您对此修改，可能会对一系列回调委托的调用关系造成破坏。
// *  如果您需要实现 onNewMessage、onShowMessageData 的回调，您可以参照 Section\Chat\TUIChatController.h 中的链接与注释进行调用并实现自定义消息处理。
// */
@protocol TMessageControllerDelegate <NSObject>

/**
 *  控制器点击回调
 *  您可以通过该回调实现：重置 InputControoler，收起键盘。
 *
 *  @param controller 委托者，消息控制器
 */
- (void)didTapInMessageController:(MessageController *)controller;

@end

/////////////////////////////////////////////////////////////////////////////////
//
//                         TUIMessageController
//
/////////////////////////////////////////////////////////////////////////////////

/** 腾讯云
 * 【模块名称】TUIMessageController
 * 【功能说明】消息控制器，负责实现消息的接收、发送、显示等一系列业务逻辑。
 *  本类提供了接收/显示新消息、显示/隐藏菜单、点击消息头像等交互操作的回调接口。
 *  同时本类提供了图像、视频、文件信息的发送功能，直接整合调用了 IM SDK 实现发送功能。
 */
@interface MessageController : UITableViewController
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
- (void)sendMessage:(ChatMessageData *)msg;

@end
