//
//  ChatViewController.m
//   
//
//  Created by rrtv on 2020/7/22.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "ChatViewController.h"
#import "ChatController.h"

@interface ChatViewController ()//<TUIChatControllerDelegate>

@property (nonatomic, strong) ChatController *chat;

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
//    _chat = [[RRChatController alloc] initWithConversation:self.conversationData];
    _chat = [[ChatController alloc] init];
//    _chat.delegate = self;
    [self addChildViewController:_chat];
    [self.view addSubview:_chat.view];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//- (void)chatController:(ChatController *)controller didSendMessage:(TUIMessageCellData *)msgCellData
//{
//    //  to do
//}
@end
