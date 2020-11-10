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

    //创建聊天界面
    self.chatManager = [[ChatManager alloc] init];
 
    _halfChat = [[ChatController alloc] init];
    _halfChat.delegate = self;
    _halfChat.view.frame = CGRectMake(0, player_height, self.view.bounds.size.width, self.view.bounds.size.height - player_height);
    [self addChildViewController:_halfChat];
    [self.view addSubview:_halfChat.view];
    self.chatManager.halfChat = _halfChat;

    
    UIButton *goBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200)];
    //    [goBtn setImage:[UIImage imageNamed:@"btn_upgradeaccount_close"] forState:UIControlStateNormal];
    [goBtn setTitle:@"gobtn" forState:UIControlStateNormal];
    goBtn.backgroundColor = [UIColor grayColor];
    [goBtn addTarget:self action:@selector(clickgoBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goBtn];
    
    
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
            NSLog(@"23423--");
        }
    });
}

-(void)clickgoBtn:(UIButton *)btn {
    if (!self.chatManager.fullChat) {
        _fullChat = [[FullScreenChatController alloc] init];
        _fullChat.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        _fullChat.delegate = self;
        [self addChildViewController:_fullChat];
        [self.view addSubview:_fullChat.view];
        self.chatManager.fullChat = _fullChat;
        _halfChat.view.hidden = YES;
    } else {
        [self addChildViewController:self.chatManager.fullChat];
        [self.view addSubview:self.chatManager.fullChat.view];
        [self.chatManager.fullChat showAnimation];
    }
}

- (void)chatController:(ChatController *)controller didSendMessage:(ChatMessageDataModel *)msgCellData{
    //todo
}

- (void)clickPlayListButton {
    //todo
}


- (void)hiddenChatController:(nonnull UIViewController *)controller {
    //todo
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

////是否自动旋转
////返回导航控制器的顶层视图控制器的自动旋转属性，因为导航控制器是以栈的原因叠加VC的
////topViewController是其最顶层的视图控制器，
//-(BOOL)shouldAutorotate{
//    return YES;
//}
//
////支持哪些屏幕方向
//- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
//    return UIInterfaceOrientationMaskAllButUpsideDown;
//}
//
////默认方向
//- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
//    return UIInterfaceOrientationPortrait;
//}
 

- (void)createChatData {
    
    TipMessageDataModel *tipMsgModel = [[TipMessageDataModel alloc]init];
    tipMsgModel.content = @"欢迎和更多的人一起看剧聊剧！畅所欲言！看剧期间严禁出现违法违规、低俗色情、人身攻击，谈论政治等内容。发布违规言论会在当前直播间被永久禁言，请文明发言哦～";
    tipMsgModel.type = ChatMessageTypeTip;
//    [_messageController sendMessage:tipMsgModel];
    
    EnterMessageDataModel *enterMsgModel = [[EnterMessageDataModel alloc]init];
    //    enterMsgModel.content = @"一起来看剧啦";
    enterMsgModel.type = ChatMessageTypeEnter;
//    [_messageController sendMessage:enterMsgModel];
    
}
@end
