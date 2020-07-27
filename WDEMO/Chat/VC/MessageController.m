//
//  TUIMessageController.m
//  UIKit
//
//  Created by annidyfeng on 2019/7/1.
//  Copyright © 2018年 Tencent. All rights reserved.
//

#import "MessageController.h"
#import "ChatHeader.h"
#import "ChatMessageData.h"
#import "IMMessageCell.h"
#import "ChatMessageData.h"

#define MAX_MESSAGE_SEP_DLAY (5 * 60)

@interface MessageController ()
@property (nonatomic, strong) NSMutableArray *uiMsgs;
@property (nonatomic, strong) NSMutableArray *heightCache;

@end

@implementation MessageController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setupViews];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

- (void)setupViews{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapViewController)];
    [self.view addGestureRecognizer:tap];

    self.tableView.estimatedRowHeight = 0;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.tableView.backgroundColor = MessageViewColor;
    [self.tableView registerClass:[IMMessageCell class] forCellReuseIdentifier:@"IMMessageCell"];

    _heightCache = [NSMutableArray array];
    _uiMsgs = [[NSMutableArray alloc] init];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _uiMsgs.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height = 0;
    if(_heightCache.count > indexPath.row){
        return [_heightCache[indexPath.row] floatValue];
    }
    ChatMessageData *data = _uiMsgs[indexPath.row];
//    height = [data heightOfWidth:Screen_Width];
    height = data.contentSize.height;
    [_heightCache insertObject:[NSNumber numberWithFloat:height] atIndex:indexPath.row];
    return height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ChatMessageData *data = _uiMsgs[indexPath.row];
    IMMessageCell *messageCell = nil;
    
    messageCell =(IMMessageCell *)[tableView dequeueReusableCellWithIdentifier:@"IMMessageCell" forIndexPath:indexPath];
    [messageCell fillWithData:data];
    
    return messageCell;
    
 }
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//}

- (void)scrollToBottom:(BOOL)animate{
    if (_uiMsgs.count > 0) {
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:_uiMsgs.count - 1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:animate];
    }
}

- (void)didTapViewController
{
    if(_delegate && [_delegate respondsToSelector:@selector(didTapInMessageController:)]){
        [_delegate didTapInMessageController:self];
    }
}

- (void)sendMessage:(ChatMessageData *)msg
{
    [self.tableView beginUpdates];
    [_uiMsgs addObject:msg];
    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:_uiMsgs.count - 1 inSection:0]]
                          withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView endUpdates];
    [self scrollToBottom:YES];
  
}
 

@end
