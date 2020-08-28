//
//  ChatMessageController.m
//  WDEMO
//
//  Created by rrtv on 2020/7/27.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "ChatMessageController.h"
#import "ChatHeader.h"
#import "ChatMessageDataModel.h"
#import "ChatMessageCell.h"
#import "ChatMessageDataModel.h"


@interface ChatMessageController () <UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate>
@property (nonatomic, strong) NSMutableArray *uiMsgs;
@property (nonatomic, strong) NSMutableArray *heightCache;


@end

@implementation ChatMessageController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    [self setupViews];
}

- (void)keyboardWillHide:(NSNotification *)notification {
    self.chatMemberListView.hidden = NO;
}

- (void)keyboardWillShow:(NSNotification *)notification {
    self.chatMemberListView.hidden = YES;
}

- (void)keyboardWillChangeFrame:(NSNotification *)notification {
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)setupViews {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapViewController)];
    tap.delegate = self;
    [self.view addGestureRecognizer:tap];
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.tableView.backgroundColor = MessageViewColor;
    [self.tableView registerClass:[ChatMessageCell class] forCellReuseIdentifier:@"IMMessageCell"];
    [self.view addSubview:self.tableView];
    
    _heightCache = [NSMutableArray array];
    _uiMsgs = [[NSMutableArray alloc] init];
    
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(30, 30);
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 10;
    layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.chatMemberListView = [[ChatMemberListView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60) collectionViewLayout:layout];
    self.chatMemberListView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.chatMemberListView];
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
    messageCell =(ChatMessageCell *)[tableView dequeueReusableCellWithIdentifier:@"IMMessageCell" forIndexPath:indexPath];
    [messageCell fillWithData:data];
    
    return messageCell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}

- (void)scrollToBottom:(BOOL)animate {
    if (_uiMsgs.count > 0) {
        [self.tableView beginUpdates];

        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:_uiMsgs.count - 1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:animate];
         
         [self.tableView endUpdates];
        
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
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if([touch.view isDescendantOfView:self.chatMemberListView]){
        return NO;
    }
    return YES;
}
@end