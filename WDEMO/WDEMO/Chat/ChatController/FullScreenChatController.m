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

@end

@implementation FullScreenChatController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.animationFinished = YES;
    [self setupViews];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    //    [_inputController reset];
    
    //页面消失，最小化，键盘，人员列表问题
    //    [self didTapInMessageController:nil];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)setupViews {
    self.view.backgroundColor = [UIColor clearColor];
    UIControl *tapControl = [[UIControl alloc]init];
    tapControl.frame = self.view.bounds;
    [tapControl addTarget:self action:@selector(hiddenView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tapControl];

    //message
    [self creatMessageController];
    //input
    [self creatInputController];
    
    [self showAnimation];
    
    //制造数据
    [self createChatData];
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

- (void)createChatData {
    
    TipMessageDataModel *tipMsgModel = [[TipMessageDataModel alloc]init];
    tipMsgModel.content = @"欢迎和更多的人一起看剧聊剧！畅所欲言！看剧期间严禁出现违法违规、低俗色情、人身攻击，谈论政治等内容。发布违规言论会在当前直播间被永久禁言，请文明发言哦～";
    tipMsgModel.type = ChatMessageTypeTip;
    [_messageController sendMessage:tipMsgModel];
    
    EnterMessageDataModel *enterMsgModel = [[EnterMessageDataModel alloc]init];
    //    enterMsgModel.content = @"一起来看剧啦";
    enterMsgModel.type = ChatMessageTypeEnter;
    [_messageController sendMessage:enterMsgModel];
    
}
- (void)creatMessageController {
    //message
    _messageController = [[FullScreenMessageController alloc] init];
//    _messageController.view.frame = CGRectMake(self.view.frame.size.width - 270, 0, 270, self.view.frame.size.height -  TTextView_Height);
    self.messageController.view.frame = CGRectMake(self.view.frame.size.width, 0, 270, self.view.frame.size.height -  TTextView_Height);
    _messageController.delegate = self;
    [self addChildViewController:_messageController];
    [self.view addSubview:_messageController.view];
    _messageController.view.backgroundColor = RGBA(33, 33, 33, 0.85);
}

- (void)creatInputController{
    //input
    _inputController = [[FullScreenInputController alloc] init];
//    _inputController.view.frame = CGRectMake(0, self.view.frame.size.height - TTextView_Height, self.view.frame.size.width, TTextView_Height);
    _inputController.view.frame = CGRectMake(270, self.view.frame.size.height - TTextView_Height, self.view.frame.size.width, TTextView_Height);
    _inputController.view.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    _inputController.delegate = self;
    [self addChildViewController:_inputController];
    [self.view addSubview:_inputController.view];
//    _inputController.view.backgroundColor = [UIColor grayColor];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (void)showAnimation {
    self.animationFinished = NO;
    self.messageController.view.frame = CGRectMake(self.view.frame.size.width, 0, 270, self.view.frame.size.height -  TTextView_Height);
    self.inputController.view.frame = CGRectMake(270, self.view.frame.size.height - TTextView_Height, self.view.frame.size.width, TTextView_Height);
    [UIView animateWithDuration:0.25
                     animations:^{
        self.messageController.view.frame = CGRectMake(self.view.frame.size.width - 270, 0, 270, self.view.frame.size.height -  TTextView_Height);
        self.inputController.view.frame = CGRectMake(0, self.view.frame.size.height - TTextView_Height, self.view.frame.size.width, TTextView_Height);
    }
                     completion:^(BOOL finished) {
        if (finished) {
            self.animationFinished = YES;
        }
    }];
}

- (void)hiddenAnimation {
    self.animationFinished = NO;
    self.messageController.view.frame = CGRectMake(self.view.frame.size.width - 270, 0, 270, self.view.frame.size.height -  TTextView_Height);
    self.inputController.view.frame = CGRectMake(0, self.view.frame.size.height - TTextView_Height, self.view.frame.size.width, TTextView_Height);
    [UIView animateWithDuration:0.25
                     animations:^{
        self.messageController.view.frame = CGRectMake(self.view.frame.size.width, 0, 270, self.view.frame.size.height -  TTextView_Height);
        self.inputController.view.frame = CGRectMake(270, self.view.frame.size.height - TTextView_Height, self.view.frame.size.width, TTextView_Height);
    }
                     completion:^(BOOL finished) {
        if (finished) {
            self.animationFinished = YES;
            [self.view removeFromSuperview];
            if (self.delegate && [self.delegate respondsToSelector:@selector(hiddenChatController:)]) {
                [self.delegate hiddenChatController:self];
            }
        }
    }];
}

#pragma mark- TInputControllerDelegate
- (void)inputController:(InputController *)inputController didChangeHeight:(CGFloat)height {
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
     
    //直接发送系统样式
    //    [_messageController sendMessage:msg];
    
    //    //    直接发送yytext样式
    //    ChatMessageYYDataModel *msgModel = [[ChatMessageYYDataModel alloc]init];
    //    msgModel.content = msg.content;
    //    [_messageController sendMessage:msgModel];
    
    //    直接发送yytext样式
    FaceMessageDataModel *faceMsgModel = [[FaceMessageDataModel alloc]init];
    faceMsgModel.content = msg.content;
    faceMsgModel.type = ChatMessageTypeFace;
    [_messageController sendMessage:faceMsgModel];
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

@end
