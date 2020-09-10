//
//  ChatViewController.m
//   
//
//  Created by rrtv on 2020/7/22.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "ChatViewController.h"
#import "ChatController.h"

@interface ChatViewController () <ChatControllerDelegate>

@property (nonatomic, strong) ChatController *chat;

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    _chat = [[ChatController alloc] init];
    _chat.delegate = self;
    _chat.view.frame =CGRectMake(0, 200, self.view.bounds.size.width, self.view.bounds.size.height - 200);
    [self addChildViewController:_chat];
    [self.view addSubview:_chat.view];
    
    
    UIButton *goBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200)];
    //    [goBtn setImage:[UIImage imageNamed:@"btn_upgradeaccount_close"] forState:UIControlStateNormal];
    [goBtn setTitle:@"gobtn" forState:UIControlStateNormal];
    goBtn.backgroundColor = [UIColor grayColor];
    [goBtn addTarget:self action:@selector(clickgoBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goBtn];
  
    
}

-(void)clickgoBtn:(UIButton *)btn {
    
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

@end
