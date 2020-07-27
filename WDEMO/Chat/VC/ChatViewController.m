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
}
 
- (void)chatController:(ChatController *)controller didSendMessage:(ChatMessageDataModel *)msgCellData;
{
    //  to do
}
@end
