//
//  ChatController.m
//  WDEMO
//
//  Created by rrtv on 2020/7/22.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "ChatController.h"
#import "ChatHeader.h"
#import "ChatMessageDataModel.h"
#import "ChatMemberListView.h"

@interface ChatController () <TInputControllerDelegate, TMessageControllerDelegate>

@property (nonatomic, strong) ChatMemberListView *chatMemberListView;

@end

@implementation ChatController

- (instancetype)init {
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

- (void)setupViews {
    //message
    _messageController = [[MessageController alloc] init];
    _messageController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - TTextView_Height - Bottom_SafeHeight);
    _messageController.delegate = self;
    [self addChildViewController:_messageController];
    [self.view addSubview:_messageController.view];
    
    //input
    _inputController = [[InputController alloc] init];
    _inputController.view.frame = CGRectMake(0, self.view.frame.size.height - TTextView_Height - Bottom_SafeHeight, self.view.frame.size.width, TTextView_Height + Bottom_SafeHeight);
    _inputController.view.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    _inputController.view.backgroundColor = InputBarColor;
    _inputController.delegate = self;
    [self addChildViewController:_inputController];
    [self.view addSubview:_inputController.view];
    
    //Member
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(30, 30);
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 10;
    layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.chatMemberListView = [[ChatMemberListView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60) collectionViewLayout:layout];
    self.chatMemberListView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.chatMemberListView];
    
}

- (void)sendMessage:(ChatMessageDataModel *)message {
    [_messageController sendMessage:message];
}

#pragma mark- TInputControllerDelegate
- (void)inputController:(InputController *)inputController didChangeHeight:(CGFloat)height {
    __weak __typeof(self) ws = self;;
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        CGRect msgFrame = ws.messageController.view.frame;
        msgFrame.size.height = ws.view.frame.size.height - height;
        ws.messageController.view.frame = msgFrame;
        
        CGRect inputFrame = ws.inputController.view.frame;
        inputFrame.origin.y = msgFrame.origin.y + msgFrame.size.height;
        inputFrame.size.height = height;
        ws.inputController.view.frame = inputFrame;
        
        CGRect bottomBarFrame = ws.inputController.bottomBar.frame;
        bottomBarFrame.origin.y = height - bottomBarFrame.size.height - Bottom_SafeHeight;
        ws.inputController.bottomBar.frame = bottomBarFrame;

        [ws.messageController scrollToBottom:NO];
    } completion:nil];
}

- (void)inputController:(InputController *)inputController didSendMessage:(ChatMessageDataModel *)msg {
    [_messageController sendMessage:msg];
    if (self.delegate && [self.delegate respondsToSelector:@selector(chatController:didSendMessage:)]) {
        [self.delegate chatController:self didSendMessage:msg];
    }
}

- (void)inputControllerDidTouchFace:(InputController *)inputController {
    //键盘出现时，处理UI，人员列表
    self.chatMemberListView.hidden = YES;
    _messageController.hiddenHeader = YES;

}

- (void)inputControllerDidTouchTextView:(InputController *)inputController {
    //键盘出现时，处理UI，人员列表
    self.chatMemberListView.hidden = YES;
    _messageController.hiddenHeader = YES;

}

- (void)inputControllerDidTouchPlayList:(InputController *)inputController {
    
}

#pragma mark- TMessageControllerDelegate
//- (void)didTapInMessageController:(ChatMessageController *)controller {
- (void)didTapInMessageController:(MessageController *)controller {
    //键盘消失时，处理UI，人员列表
    self.chatMemberListView.hidden = NO;
    _messageController.hiddenHeader = NO;

    [_inputController reset];
}

@end
