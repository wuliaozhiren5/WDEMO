//
//  ChatManager.m
//  PUClient
//
//  Created by WDEMO on 2020/9/7.
//  Copyright © 2020 RRMJ. All rights reserved.
//

#import "ChatManager.h"
#import "ChatMessageYYDataModel.h"
#import "TipMessageDataModel.h"
#import "EnterMessageDataModel.h"
#import "FaceMessageDataModel.h"
#import "ChatController.h"
#import "FullScreenChatController.h"
@interface ChatManager ()
 
@property (nonatomic, copy, readwrite) NSArray *msgsArray;

@property (nonatomic, copy, readwrite) NSArray *membersArray;

@property (nonatomic, strong) NSOperationQueue *queue;

@end

@implementation ChatManager
- (instancetype)init{
    self = [super init];
    if (self) {
        self.unreadMessageCount = 0;
    }
    return self;
}
 
- (void)sendMessage:(ChatMessageDataModel *)message {
//    message.creatorId = _roomModel.creatorId;
    //    [self.msgsArray addObject:msg];
    NSMutableArray *temp = [NSMutableArray arrayWithArray:self.msgsArray];
    [temp addObject:message];
    self.msgsArray = temp;

    [_halfChat sendMessage:message];
    [_fullChat sendMessage:message];
//    self.unreadMessageCount += 1;
}

- (void)sendMessages:(NSArray<ChatMessageDataModel*> *)msgArray {
    __weak __typeof(self) ws = self;
    for (ChatMessageDataModel *message in msgArray) {
        [self.queue addOperationWithBlock:^{
            [ws sendMessage:message];
        }];
    }
}

//- (void)setMembers:(NSArray<RRIMUser*> *)userArray {
//    if (self.resetUserListNextTime) {
//        WS(weakSelf);
//        [self.queue addOperations:@[[NSBlockOperation blockOperationWithBlock:^{
//            weakSelf.membersArray = nil;
//        }]] waitUntilFinished:YES];
//        self.resetUserListNextTime = NO;
//    }
//    [self addMembers:userArray];
//}
//
//- (void)addMembers:(NSArray<RRIMUser*>*)userArray {
//    if (!userArray.count) {
//        return;
//    }
//    __weak __typeof(self) ws = self;
//    [self.queue addOperationWithBlock:^{
//        NSMutableArray<RRIMUser*> *usersToAdd = [NSMutableArray array];
//        [userArray enumerateObjectsUsingBlock:^(RRIMUser * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            if (![ws.membersArray containsObject:obj]) {
//                [usersToAdd addObject:obj];
//            }
//        }];
//        NSMutableArray *members = [ws.membersArray mutableCopy] ?: [NSMutableArray array];
//        if (usersToAdd.count) {
//            [members insertObjects:usersToAdd atIndex:0];
//            NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"joinTime" ascending:NO];
//            [members sortUsingDescriptors:[NSArray arrayWithObject:sort]];
//        }
//        ws.membersArray = [members copy];
//        self.halfChat.chatMemberListView.membersArray = ws.membersArray;
//
//    }];
//}
//
//- (void)deleteMembers:(NSArray<RRIMUser*>*)userArray{
//    if (!_membersArray.count) {
//        return;
//    }
//    __weak __typeof(self) ws = self;
//    [self.queue addOperationWithBlock:^{
//        NSMutableArray<RRIMUser*> *usersToDel = [NSMutableArray array];
//        [ws.membersArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            if ([userArray containsObject:obj]) {
//                [usersToDel addObject:obj];
//            }
//            if (userArray.count == usersToDel.count) {
//                *stop = YES;
//            }
//        }];
//        NSMutableArray *members = [ws.membersArray mutableCopy];
//        if (usersToDel.count) {
//            [members removeObjectsInArray:usersToDel];
//        }
//        ws.membersArray = [members copy];
//        self.halfChat.chatMemberListView.membersArray = ws.membersArray;
//    }];
//}
 
//- (void)fullChatControllerSetChatMessage {
//    [_fullChat.messageController sendMessages:self.msgsArray];
//    if (_halfChat && _halfChat.delegate) {
//        _fullChat.delegate = _halfChat.delegate;
//    }
//}

- (void)createHalfChat {
     _halfChat = [[ChatController alloc] init];
}

//- (ChatController *)createHalfChat {
////    _halfChat = [[ChatController alloc] init];
//    if (!_halfChat) {
//        _halfChat = [[ChatController alloc] init];
//    }
//    return _halfChat;
//}
//
//- (FullScreenChatController *)createFullChat {
////    _halfChat = [[ChatController alloc] init];
//    _fullChat = [[FullScreenChatController alloc] initWithMessages:self.msgsArray];
////    _fullChat.view.frame = CGRectMake(0, 0, Screen_Width, Screen_Height);
//    if (_halfChat && _halfChat.delegate) {
//        _fullChat.delegate = _halfChat.delegate;
//    }
//}
- (void)createFullChat {
    _fullChat = [[FullScreenChatController alloc] initWithMessages:self.msgsArray];
//    _fullChat.view.frame = CGRectMake(0, 0, Screen_Width, Screen_Height);
    if (_halfChat && _halfChat.delegate) {
        _fullChat.delegate = _halfChat.delegate;
    }
}

- (void)readMessage {
    self.unreadMessageCount = 0;
}

- (void)removeFullChat {
    [_fullChat.view removeFromSuperview];
    _fullChat = nil;
}

- (void)chatControllerKeyboardReset {
    [_halfChat keyboardReset];
    [_fullChat keyboardReset];
}

- (BOOL)isInputEditing {
    BOOL isInputEditing = NO;
    BOOL halfInputEditing = _halfChat.isInputEditing;
    BOOL fullInputEditing = _fullChat.isInputEditing;
    if (halfInputEditing || fullInputEditing) {
        isInputEditing = YES;
    } else {
        isInputEditing = NO;
    }
    return isInputEditing;
}

- (NSOperationQueue *)queue {
    if (!_queue) {
        _queue = [[NSOperationQueue alloc] init];
        _queue.maxConcurrentOperationCount = 1;
    }
    return _queue;
}

//- (ChatController *)halfChat {
//    if (!_halfChat) {
//        _halfChat =  [[ChatController alloc] init];
////        _halfChat.delegate = self;
////        _halfChat.roomModel = self.roomModel;
//    }
//    return _halfChat;
//}
//
//- (FullScreenChatController *)fullChat {
//    if (!_fullChat) {
//        _fullChat = [[FullScreenChatController alloc] init];
////        _fullChat.delegate = self;
//     }
//    return _fullChat;
//}



@end
