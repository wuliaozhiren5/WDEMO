//
//  TUIMessageController.m
//  UIKit
//
//  Created by annidyfeng on 2019/7/1.
//  Copyright © 2018年 Tencent. All rights reserved.
//

#import "MessageController.h"
//#import "TUITextMessageCell.h"
//#import "TUISystemMessageCell.h"
//#import "TUIVoiceMessageCell.h"
//#import "TUIImageMessageCell.h"
//#import "TUIFaceMessageCell.h"
//#import "TUIVideoMessageCell.h"
//#import "TUIFileMessageCell.h"
//#import "TUIJoinGroupMessageCell.h"
//#import "TUIKitConfig.h"
//#import "TUIFaceView.h"
//#import "ChatHeader.h"
//#import "TUIKit.h"
//#import "THelper.h"
//#import "TUIConversationCellData.h"
//#import "TIMMessage+DataProvider.h"
//#import "TUIImageViewController.h"
//#import "TUIVideoViewController.h"
//#import "TUIFileViewController.h"
//#import "NSString+TUICommon.h"
//#import "ReactiveObjC/ReactiveObjC.h"
//#import "MMLayout/UIView+MMLayout.h"
//#import "TIMMessage+DataProvider.h"
//#import "TUIUserProfileControllerServiceProtocol.h"



 
#import "ChatHeader.h"
//#import "TUIMessageCell.h"
#import "ChatMessageData.h"
//#import "TUITextMessageCell.h"
//#import "TUIFaceMessageCell.h"
#import "IMMessageCell.h"
#import "ChatMessageData.h"



//#import <ImSDK/ImSDK.h>

#define MAX_MESSAGE_SEP_DLAY (5 * 60)

@interface MessageController ()
///<TMessageCellDelegate>
//@property (nonatomic, strong) TUIConversationCellData *conversationData;
@property (nonatomic, strong) NSMutableArray *uiMsgs;
@property (nonatomic, strong) NSMutableArray *heightCache;
//@property (nonatomic, strong) V2TIMMessage *msgForDate;
//@property (nonatomic, strong) V2TIMMessage *msgForGet;
//@property (nonatomic, strong) TUIMessageCellData *menuUIMsg;
//@property (nonatomic, strong) TUIMessageCellData *reSendUIMsg;
//@property (nonatomic, strong) UIActivityIndicatorView *indicatorView;
//@property (nonatomic, assign) BOOL isScrollBottom;
//@property (nonatomic, assign) BOOL isLoadingMsg;
//@property (nonatomic, assign) BOOL isInVC;
//@property (nonatomic, assign) BOOL isActive;
//@property (nonatomic, assign) BOOL noMoreMsg;
//@property (nonatomic, assign) BOOL firstLoad;
@end

@implementation MessageController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupViews];
    //    self.isActive = YES;
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewWillAppear:(BOOL)animated
{
    //    self.isInVC = YES;
    //    [self readedReport];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    //    self.isInVC = NO;
    //    [self readedReport];
    [super viewWillDisappear:animated];
}
//
//- (void)readedReport
//{
//    if (self.isInVC && self.isActive) {
//        NSString *userID = self.conversationData.userID;
//        if (userID.length > 0) {
//            [[V2TIMManager sharedInstance] markC2CMessageAsRead:userID succ:^{
//                
//            } fail:^(int code, NSString *msg) {
//                
//            }];
//        }
//        NSString *groupID = self.conversationData.groupID;
//        if (groupID.length > 0) {
//            [[V2TIMManager sharedInstance] markGroupMessageAsRead:groupID succ:^{
//                
//            } fail:^(int code, NSString *msg) {
//                
//            }];
//        }
//    }
//}
//
//- (void)applicationBecomeActive
//{
//    self.isActive = YES;
//    [self readedReport];
//}
//
//- (void)applicationEnterBackground
//{
//    self.isActive = NO;
//}
//
- (void)setupViews
{
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationBecomeActive) name:UIApplicationDidBecomeActiveNotification object:nil];
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationBecomeActive) name:UIApplicationWillEnterForegroundNotification object:nil];
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationEnterBackground) name: UIApplicationDidEnterBackgroundNotification object:nil];
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onNewMessage:) name:TUIKitNotification_TIMMessageListener object:nil];
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onRevokeMessage:) name:TUIKitNotification_TIMMessageRevokeListener object:nil];
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didRecvMessageReceipts:) name:TUIKitNotification_onRecvMessageReceipts object:nil];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapViewController)];
    [self.view addGestureRecognizer:tap];
    
    self.tableView.estimatedRowHeight = 0;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.tableView.backgroundColor = MessageViewColor;

 
    //
//    [self.tableView registerClass:[TUITextMessageCell class] forCellReuseIdentifier:TTextMessageCell_ReuseId];
    //    [self.tableView registerClass:[TUIVoiceMessageCell class] forCellReuseIdentifier:TVoiceMessageCell_ReuseId];
    //    [self.tableView registerClass:[TUIImageMessageCell class] forCellReuseIdentifier:TImageMessageCell_ReuseId];
    //    [self.tableView registerClass:[TUISystemMessageCell class] forCellReuseIdentifier:TSystemMessageCell_ReuseId];
//    [self.tableView registerClass:[TUIFaceMessageCell class] forCellReuseIdentifier:TFaceMessageCell_ReuseId];
    //    [self.tableView registerClass:[TUIVideoMessageCell class] forCellReuseIdentifier:TVideoMessageCell_ReuseId];
    //    [self.tableView registerClass:[TUIFileMessageCell class] forCellReuseIdentifier:TFileMessageCell_ReuseId];
    //    [self.tableView registerClass:[TUIJoinGroupMessageCell class] forCellReuseIdentifier:TJoinGroupMessageCell_ReuseId];
    
    [self.tableView registerClass:[IMMessageCell class] forCellReuseIdentifier:@"IMMessageCell"];
    
    //
    //    _indicatorView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, TMessageController_Header_Height)];
    //    _indicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    //    self.tableView.tableHeaderView = _indicatorView;
    //
    _heightCache = [NSMutableArray array];
    _uiMsgs = [[NSMutableArray alloc] init];
    //    _firstLoad = YES;
}
//
//- (void)setConversation:(TUIConversationCellData *)conversationData
//{
//    self.conversationData = conversationData;
//    [self loadMessage];
//}
//
//- (void)loadMessage
//{
//    if(_isLoadingMsg || _noMoreMsg){
//        return;
//    }
//    _isLoadingMsg = YES;
//    int msgCount = 20;
//
//    @weakify(self)
//    if (self.conversationData.userID.length > 0) {
//        [[V2TIMManager sharedInstance] getC2CHistoryMessageList:self.conversationData.userID count:msgCount lastMsg:self.msgForGet succ:^(NSArray<V2TIMMessage *> *msgs) {
//            @strongify(self)
//            [self getMessages:msgs msgCount:msgCount];
//        } fail:^(int code, NSString *msg) {
//            @strongify(self)
//            self.isLoadingMsg = NO;
//            [THelper makeToastError:code msg:msg];
//        }];
//    }
//    if (self.conversationData.groupID.length > 0) {
//        [[V2TIMManager sharedInstance] getGroupHistoryMessageList:self.conversationData.groupID count:msgCount lastMsg:self.msgForGet succ:^(NSArray<V2TIMMessage *> *msgs) {
//            @strongify(self)
//            [self getMessages:msgs msgCount:msgCount];
//        } fail:^(int code, NSString *msg) {
//            @strongify(self)
//            self.isLoadingMsg = NO;
//            [THelper makeToastError:code msg:msg];
//        }];
//    }
//}
//
//- (void)getMessages:(NSArray *)msgs msgCount:(int)msgCount
//{
//    if(msgs.count != 0){
//        self.msgForGet = msgs[msgs.count - 1];
//    }
//    NSMutableArray *uiMsgs = [self transUIMsgFromIMMsg:msgs];
//    dispatch_async(dispatch_get_main_queue(), ^{
//        if(msgs.count < msgCount){
//            self.noMoreMsg = YES;
//            self.indicatorView.mm_h = 0;
//        }
//        if(uiMsgs.count != 0){
//            NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, uiMsgs.count)];
//            [self.uiMsgs insertObjects:uiMsgs atIndexes:indexSet];
//            [self.heightCache removeAllObjects];
//            [self.tableView reloadData];
//            [self.tableView layoutIfNeeded];
//            if(!self.firstLoad){
//                CGFloat visibleHeight = 0;
//                for (NSInteger i = 0; i < uiMsgs.count; ++i) {
//                    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
//                    visibleHeight += [self tableView:self.tableView heightForRowAtIndexPath:indexPath];
//                }
//                if(self.noMoreMsg){
//                    visibleHeight -= TMessageController_Header_Height;
//                }
//                [self.tableView scrollRectToVisible:CGRectMake(0, self.tableView.contentOffset.y + visibleHeight, self.tableView.frame.size.width, self.tableView.frame.size.height) animated:NO];
//            }
//        }
//        self.isLoadingMsg = NO;
//        [self.indicatorView stopAnimating];
//        self.firstLoad = NO;
//    });
//}
//
//- (void)onNewMessage:(NSNotification *)notification
//{
//    V2TIMMessage *msg = notification.object;
//    NSMutableArray *uiMsgs = [self transUIMsgFromIMMsg:@[msg]];
//    if (uiMsgs.count > 0) {
//        //生成需要插入的 index。即行号从 _uiMsgs.count - 1到 _uiMsgs.count + uiMsgs.count +1。 section 恒为 0。
//        [self.tableView beginUpdates];
//        for (TUIMessageCellData *uiMsg in uiMsgs) {
//            [self.uiMsgs addObject:uiMsg];
//            [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:_uiMsgs.count - 1 inSection:0]]
//            withRowAnimation:UITableViewRowAnimationFade];
//        }
//        [self.tableView endUpdates];
//        [self scrollToBottom:YES];
//        [self readedReport];
//    }
//}
//
//- (void)onRevokeMessage:(NSNotification *)notification
//{
//    NSString *msgID = notification.object;
//    TUIMessageCellData *uiMsg = nil;
//    for (uiMsg in _uiMsgs) {
//        if ([uiMsg.msgID isEqualToString:msgID]) {
//            dispatch_async(dispatch_get_main_queue(), ^{
//                [self revokeMsg:uiMsg];
//            });
//            break;
//        }
//    }
//}
//
//- (NSMutableArray *)transUIMsgFromIMMsg:(NSArray *)msgs
//{
//    NSMutableArray *uiMsgs = [NSMutableArray array];
//    for (NSInteger k = msgs.count - 1; k >= 0; --k) {
//        V2TIMMessage *msg = msgs[k];
//        if (![msg.userID isEqualToString:self.conversationData.userID] && ![msg.groupID isEqualToString:self.conversationData.groupID]) {
//            continue;
//        }
//        // 时间信息
//        TUISystemMessageCellData *dateMsg = [self transSystemMsgFromDate:msg.timestamp];
//        if (dateMsg) {
//            _msgForDate = msg;
//            [uiMsgs addObject:dateMsg];
//        }
//        // 撤回的消息
//        if(msg.status == V2TIM_MSG_STATUS_LOCAL_REVOKED){
//            TUISystemMessageCellData *revoke = [msg revokeCellData];
//            if(revoke)
//                [uiMsgs addObject:revoke];
//            continue;
//        }
//        // 自定义的消息
//        if ([self.delegate respondsToSelector:@selector(messageController:onNewMessage:)]) {
//            TUIMessageCellData *data = [self.delegate messageController:self onNewMessage:msg];
//            if (data) {
//                [uiMsgs addObject:data];
//                continue;
//            }
//        }
//        TUIMessageCellData *data = [msg cellData];
//        if(msg.groupID.length > 0 && !msg.isSelf
//           && ![data isKindOfClass:[TUISystemMessageCellData class]]){
//            data.showName = YES;
//        }
//        if(data) {
//            data.innerMessage = msg;
//            data.msgID = msg.msgID;
//            data.direction = msg.isSelf ? MsgDirectionOutgoing : MsgDirectionIncoming;
//            data.identifier = msg.sender;
//            data.name = data.identifier;
//            if (msg.nameCard.length > 0) {
//                data.name = msg.nameCard;
//            } else if (msg.nickName.length > 0){
//                data.name = msg.nickName;
//            }
//            data.avatarUrl = [NSURL URLWithString:msg.faceURL];
//            switch (msg.status) {
//                case V2TIM_MSG_STATUS_SEND_SUCC:
//                    data.status = Msg_Status_Succ;
//                    break;
//                case V2TIM_MSG_STATUS_SEND_FAIL:
//                    data.status = Msg_Status_Fail;
//                    break;
//                case V2TIM_MSG_STATUS_SENDING:
//                    data.status = Msg_Status_Sending_2;
//                    break;
//                default:
//                    break;
//            }
//            [uiMsgs addObject:data];
//        }
//    }
//    return uiMsgs;
//}
//#pragma mark - Table view data source
//
//-(void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (_isScrollBottom == NO) {
//        [self scrollToBottom:NO];
//        if (indexPath.row == _uiMsgs.count-1) {
//            _isScrollBottom = YES;
//        }
//    }
//}
//
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _uiMsgs.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    

    ChatMessageData *data = _uiMsgs[indexPath.row];
//    TUIMessageCell *cell = nil;
//
        IMMessageCell *messageCell = nil;
//
//    //    if ([self.delegate respondsToSelector:@selector(messageController:onShowMessageData:)]) {
//    ////        cell = [self.delegate messageController:self onShowMessageData:data];
//    //        if (cell) {
//    //            cell.delegate = self;
//    //            return cell;
//    //        }
//    //    }
//    if (!data.reuseId) {
//
//                if([data isKindOfClass:[TUITextMessageCellData class]]) {
//                           data.reuseId = @"IMMessageCell";
//                       }
////        if([data isKindOfClass:[TUITextMessageCellData class]]) {
////            data.reuseId = TTextMessageCell_ReuseId;
////        }
////        else if([data isKindOfClass:[TUIFaceMessageCellData class]]) {
////            data.reuseId = TFaceMessageCell_ReuseId;
////        }
//        //        else if([data isKindOfClass:[TUIImageMessageCellData class]]) {
//        //            data.reuseId = TImageMessageCell_ReuseId;
//        //        }
//        //        else if([data isKindOfClass:[TUIVideoMessageCellData class]]) {
//        //            data.reuseId = TVideoMessageCell_ReuseId;
//        //        }
//        //        else if([data isKindOfClass:[TUIVoiceMessageCellData class]]) {
//        //            data.reuseId = TVoiceMessageCell_ReuseId;
//        //        }
//        //        else if([data isKindOfClass:[TUIFileMessageCellData class]]) {
//        //            data.reuseId = TFileMessageCell_ReuseId;
//        //        }
//        //        else if([data isKindOfClass:[TUIJoinGroupMessageCellData class]]){//入群小灰条对应的数据源
//        //            data.reuseId = TJoinGroupMessageCell_ReuseId;
//        //        }
//        //        else if([data isKindOfClass:[TUISystemMessageCellData class]]) {
//        //            data.reuseId = TSystemMessageCell_ReuseId;
//        //        }
//        else {
//            return nil;
//        }
//    }
//
//
////    cell = [tableView dequeueReusableCellWithIdentifier:data.reuseId forIndexPath:indexPath];
////    //对于入群小灰条，需要进一步设置其委托。
////    //    if([cell isKindOfClass:[TUIJoinGroupMessageCell class]]){
////    //        TUIJoinGroupMessageCell *joinCell = (TUIJoinGroupMessageCell *)cell;
////    //        joinCell.joinGroupDelegate = self;
////    //        cell = joinCell;
////    //    }
////    cell.delegate = self;
////    [cell fillWithData:_uiMsgs[indexPath.row]];
////    return cell;
//
//
        messageCell =(IMMessageCell *)[tableView dequeueReusableCellWithIdentifier:@"IMMessageCell" forIndexPath:indexPath];
        [messageCell fillWithData:_uiMsgs[indexPath.row]];

        return messageCell;
    
 }
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//}

- (void)scrollToBottom:(BOOL)animate
{
    if (_uiMsgs.count > 0) {
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:_uiMsgs.count - 1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:animate];
    }
}
//
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
    
    
    //    [self.tableView beginUpdates];
    //    V2TIMMessage *imMsg = msg.innerMessage;
    //    TUIMessageCellData *dateMsg = nil;
    //    if (msg.status == Msg_Status_Init)
    //    {
    //        //新消息
    //        if (!imMsg) {
    //            imMsg = [self transIMMsgFromUIMsg:msg];
    //        }
    //        dateMsg = [self transSystemMsgFromDate:imMsg.timestamp];
    //
    //    } else if (imMsg) {
    //        //重发
    //        dateMsg = [self transSystemMsgFromDate:[NSDate date]];
    //        NSInteger row = [_uiMsgs indexOfObject:msg];
    //        [_heightCache removeObjectAtIndex:row];
    //        [_uiMsgs removeObjectAtIndex:row];
    //        [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:row inSection:0]]
    //                              withRowAnimation:UITableViewRowAnimationFade];
    //    } else {
    //        [self.tableView endUpdates];
    //        NSLog(@"Unknown message state");
    //        return;
    //    }
    //    // 发消息
    //    @weakify(self)
    //    [[V2TIMManager sharedInstance] sendMessage:imMsg receiver:self.conversationData.userID groupID:self.conversationData.groupID priority:V2TIM_PRIORITY_DEFAULT onlineUserOnly:NO offlinePushInfo:nil progress:^(uint32_t progress) {
    //        @strongify(self)
    //        for (TUIMessageCellData *uiMsg in self.uiMsgs) {
    //            if ([uiMsg.innerMessage.msgID isEqualToString:imMsg.msgID]) {
    //                if([uiMsg isKindOfClass:[TUIImageMessageCellData class]]){
    //                    TUIImageMessageCellData *data = (TUIImageMessageCellData *)uiMsg;
    //                    data.uploadProgress = progress;
    //                }
    //                else if([uiMsg isKindOfClass:[TUIVideoMessageCellData class]]){
    //                    TUIVideoMessageCellData *data = (TUIVideoMessageCellData *)uiMsg;
    //                    data.uploadProgress = progress;
    //                }
    //                else if([uiMsg isKindOfClass:[TUIFileMessageCellData class]]){
    //                    TUIFileMessageCellData *data = (TUIFileMessageCellData *)uiMsg;
    //                    data.uploadProgress = progress;
    //                }
    //            }
    //        }
    //    } succ:^{
    //        @strongify(self)
    //        dispatch_async(dispatch_get_main_queue(), ^{
    //            [self changeMsg:msg status:Msg_Status_Succ];
    //        });
    //    } fail:^(int code, NSString *desc) {
    //        @strongify(self)
    //        dispatch_async(dispatch_get_main_queue(), ^{
    //            [THelper makeToastError:code msg:desc];
    //            [self changeMsg:msg status:Msg_Status_Fail];
    //        });
    //    }];
    //
    //    // 展示 UI 界面
    //    msg.status = Msg_Status_Sending;
    //    msg.name = [msg.innerMessage getShowName];
    //    msg.avatarUrl = [NSURL URLWithString:[msg.innerMessage faceURL]];
    //    if(dateMsg){
    //        _msgForDate = imMsg;
    //        [_uiMsgs addObject:dateMsg];
    //        [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:_uiMsgs.count - 1 inSection:0]]
    //                              withRowAnimation:UITableViewRowAnimationFade];
    //    }
    //    [_uiMsgs addObject:msg];
    //    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:_uiMsgs.count - 1 inSection:0]]
    //                          withRowAnimation:UITableViewRowAnimationFade];
    //    [self.tableView endUpdates];
    //    [self scrollToBottom:YES];
    //
    //    int delay = 1;
    //    if([msg isKindOfClass:[TUIImageMessageCellData class]]){
    //        delay = 0;
    //    }
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //        @strongify(self)
    //        if(msg.status == Msg_Status_Sending){
    //            [self changeMsg:msg status:Msg_Status_Sending_2];
    //        }
    //    });
}
 

@end
