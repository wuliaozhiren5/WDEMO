//
//  FullScreenChatController.m
//  PUClient
//
//  Created by rrtv on 2020/9/7.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "FullScreenChatController.h"
#import "ChatHeader.h"

#import "ChatMessageDataModel.h"
#import "ChatMessageYYDataModel.h"
#import "EnterMessageDataModel.h"
#import "TipMessageDataModel.h"
#import "FaceMessageDataModel.h"
@interface FullScreenChatController () <TInputControllerDelegate, TMessageControllerDelegate>

@property(nonatomic, assign) BOOL animationFinished;
@property(nonatomic, assign) BOOL isShowMessageInput;
@property (nonatomic, strong) NSArray *messages;
@end

@implementation FullScreenChatController

- (instancetype)initWithMessages:(NSArray *)messages {
    self = [super init];
    if (self) {
        _messages = messages;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.animationFinished = YES;
    self.isShowMessageInput = NO;
    [self setupViews];
    [self.navigationController setNavigationBarHidden:YES animated:NO];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];

}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    //页面消失，最小化，键盘，人员列表问题
    [self didTapInMessageController:nil];
    
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];

}

- (void)setupViews {
    self.view.backgroundColor = [UIColor clearColor];
    UIControl *tapControl = [[UIControl alloc]init];
    tapControl.frame = self.view.bounds;
    [tapControl addTarget:self action:@selector(hiddenView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tapControl];

  
    
    //message
     [self creatMessageController];
//    //input
//    [self creatInputController];
    //底部的inputview:chatBottomInputBar
    [self creatChatBottomInputBarViewController];
    //动画
    [self showAnimation];
//    //制造数据
//    [self createChatData];
}

//隐藏
- (void)hiddenView:(UIControl *)control {
    if (!self.animationFinished) {
        return;
    }
    if (_inputController.isInputEditing) {
        //键盘消失时，处理UI，人员列表
        [_inputController reset];
    } else {
        [self hiddenAnimation];
    }
}

//- (void)createChatData {
//
//    TipMessageDataModel *tipMsgModel = [[TipMessageDataModel alloc]init];
//    tipMsgModel.content = @"欢迎和更多的人一起看剧聊剧！畅所欲言！看剧期间严禁出现违法违规、低俗色情、人身攻击，谈论政治等内容。发布违规言论会在当前直播间被永久禁言，请文明发言哦～";
//    tipMsgModel.type = ChatMessageTypeTip;
//    [_messageController sendMessage:tipMsgModel];
//
//    EnterMessageDataModel *enterMsgModel = [[EnterMessageDataModel alloc]init];
//    enterMsgModel.content = @"一起来看剧啦!";
//    enterMsgModel.type = ChatMessageTypeEnter;
//    [_messageController sendMessage:enterMsgModel];
//
//}

- (void)creatMessageController {
    //message
//    _messageController = [[FullScreenMessageController alloc] init];
    _messageController = [[FullScreenMessageController alloc] initWithMessages:self.messages];
//    _messageController.view.frame = CGRectMake(self.view.frame.size.width - 270, 0, 270, self.view.frame.size.height -  TTextView_Height);
    self.messageController.view.frame = CGRectMake(self.view.frame.size.width, 0, 270, self.view.frame.size.height - TTextView_Height);
    _messageController.delegate = self;
    [self addChildViewController:_messageController];
    [self.view addSubview:_messageController.view];
    _messageController.view.backgroundColor = RGBA(33, 33, 33, 0.85);
}

//底部bar
- (void)creatChatBottomInputBarViewController {
    _chatBottomInputBarViewController = [[FullScreenChatBottomInputBarViewController alloc] init];
    _chatBottomInputBarViewController.view.frame = CGRectMake(self.view.frame.size.width, self.view.frame.size.height - TTextView_Height, 270, TTextView_Height);
    _chatBottomInputBarViewController.view.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    [_chatBottomInputBarViewController fullStyle];
    [self addChildViewController:_chatBottomInputBarViewController];
    [self.view addSubview:_chatBottomInputBarViewController.view];
    
    //    todo  delegate
    [_chatBottomInputBarViewController.faceButton addTarget:self action:@selector(clickBottomBarFaceBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_chatBottomInputBarViewController.textViewBtn addTarget:self action:@selector(clickBottomBarTextViewBtn:) forControlEvents:UIControlEventTouchUpInside];
}

- (FullScreenInputController *)inputController {
    if (!_inputController) {
        _inputController = [[FullScreenInputController alloc] init];
        _inputController.view.frame = CGRectMake(0, 0, Screen_Width, Screen_Height);
        _inputController.view.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
        _inputController.delegate = self;
    }
    return _inputController;
}

//不用了
- (void)creatInputController {
//    //input
//    _inputController = [[FullScreenInputController alloc] init];
////    _inputController.view.frame = CGRectMake(0, self.view.frame.size.height - TTextView_Height, self.view.frame.size.width, TTextView_Height);
//    _inputController.view.frame = CGRectMake(270 + Full_Left_SafeHeight + Full_Right_SafeHeight, self.view.frame.size.height - TTextView_Height, self.view.frame.size.width - Full_Left_SafeHeight - Full_Right_SafeHeight, TTextView_Height);
//    _inputController.view.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
//    _inputController.delegate = self;
//    [self addChildViewController:_inputController];
//    [self.view addSubview:_inputController.view];
////    _inputController.view.backgroundColor = [UIColor grayColor];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (void)hiddenFrame {
    self.messageController.view.origin = CGPointMake(self.view.frame.size.width, 0);
    self.chatBottomInputBarViewController.view.origin = CGPointMake(self.view.frame.size.width, self.view.frame.size.height - TTextView_Height);
}

- (void)showFrame {
    self.messageController.view.origin = CGPointMake(self.view.frame.size.width - 270 - Full_Right_SafeHeight, 0);
    self.chatBottomInputBarViewController.view.origin = CGPointMake(self.view.frame.size.width - 270 - Full_Right_SafeHeight, self.view.frame.size.height - TTextView_Height);
}

- (void)showAnimation {
    self.animationFinished = NO;
    self.isShowMessageInput = YES;
    [self hiddenFrame];
    [UIView animateWithDuration:0.25
                     animations:^{
        [self showFrame];
    }
                     completion:^(BOOL finished) {
        if (finished) {
            self.animationFinished = YES;
        }
    }];
}

- (void)hiddenAnimation {
    self.animationFinished = NO;
    [self showFrame];
    [UIView animateWithDuration:0.25
                     animations:^{
        [self hiddenFrame];
    }
                     completion:^(BOOL finished) {
        if (finished) {
            self.animationFinished = YES;
            [self.view removeFromSuperview];
            self.isShowMessageInput = NO;
            if (self.delegate && [self.delegate respondsToSelector:@selector(hiddenChatController:)]) {
                [self.delegate hiddenChatController:self];
            }
        }
    }];
}

- (void)keyboardReset {
    [self didTapInMessageController:nil];
}

- (BOOL)isInputEditing {
    BOOL isInputEditing = NO;
    //编辑中
    if (_inputController.isInputEditing || self.isShowMessageInput) {
        isInputEditing = YES;
    } else {
        isInputEditing = NO;
    }
    return isInputEditing;
}

- (void)sendMessage:(ChatMessageDataModel *)message {
    [_messageController sendMessage:message];
}
#pragma mark- TInputControllerDelegate
- (void)inputController:(InputController *)inputController didChangeHeight:(CGFloat)height {
    return;
    __weak __typeof(self) ws = self;
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        CGRect msgFrame = ws.messageController.view.frame;
        msgFrame.size.height = ws.view.frame.size.height - height;
        ws.messageController.view.frame = msgFrame;
        
        CGRect inputFrame = ws.inputController.view.frame;
        inputFrame.origin.y = msgFrame.origin.y + msgFrame.size.height;
        inputFrame.size.height = height;
        ws.inputController.view.frame = inputFrame;
        
        [ws.messageController scrollToBottom:NO];
    } completion:nil];
}

- (void)inputController:(InputController *)inputController didSendMessage:(ChatMessageDataModel *)msg {
    /*
    //直接发送系统样式
    //    [_messageController sendMessage:msg];
    
    //    //    直接发送yytext样式
    //    ChatMessageYYDataModel *msgModel = [[ChatMessageYYDataModel alloc]init];
    //    msgModel.content = msg.content;
    //    [_messageController sendMessage:msgModel];
    
    //直接发送yytext样式
    FaceMessageDataModel *faceMsgModel = [[FaceMessageDataModel alloc]init];
    faceMsgModel.content = msg.content;
    faceMsgModel.type = ChatMessageTypeFace;
    [_messageController sendMessage:faceMsgModel];

    //直接发送系统样式
    ChatMessageDataModel *msgModel = [[ChatMessageDataModel alloc]init];
    msgModel.content = msg.content;
    msgModel.type = ChatMessageTypeSystemAttributedString;
    [_messageController sendMessage:msgModel];
    */
    if (self.delegate && [self.delegate respondsToSelector:@selector(chatController:didSendMessage:)]) {
        [self.delegate chatController:self didSendMessage:msg];
    }
 
}

- (void)inputControllerDidTouchFace:(InputController *)inputController {
    //键盘出现时，处理UI，人员列表
}

- (void)inputControllerDidTouchTextView:(InputController *)inputController {
    //键盘出现时，处理UI，人员列表
}

- (void)inputControllerDidTouchPlayList:(InputController *)inputController {
    
}

#pragma mark- TMessageControllerDelegate
//- (void)didTapInMessageController:(ChatMessageController *)controller {
- (void)didTapInMessageController:(MessageController *)controller {
    //键盘消失时，处理UI，人员列表
    [_inputController reset];
}
 
- (void)clickBottomBarFaceBtn:(UIButton *)sender {
    [self.inputController show];
    [self.inputController clickBottomBarFaceBtn:nil];
}

- (void)clickBottomBarTextViewBtn:(UIButton *)sender {
    [self.inputController show];
    [self.inputController clickBottomBarTextViewBtn:nil];

}
 

//是否自动旋转
//返回导航控制器的顶层视图控制器的自动旋转属性，因为导航控制器是以栈的原因叠加VC的
//topViewController是其最顶层的视图控制器，
-(BOOL)shouldAutorotate{
    return YES;
}

//支持哪些屏幕方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskLandscape;
}

//默认方向
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationLandscapeLeft;
}
@end
