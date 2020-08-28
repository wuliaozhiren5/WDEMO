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
//为了渐变图层
//渐变效果
@property (nonatomic, strong) CAGradientLayer *gradient;
@end

@implementation MessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(TResponderTextViewboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    [self setupViews];
}

//- (void)keyboardWillHide:(NSNotification *)notification {
//    self.chatMemberListView.hidden = NO;
//}
//
//- (void)keyboardWillShow:(NSNotification *)notification {
//    self.chatMemberListView.hidden = YES;
//}
//
//- (void)keyboardWillChangeFrame:(NSNotification *)notification {
//}

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
    
    //为了渐变图层
//    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
//    self.tableView.dataSource = self;
//    self.tableView.delegate = self;
//    [self.view addSubview:self.tableView];
//    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view);
//    }];
    
    self.tableView.estimatedRowHeight = 0;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.tableView.backgroundColor = [UIColor clearColor];
//    self.tableView.backgroundColor = MessageViewColor;
    
    [self.tableView registerClass:[ChatMessageCell class] forCellReuseIdentifier:ChatMessageCell_ReuseId];
    [self.tableView registerClass:[TipMessageCell class] forCellReuseIdentifier:TipMessageCell_ReuseId];
    [self.tableView registerClass:[FaceMessageCell class] forCellReuseIdentifier:FaceMessageCell_ReuseId];
    [self.tableView registerClass:[EnterMessageCell class] forCellReuseIdentifier:EnterMessageCell_ReuseId];
    
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 54)];
    self.tableView.tableHeaderView = headerView;
    
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 24)];
    self.tableView.tableFooterView = footerView;
    
    _heightCache = [NSMutableArray array];
    _uiMsgs = [[NSMutableArray alloc] init];

    //为了渐变图层
    //[self creatColorView];

}

//为了渐变图层
//- (void)creatColorView {
//    CGFloat startPoint = 60.0 / self.tableView.superview.bounds.size.height;
//    CGFloat endPoint = 120 / self.tableView.superview.bounds.size.height;
//    //渐变背景
//    CAGradientLayer *gradient = [CAGradientLayer layer];
//    gradient.frame = self.tableView.superview.bounds;
//    gradient.colors = @[(id)[UIColor clearColor].CGColor,(id)[UIColor blackColor].CGColor];
//    gradient.startPoint = CGPointMake(0, startPoint);
//    gradient.endPoint = CGPointMake(0, endPoint);
//    _gradient = gradient;
//
//    [self addGradient];
//}
//
//- (void)addGradient {
//   self.tableView.superview.layer.mask = _gradient;
//}
//
//- (void)removeGradient {
//   self.tableView.superview.layer.mask = nil;
//}

-(void)setHiddenHeader:(BOOL)hiddenHeader {
    _hiddenHeader = hiddenHeader;
    if (!_hiddenHeader) {
        UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 54)];
        self.tableView.tableHeaderView = headerView;
        //为了渐变图层
//        [self addGradient];
    } else {
        UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        self.tableView.tableHeaderView = headerView;
        //为了渐变图层
//        [self removeGradient];
    }
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
    height = data.contentSize.height;
    [_heightCache insertObject:[NSNumber numberWithFloat:height] atIndex:indexPath.row];
    return height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ChatMessageDataModel *data = _uiMsgs[indexPath.row];
    ChatMessageCell *messageCell = nil;
    
    data.type = ChatMessageTypeTextFace;
//    data.type = ChatMessageTypeTip;
//        data.type = ChatMessageTypeEnter;
    
    NSString *reuseId = nil;
    switch (data.type) {
        case ChatMessageTypeTip:
            reuseId = TipMessageCell_ReuseId;
            break;
        case ChatMessageTypeTextFace:
            reuseId = FaceMessageCell_ReuseId;
            break;
        case ChatMessageTypeEnter:
            reuseId = EnterMessageCell_ReuseId;
            break;
        default:
            reuseId = ChatMessageCell_ReuseId;
            break;
    }
    
  
    messageCell =(ChatMessageCell *)[tableView dequeueReusableCellWithIdentifier:reuseId forIndexPath:indexPath];
    messageCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if ([data isMemberOfClass:NSClassFromString(@"ChatMessageYYDataModel")]) {
        
        ChatMessageYYDataModel *cellData = (ChatMessageYYDataModel *)data;
        [messageCell fillWithYYData:cellData];
      
//        __weak __typeof(self) ws = self;
        cellData.clickNickName = ^() {
            NSLog(@"点击了用户昵称:YYLabel");
        };
//        __weak __typeof(self) ws = self;;
//        data.clickNickName = ^(RRIMUser *user) {
//            //NSLog(@"点击了用户昵称");
//            [ws didSelectUserNickName:user];
//        };
        
    } else if ([data isMemberOfClass:NSClassFromString(@"ChatMessageDataModel")]) {
        [messageCell fillWithData:data];
    }else {
        
    }
    
    return messageCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)scrollToBottom:(BOOL)animate {
    if (_uiMsgs.count > 0) {
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:_uiMsgs.count - 1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:animate];
    }
}

- (void)didTapViewController {
    
    if(_delegate && [_delegate respondsToSelector:@selector(didTapInMessageController:)]){
        [_delegate didTapInMessageController:self];
    }
}

- (void)sendMessage:(ChatMessageDataModel *)msg {
    [self.tableView beginUpdates];
    [_uiMsgs addObject:msg];
    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:_uiMsgs.count - 1 inSection:0]]
                          withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView endUpdates];
    [self scrollToBottom:YES];
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
