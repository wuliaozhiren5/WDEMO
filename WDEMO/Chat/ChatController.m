//
//  RRChatController.m
//  WDEMO
//
//  Created by rrtv on 2020/7/22.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "ChatController.h"
#import "THeader.h"

@interface ChatController () <TInputControllerDelegate>

@end

@implementation ChatController

- (instancetype)init{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupViews];

}

- (void)setupViews{
   
//    @weakify(self)
    //message
    _messageController = [[TUIMessageController alloc] init];
    _messageController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - TTextView_Height - Bottom_SafeHeight);
//    _messageController.delegate = self;
    [self addChildViewController:_messageController];
    [self.view addSubview:_messageController.view];
//    [_messageController setConversation:self.conversationData];

    //input
    _inputController = [[InputController alloc] init];
    _inputController.view.frame = CGRectMake(0, self.view.frame.size.height - TTextView_Height - Bottom_SafeHeight, self.view.frame.size.width, TTextView_Height + Bottom_SafeHeight);
    
    _inputController.view.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    _inputController.view.backgroundColor = [UIColor whiteColor];
    
    _inputController.delegate = self;
//    [RACObserve(self, moreMenus) subscribeNext:^(NSArray *x) {
//        @strongify(self)
//        [self.inputController.moreView setData:x];
//    }];
    [self addChildViewController:_inputController];
    [self.view addSubview:_inputController.view];
//    _inputController.inputBar.inputTextView.text = self.conversationData.draftText;

    
}

#pragma mark- TInputControllerDelegate
- (void)inputController:(InputController *)inputController didChangeHeight:(CGFloat)height {
    __weak typeof(self) ws = self;
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        CGRect msgFrame = ws.messageController.view.frame;
        msgFrame.size.height = ws.view.frame.size.height - height;
        ws.messageController.view.frame = msgFrame;

        CGRect inputFrame = ws.inputController.view.frame;
        inputFrame.origin.y = msgFrame.origin.y + msgFrame.size.height;
        inputFrame.size.height = height;
        ws.inputController.view.frame = inputFrame;

//        [ws.messageController scrollToBottom:NO];
    } completion:nil];
}
 
- (void)inputController:(InputController *)inputController didSendMessage:(TUIMessageCellData *)msg
{
    [_messageController sendMessage:msg];
    if (self.delegate && [self.delegate respondsToSelector:@selector(chatController:didSendMessage:)]) {
        [self.delegate chatController:self didSendMessage:msg];
    }
}

- (void)sendMessage:(TUIMessageCellData *)message
{
    [_messageController sendMessage:message];
}

@end
