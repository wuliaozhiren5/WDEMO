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

#import "ChatMessageDataModel.h"
#import "ChatMessageYYDataModel.h"
#import "EnterMessageDataModel.h"
#import "TipMessageDataModel.h"
#import "FaceMessageDataModel.h"
//底部的输入框
//#import "ChatBottomInputBar.h"
//#import "ChatBottomInputBarViewController.h"
#import "HalfScreenChatBottomInputBarViewController.h"

@interface ChatController () <TInputControllerDelegate, TMessageControllerDelegate>
//毛玻璃
@property (nonatomic, strong) UIImageView *backgroundImageView;
//人员列表背景
@property (nonatomic, strong) UIView *memberListColorBlackView;
//人员列表
@property(nonatomic, strong) NSArray *membersArray;

@property (nonatomic, strong) HalfScreenChatBottomInputBarViewController *chatBottomInputBarViewController;


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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [_inputController reset];
    
    //    todo
    //    https://www.jianshu.com/p/8d02bbe5d234
    //    进入后台（最小化） applicationDidEnterBackground
    //    不会调用 viewWillAppear viewDidAppear viewWillDisappear viewDidDisappear
    //    使用beginAppearanceTransition:(BOOL)isAppearing animated:(BOOL)animated和endAppearanceTransition来处理。
    //    [VC beginAppearanceTransition:YES animated:YES]触发towCol的viewWillAppear。
    //    [VC endAppearanceTransition]触发viewDidAppear。
    //
    //    [VC beginAppearanceTransition:NO animated:YES]触发towCol的viewWillDisappear。
    //    [VC endAppearanceTransition]触发viewDidDisappear。
    
    //页面消失，最小化，键盘，人员列表问题
    [self didTapInMessageController:nil];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)setupViews {
    
    //背景图
    [self creatBackgroundImageView];
    //message
    [self creatMessageController];
    //底部的inputview:chatBottomInputBar
    [self creatChatBottomInputBarViewController];
    //人员列表
    [self creatChatMemberListView];
//    //制造数据
//    [self createChatData];
}

//- (void)createChatData {
//
//    TipMessageDataModel *tipMsgModel = [[TipMessageDataModel alloc]init];
//    tipMsgModel.content = @"欢迎和更多的人一起看剧聊剧！畅所欲言！看剧期间严禁出现违法违规、低俗色情、人身攻击，谈论政治等内容。发布违规言论会在当前直播间被永久禁言，请文明发言哦～";
//    tipMsgModel.type = ChatMessageTypeTip;
//    [_messageController sendMessage:tipMsgModel];
//
//    EnterMessageDataModel *enterMsgModel = [[EnterMessageDataModel alloc]init];
//    enterMsgModel.content = @"一起来看剧啦1234567890";
//    enterMsgModel.type = ChatMessageTypeEnter;
//    [_messageController sendMessage:enterMsgModel];
//
//}

- (void)creatMessageController {
    //message
    _messageController = [[HalfScreenMessageController alloc] init];
    _messageController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - TTextView_Height - Bottom_SafeHeight);
    _messageController.delegate = self;
    [self addChildViewController:_messageController];
    [self.view addSubview:_messageController.view];
}

//底部bar
- (void)creatChatBottomInputBarViewController {
    _chatBottomInputBarViewController = [[HalfScreenChatBottomInputBarViewController alloc] init];
    _chatBottomInputBarViewController.view.frame = CGRectMake(0, self.view.frame.size.height - TTextView_Height - Bottom_SafeHeight, self.view.frame.size.width, TTextView_Height + Bottom_SafeHeight);
    _chatBottomInputBarViewController.view.autoresizingMask = UIViewAutoresizingFlexibleTopMargin; 
    [_chatBottomInputBarViewController halfStyle];
    [self addChildViewController:_chatBottomInputBarViewController];
    [self.view addSubview:_chatBottomInputBarViewController.view];
    
    //    todo  delegate
    [_chatBottomInputBarViewController.faceButton addTarget:self action:@selector(clickBottomBarFaceBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_chatBottomInputBarViewController.textViewBtn addTarget:self action:@selector(clickBottomBarTextViewBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_chatBottomInputBarViewController.playListBtn addTarget:self action:@selector(clickBottomBarPlayListBtn:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (HalfScreenInputController *)inputController {
    if (!_inputController) {
        _inputController = [[HalfScreenInputController alloc] init];
        _inputController.view.frame = CGRectMake(0, 0, Screen_Width, Screen_Height);
        _inputController.view.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
        _inputController.delegate = self;
    }
    return _inputController;
}

//- (void)showInputView {
//    UIWindow *window = [UIApplication sharedApplication].delegate.window;
//    [window addSubview:self.inputController.view];
//}
//
//- (void)hideInputView {
//    UIWindow *window = [UIApplication sharedApplication].delegate.window;
//    [window addSubview:self.inputController.view];
//}

//- (void)creatInputController {
//    //input
//    if (!_inputController) {
//        _inputController = [[HalfScreenInputController alloc] init];
////        _inputController.view.frame = CGRectMake(0, self.view.frame.size.height - TTextView_Height - Bottom_SafeHeight, self.view.frame.size.width, TTextView_Height + Bottom_SafeHeight);
////        _inputController.view.frame = self.view.bounds;
//        _inputController.view.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
////        _inputController.delegate = self;
//
////        [self addChildViewController:_inputController];
////        [self.view addSubview:_inputController.view];
////        _inputController.view.backgroundColor = [UIColor whiteColor];
//
//        _inputController.view.frame = CGRectMake(0, 0, Screen_Width, Screen_Height);
//
//
//    } else {
//    }
//    UIWindow *window = [UIApplication sharedApplication].delegate.window;
//    [window addSubview:_inputController.view];
//}

- (void)creatChatMemberListView {
    //渐变遮罩
    UIView *colorView = [[UIView alloc] init];
    colorView.frame = CGRectMake(0, 0, self.view.frame.size.width, 60);
    [self.view addSubview:colorView];
    _memberListColorBlackView = colorView;
    
    //Member
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(30, 30);
    layout.minimumLineSpacing = 9;
    layout.minimumInteritemSpacing = 9;
    layout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _chatMemberListView = [[ChatMemberListView alloc]initWithFrame:CGRectMake(10, 0, self.view.frame.size.width - 10 * 2, 60) collectionViewLayout:layout];
    //    _chatMemberListView.roomModel = _roomModel;
    //    _chatMemberListView.memberListViewDelegate = self;
    _chatMemberListView.backgroundColor = [UIColor clearColor];
    [colorView addSubview:_chatMemberListView];
}

- (void)creatBackgroundImageView {
    UIImageView *backgroundImageView = [[UIImageView alloc] init];
    backgroundImageView.frame = self.view.frame;
    backgroundImageView.image = [UIImage imageNamed:@"ChatBackgroundImage"];
    //    [backgroundImageView rr_delaySetImageWithURLString:_roomModel.coverUrl placeholderImage:nil];
    backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    backgroundImageView.clipsToBounds = YES;
    [self.view addSubview:backgroundImageView];
    self.backgroundImageView = backgroundImageView;
    
    //模糊
    [self uivisualEffectViewStyle];
    //网络图片
    //    __weak __typeof(self) weakself = self;
    //    [self.backgroundImageView sd_setImageWithURL:[NSURL URLWithString:_roomModel.coverUrl] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
    //        if (image) {
    //            weakself.backgroundImageView.image = image;
    //         } else {}
    //        [weakself uivisualEffectViewStyle];
    //    }];
}

//ios8 模糊
- (void)uivisualEffectViewStyle{
    //实现模糊效果
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    //毛玻璃视图
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    effectView.contentView.backgroundColor = RGBA(0, 0, 0, 0.4);
    effectView.frame = _backgroundImageView.frame;
    [_backgroundImageView addSubview:effectView];
}

- (void)sendMessage:(ChatMessageDataModel *)message {
    [_messageController sendMessage:message];
}

- (void)keyboardReset {
    [self didTapInMessageController:nil];
}

- (BOOL)isInputEditing {
    return self.inputController.isInputEditing;;
}

#pragma mark- TInputControllerDelegate
- (void)inputController:(InputController *)inputController didChangeHeight:(CGFloat)height {
    return;
    __weak __typeof(self) ws = self;;
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        CGRect msgFrame = ws.messageController.view.frame;
        msgFrame.size.height = ws.view.frame.size.height - height;
        ws.messageController.view.frame = msgFrame;
        
        CGRect inputFrame = ws.inputController.view.frame;
        inputFrame.origin.y = msgFrame.origin.y + msgFrame.size.height;
        inputFrame.size.height = height;
        ws.inputController.view.frame = inputFrame;
        
        //高度出现问题 所以注释
        //        CGRect bottomBarFrame = ws.inputController.bottomBar.frame;
        //        bottomBarFrame.origin.y = height - bottomBarFrame.size.height - Bottom_SafeHeight;
        //        ws.inputController.bottomBar.frame = bottomBarFrame;
        
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
    
    //    直接发送yytext样式
    FaceMessageDataModel *faceMsgModel = [[FaceMessageDataModel alloc]init];
    faceMsgModel.content = msg.content;
    faceMsgModel.type = ChatMessageTypeFace;
    [_messageController sendMessage:faceMsgModel];
    */
    if (self.delegate && [self.delegate respondsToSelector:@selector(chatController:didSendMessage:)]) {
        [self.delegate chatController:self didSendMessage:msg];
    }
    
}

- (void)inputControllerDidTouchFace:(InputController *)inputController {
    //键盘出现时，处理UI，人员列表
    _memberListColorBlackView.hidden = YES;
    _messageController.hiddenHeader = YES;
    
}

- (void)inputControllerDidTouchTextView:(InputController *)inputController {
    //键盘出现时，处理UI，人员列表
    _memberListColorBlackView.hidden = YES;
    _messageController.hiddenHeader = YES;
    
}

- (void)inputControllerDidTouchPlayList:(InputController *)inputController {
    
}

#pragma mark- TMessageControllerDelegate
//- (void)didTapInMessageController:(ChatMessageController *)controller {
- (void)didTapInMessageController:(MessageController *)controller {
    //键盘消失时，处理UI，人员列表
    _memberListColorBlackView.hidden = NO;
    _messageController.hiddenHeader = NO;
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

- (void)clickBottomBarPlayListBtn:(UIButton *)sender {

}
@end
