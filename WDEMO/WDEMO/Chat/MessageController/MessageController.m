//
//  TUIMessageController.m
//  UIKit
//
//  Created by annidyfeng on 2019/7/1.
//  Copyright © 2018年 Tencent. All rights reserved.
//

#import "MessageController.h"
#import "ChatHeader.h"
#import "ChatMessageDataModel.h"
#import "ChatMessageCell.h"
#import "TipMessageCell.h"
#import "FaceMessageCell.h"
#import "EnterMessageCell.h"
#import <Masonry/Masonry.h>

#define MAX_MESSAGE_SEP_DLAY (5 * 60)

@interface MessageController ()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) NSMutableArray *uiMsgs;
@property (nonatomic, strong) NSMutableArray *heightCache;

@end

@implementation MessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isFull = NO;
    self.messageListCellWidth = HalfScreenChatViewWidth;
    [self setupViews];
}

- (void)dealloc {
    //    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)setupViews {
    //点击退出编辑模式
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapViewController)];
    tap.delegate = self;
    [self.view addGestureRecognizer:tap];
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    if (self.isFull) {
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    } else {
        //        播放器的高度          kPlayer_Height
        //        底部的输入框的高度     TTextView_Height
        //        安全区               Bottom_SafeHeight
//        self.tableView.frame = CGRectMake(0, 0, Screen_Width, Screen_Height - kPlayer_Height - TTextView_Height - Bottom_SafeHeight);
         
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    }

    
    self.tableView.estimatedRowHeight = 0;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.tableView.backgroundColor = [UIColor clearColor];
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    
    [self.tableView registerClass:[ChatMessageCell class] forCellReuseIdentifier:ChatMessageCell_ReuseId];
    [self.tableView registerClass:[TipMessageCell class] forCellReuseIdentifier:TipMessageCell_ReuseId];
    [self.tableView registerClass:[FaceMessageCell class] forCellReuseIdentifier:FaceMessageCell_ReuseId];
    [self.tableView registerClass:[EnterMessageCell class] forCellReuseIdentifier:EnterMessageCell_ReuseId];
    
    _heightCache = [NSMutableArray array];
    _uiMsgs = [[NSMutableArray alloc] init];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _uiMsgs.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = 0;
    if(_heightCache.count > indexPath.row){
        return [_heightCache[indexPath.row] floatValue];
    }
    ChatMessageDataModel *data = _uiMsgs[indexPath.row];
    //    height = [data heightOfWidth:Screen_Width];
    //    height = data.contentSize.height;
    if (_isFull) {
        height = [data heightOfWidth:TTextMessageCell_Text_Width_Max_Full_NEW(self.messageListCellWidth)];
    } else {
        height = [data heightOfWidth:TTextMessageCell_Text_Width_Max_Half_NEW(self.messageListCellWidth)];
    }
    [_heightCache insertObject:[NSNumber numberWithFloat:height] atIndex:indexPath.row];
    return height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ChatMessageDataModel *data = _uiMsgs[indexPath.row];
    ChatMessageCell *messageCell = nil;
//    data.type = ChatMessageTypeFace;
//    data.type = ChatMessageTypeTip;
//    data.type = ChatMessageTypeEnter;
    
    NSString *reuseId = nil;
    switch (data.type) {
        case ChatMessageTypeTip:
            reuseId = TipMessageCell_ReuseId;
            break;
        case ChatMessageTypeFace:
            reuseId = FaceMessageCell_ReuseId;
            break;
        case ChatMessageTypeEnter:
            reuseId = EnterMessageCell_ReuseId;
            break;
        default:
            reuseId = ChatMessageCell_ReuseId;
            break;
    }
    
    messageCell = (ChatMessageCell *)[tableView dequeueReusableCellWithIdentifier:reuseId forIndexPath:indexPath];
    messageCell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (_isFull) {
        messageCell.cellWidth = TTextMessageCell_Text_Width_Max_Full_NEW(self.messageListCellWidth);
    } else {
        messageCell.cellWidth = TTextMessageCell_Text_Width_Max_Half_NEW(self.messageListCellWidth);
    }
    
    
    if ([data isMemberOfClass:NSClassFromString(@"ChatMessageDataModel")]) {
        [messageCell fillWithData:data];
    } else if ([data isKindOfClass:NSClassFromString(@"ChatMessageYYDataModel")]) {
        ChatMessageYYDataModel *cellData = (ChatMessageYYDataModel *)data;
        [messageCell fillWithYYData:cellData];
        //        __weak __typeof(self) ws = self;
        cellData.clickNickName = ^() {
            NSLog(@"MessageController：点击了用户昵称:YYLabel");
        };
        //        __weak __typeof(self) ws = self;;
        //        data.clickNickName = ^(RRIMUser *user) {
        //            //NSLog(@"点击了用户昵称");
        //            [ws didSelectUserNickName:user];
        //        };
    } else {
    }
     
    return messageCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

- (void)didSelectUserNickName:(id)user{
    NSLog(@"MessageController：点击了用户昵称:YYLabel");
}

- (void)scrollToBottom:(BOOL)animate {
    if (_uiMsgs.count > 0) {
        NSInteger count = _uiMsgs.count;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.02 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:count - 1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:animate];
        });
    }
}

- (void)didTapViewController {
    
    if(_delegate && [_delegate respondsToSelector:@selector(didTapInMessageController:)]){
        [_delegate didTapInMessageController:self];
    }
}

- (void)sendMessages:(NSArray *)msgs {
    _uiMsgs = [msgs mutableCopy];
    [self.tableView reloadData];
    [self scrollToBottom:NO];
}

- (void)sendMessage:(ChatMessageDataModel *)msg {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView beginUpdates];
        [_uiMsgs addObject:msg];
        [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:_uiMsgs.count - 1 inSection:0]]
                              withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView endUpdates];
        [self scrollToBottom:YES];
    });
}

#pragma mark - UIGestureRecognizerDelegate
#pragma mark- --点击手势代理，为了去除手势冲突--
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
//    if([touch.view isDescendantOfView:self.chatMemberListView]){
//        return NO;
//    }
//    return YES;
//}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    // 点击的view的类名
    NSLog(@"%@", NSStringFromClass([touch.view class]));
    // 点击了tableViewCell，view的类名为UITableViewCellContentView，则不接收Touch点击事件
    //    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]) {
    //        return NO;
    //    }
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"YYLabel"]) {
        return NO;
    }
    return  YES;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self didTapViewController];
}
@end
