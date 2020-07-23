//
//  RRInputController.h
//  WDEMO
//
//  Created by rrtv on 2020/7/22.
//  Copyright © 2020 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RRInputController : UIViewController

/**
*  输入条
*  输入条中包含文本输入框、语音按钮、“更多”按钮、表情按钮等一系列交互组件，并提供了这些组件的对应回调委托。
*  详细信息请参考 Section\Chat\Input\TUIInputBar.h
*/
//@property (nonatomic, strong) TUIInputBar *inputBar;

///**
// *  表情视图
// *  表情视图一般在点击“笑脸”按钮后浮现。负责显示各个表情分组，与分组内表情的具体信息。
// *  详细信息请参考 Section\Chat\TUIFaceView.h
// */
//@property (nonatomic, strong) TUIFaceView *faceView;
//
///**
// *  菜单视图
// *  菜单视图位于表情视图下方，负责提供表情分组单元以及发送按钮。
// *  详细信息请参考 Section\Chat\TUIMenuView.h
// */
//@property (nonatomic, strong) TUIMenuView *menuView;
//
///**
// *  更多视图
// *  更多视图一般在点击“更多“按钮（”+“按钮）后浮现，负责显示各个更多单元，比如拍摄、视频、文件、相册等。
// *  详细信息请参考 Section\Chat\TUIMoreView.h
// */
//@property (nonatomic, strong) TUIMoreView *moreView;
//
///**
// *  实现 TInputControllerDelegate 协议的委托。
// */
//@property (nonatomic, weak) id<TInputControllerDelegate> delegate;
//
///**
// *  重置当前输入控制器。
// *  如果当前有表情视图或者“更多“视图正在显示，则收起相应视图，并将当前状态设置为 Input_Status_Input。
// *  即无论当前 InputController 处于何种状态，都将其重置为初始化后的状态。
// */
//- (void)reset;
@end


NS_ASSUME_NONNULL_END
