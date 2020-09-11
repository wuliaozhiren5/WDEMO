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

@interface ChatViewController () <ChatControllerDelegate>

@property (nonatomic, strong) ChatController *halfChat;

@property (nonatomic, strong) FullScreenChatController *fullChat;

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];

    self.view.backgroundColor = [UIColor grayColor];
    
    _halfChat = [[ChatController alloc] init];
//    _halfChat.delegate = self;
    _halfChat.view.frame =CGRectMake(0, 200, self.view.bounds.size.width, self.view.bounds.size.height - 200);
    [self addChildViewController:_halfChat];
    [self.view addSubview:_halfChat.view];
    
    
    UIButton *goBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200)];
    //    [goBtn setImage:[UIImage imageNamed:@"btn_upgradeaccount_close"] forState:UIControlStateNormal];
    [goBtn setTitle:@"gobtn" forState:UIControlStateNormal];
    goBtn.backgroundColor = [UIColor grayColor];
    [goBtn addTarget:self action:@selector(clickgoBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goBtn];

}

-(void)clickgoBtn:(UIButton *)btn {
    _fullChat = [[FullScreenChatController alloc] init];
    //    _fullChat.delegate = self;
    _fullChat.view.frame =CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    [self addChildViewController:_fullChat];
    [self.view addSubview:_fullChat.view];
    
    _halfChat.view.hidden = YES;
    
}

- (void)chatController:(ChatController *)controller didSendMessage:(ChatMessageDataModel *)msgCellData{
    //  to do
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
@end
