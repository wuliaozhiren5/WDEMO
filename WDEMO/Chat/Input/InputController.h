 /******************************************************************************
  *
  * 本文件声明了实现输入区的相关组件。
  * 输入区即包括表情视图输入区（TUIFaceView+TUIMoreView）、“更多”功能区（TUIMoreView）和文本输入区（TUIInputBar）。
  * 本文件包含TInputControllerDelegate 协议和 TInputController 类。
  * 在输入条（TUIInputBar）中，提供了表情、语音、更多视图的按钮响应委托。
  * 而在本类中，将 InputBar 与上述三个视图实际结合，实现了各个视图的显示与切换的逻辑。
  *
  ******************************************************************************/
#import <UIKit/UIKit.h>
#import "InputBar.h"
#import "FaceView.h"
#import "ChatMessageDataModel.h"

@class InputController;
/**
 *  控制器的回调委托。
 *  通常由各个视图（InputBar、MoreView 等）中的回调函数进一步调用。实现功能的分层与逐步细化。
 */
@protocol TInputControllerDelegate <NSObject>

/**
 *  当前 InputController 高度改变时的回调。
 *  一般由 InputBar 中的高度改变回调进一步调用。
 *  您可以通过该回调实现：根据改变的高度调整控制器内各个组件的 UI 布局。
 *
 *  @param  inputController 委托者，当前参与交互的视图控制器。
 *  @param height 改变高度的具体数值（偏移量）。
 */
- (void)inputController:(InputController *)inputController didChangeHeight:(CGFloat)height;

/**
 *  当前 InputCOntroller 发送信息时的回调。
 *  一般由 InputBar 中的发送信息回调进一步调用。
 *  您可以通过该回调实现：将该信息（TUIMessageCellData）执行发送。
 *  TUIKit 的默认实现中，在本回调的实现函数中调用了 TUIMessageController 中的已经封装好的 sendMessage 函数进行消息发送。
 *
 *  @param  inputController 委托者，当前参与交互的视图控制器。
 *  @param msg 当前控制器所获取并准备发送的消息。
 */
- (void)inputController:(InputController *)inputController didSendMessage:(ChatMessageDataModel *)msg;

/**
*  点击Face按钮时候  外部需要处理的事件
*/
- (void)inputControllerDidTouchFace:(InputController *)inputController;

/**
*  点击TextView按钮时候  外部需要处理的事件
*/
- (void)inputControllerDidTouchTextView:(InputController *)inputController;

/**
*  点击PlayList按钮时候  外部需要处理的事件
*/
- (void)inputControllerDidTouchPlayList:(InputController *)inputController;

@end

/////////////////////////////////////////////////////////////////////////////////
//
//                         TInputControllerDelegate
//
/////////////////////////////////////////////////////////////////////////////////

/**
 * 【模块名称】TUIInputController
 * 【功能说明】TUI 输入控制器，实现了输入条中进一步的业务逻辑。
 *  在输入条（TUIInputBar）中，提供了表情、语音、更多视图的按钮和响应回调。
 *  而在本类中，将 InputBar 与上述三个视图实际结合，实现了各个视图的显示与切换的逻辑。
 */
@interface InputController : UIViewController

/**
 *  输入条
 *  输入条中包含文本输入框、语音按钮、“更多”按钮、表情按钮等一系列交互组件，并提供了这些组件的对应回调委托。
 *  详细信息请参考 Section\Chat\Input\TUIInputBar.h
 */
@property (nonatomic, strong) InputBar *inputBar;

///**
// *  表情视图
// *  表情视图一般在点击“笑脸”按钮后浮现。负责显示各个表情分组，与分组内表情的具体信息。
// *  详细信息请参考 Section\Chat\TUIFaceView.h
// */
@property (nonatomic, strong) FaceView *faceView;

/**
 *  实现 TInputControllerDelegate 协议的委托。
 */
@property (nonatomic, weak) id<TInputControllerDelegate> delegate;

/**
 *  重置当前输入控制器。
 *  如果当前有表情视图或者“更多“视图正在显示，则收起相应视图，并将当前状态设置为 Input_Status_Input。
 *  即无论当前 InputController 处于何种状态，都将其重置为初始化后的状态。
 */
- (void)reset;
@end
