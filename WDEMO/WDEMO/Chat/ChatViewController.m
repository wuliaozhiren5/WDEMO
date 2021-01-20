//
//  ChatViewController.m
//   
//
//  Created by rrtv on 2020/7/22.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "ChatViewController.h"
#import "ChatController.h"
#import "FullScreenChatController.h"
#import "ChatManager.h"

#import "ChatMessageDataModel.h"
#import "ChatMessageYYDataModel.h"
#import "EnterMessageDataModel.h"
#import "TipMessageDataModel.h"
#import "FaceMessageDataModel.h"

@interface ChatViewController () <ChatControllerDelegate>
//半屏
@property (nonatomic, strong) UIView *halfPlyerView;

@property (nonatomic, strong) ChatManager *chatManager;

@property (nonatomic, strong) ChatController *halfChat;

@property (nonatomic, strong) FullScreenChatController *fullChat;

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    self.view.backgroundColor = [UIColor grayColor];
    
    CGFloat player_width = Screen_Width;
    CGFloat player_height = player_width * 9 / 16;

    _halfPlyerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, player_height)];
    _halfPlyerView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_halfPlyerView];
    //创建聊天界面
    self.chatManager = [[ChatManager alloc] init];
 
    _halfChat = [[ChatController alloc] init];
    _halfChat.delegate = self;
    _halfChat.view.frame = CGRectMake(0, player_height, self.view.bounds.size.width, self.view.bounds.size.height - player_height);
    [self addChildViewController:_halfChat];
    [self.view addSubview:_halfChat.view];
    self.chatManager.halfChat = _halfChat;

    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 20, 44, 44)];
    //    [goBtn setImage:[UIImage imageNamed:@"btn_upgradeaccount_close"] forState:UIControlStateNormal];
    [backBtn setTitle:@"<" forState:UIControlStateNormal];
    backBtn.backgroundColor = [UIColor clearColor];
    [backBtn addTarget:self action:@selector(clickBackBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_halfPlyerView addSubview:backBtn];
    
    UIButton *fullScreenBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width - 44 , player_height - 44, 44, 44)];
    //    [goBtn setImage:[UIImage imageNamed:@"btn_upgradeaccount_close"] forState:UIControlStateNormal];
    [fullScreenBtn setTitle:@"全屏" forState:UIControlStateNormal];
    fullScreenBtn.backgroundColor = [UIColor clearColor];
    [fullScreenBtn addTarget:self action:@selector(clickFullScreenBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_halfPlyerView addSubview:fullScreenBtn];
    
    [self createChatMessage];
    return;
    
    //线程
    //线程1
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        @synchronized(self){
            NSLog(@"23423");
            sleep(10);
        }
    });

    //线程2
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(1);
        @synchronized(self){
            NSLog(@"23423--------");
        }
    });
}

-(void)clickBackBtn:(UIButton *)btn {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)clickFullScreenBtn:(UIButton *)btn {
    if (!self.chatManager.fullChat) {
        _fullChat = [[FullScreenChatController alloc] init];
        _fullChat.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        _fullChat.delegate = self;
        [self addChildViewController:_fullChat];
        [self.view addSubview:_fullChat.view];
        self.chatManager.fullChat = _fullChat;
//        _halfChat.view.hidden = YES;
    } else {
        [self addChildViewController:self.chatManager.fullChat];
        [self.view addSubview:self.chatManager.fullChat.view];
        [self.chatManager.fullChat showAnimation];
    }
    //填充数据
    //todo
//    [self.chatManager fullChatControllerSetChatMessage];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}


-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    
    //    if ([UIDevice currentDevice].orientation ==UIDeviceOrientationLandscapeLeft||[UIDevice currentDevice].orientation ==UIDeviceOrientationLandscapeRight){
    //         UIWindow*window= [UIApplication sharedApplication].keyWindow;
    //        _playerView.frame=CGRectMake(0, 0, size.width,size.height);
    //        _playerView.player.view.frame=CGRectMake(0, 0, size.width,size.height);
    //        _playerView.mediaControl.fullScreenBtn.selected=YES;
    //        _playerView.isFullScreen=YES;
    //        [window addSubview:_playerView];
    //    }else{
    //       _playerView.frame=CGRectMake(0, 0, size.width, size.width/16*9);
    //       _playerView.player.view.frame=CGRectMake(0, 0, size.width, size.width/16*9);
    //        _playerView.mediaControl.fullScreenBtn.selected=NO;
    //        _playerView.isFullScreen=NO;
    //        [_headerView addSubview:_playerView];
    //
    //    }
    
}

//是否自动旋转
//返回导航控制器的顶层视图控制器的自动旋转属性，因为导航控制器是以栈的原因叠加VC的
//topViewController是其最顶层的视图控制器，
-(BOOL)shouldAutorotate{
    return YES;
}

//支持哪些屏幕方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
//    return UIInterfaceOrientationMaskAllButUpsideDown;
    return UIInterfaceOrientationMaskPortrait;
}

//默认方向
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationPortrait;
}
 
//制造数据
- (void)createChatMessage {
    [self createChatTipMessage];
    [self createChatEnterMessage];
}

//制造公告消息
- (void)createChatTipMessage {
    //公告消息
    TipMessageDataModel *tipMsgModel = [[TipMessageDataModel alloc]init];
    tipMsgModel.content = @"欢迎和更多的人一起看剧聊剧！畅所欲言！看剧期间严禁出现违法违规、低俗色情、人身攻击，谈论政治等内容。发布违规言论会在当前直播间被永久禁言，请文明发言哦～";
    tipMsgModel.type = ChatMessageTypeTip;
    NSArray *tipArray = @[tipMsgModel];
    [self.chatManager sendMessages:tipArray];
}

//制造进入房间消息
- (void)createChatEnterMessage {
    //进入房间消息
    EnterMessageDataModel *enterMsgModel = [[EnterMessageDataModel alloc]init];
    enterMsgModel.content = @"一起来看剧啦1234567890";
    enterMsgModel.type = ChatMessageTypeEnter;
    NSArray *enterArray = @[enterMsgModel];
    [self.chatManager sendMessages:enterArray];
}

#pragma mark ChatControllerDelegate
- (void)chatController:(UIViewController *)controller didSendMessage:(ChatMessageDataModel *)msgCellData {
    //发送IM聊天消息
    //todo
    
    //    //    直接发送yytext样式
    //    ChatMessageYYDataModel *msgModel = [[ChatMessageYYDataModel alloc]init];
    //    msgModel.content = msg.content;
    //    [_messageController sendMessage:msgModel];
    
    //直接发送yytext样式
    FaceMessageDataModel *faceMsgModel = [[FaceMessageDataModel alloc]init];
    faceMsgModel.content = msgCellData.content;
    faceMsgModel.type = ChatMessageTypeFace;

    //直接发送系统样式
    ChatMessageDataModel *msgModel = [[ChatMessageDataModel alloc]init];
    msgModel.content = msgCellData.content;
    msgModel.type = ChatMessageTypeSystemAttributedString;
    
    NSArray *msgArray = @[faceMsgModel, msgModel];
    [self.chatManager sendMessages:msgArray];

}

- (void)clickPlayListButton {
    //todo 列表
}

- (void)hiddenChatController:(UIViewController *)controller {
    //todo 半屏幕隐藏聊天界面
}

 
@end
