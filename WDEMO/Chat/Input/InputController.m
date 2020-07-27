//
//  TInputController.m
//  UIKit
//
//  Created by kennethmiao on 2018/9/18.
//  Copyright © 2018年 Tencent. All rights reserved.
//

#import "InputController.h"
#import "FaceCell.h"
#import "ChatHeader.h"
#import "ChatKit.h"
#import "ChatMessageDataModel.h"
#import "NSAttributedString+FaceString.h"
#import "UIImage+ChatKit.h"
#import "NoInputBar.h"

typedef NS_ENUM(NSUInteger, InputStatus) {
    Input_Status_Input,
    Input_Status_Input_Face,
    Input_Status_Input_More,
    Input_Status_Input_Keyboard,
    Input_Status_Input_Talk,
};

@interface InputController () <TTextViewDelegate, TFaceViewDelegate>

@property (nonatomic, assign) InputStatus status;

//假的inputview
@property (nonatomic, strong) NoInputBar *bottomBar;

@end

@implementation InputController
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupViews];
}
- (void)viewWillAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    for (UIGestureRecognizer *gesture in self.view.window.gestureRecognizers) {
        NSLog(@"gesture = %@",gesture);
        gesture.delaysTouchesBegan = NO;
        NSLog(@"delaysTouchesBegan = %@",gesture.delaysTouchesBegan?@"YES":@"NO");
        NSLog(@"delaysTouchesEnded = %@",gesture.delaysTouchesEnded?@"YES":@"NO");
    }
    self.navigationController.interactivePopGestureRecognizer.delaysTouchesBegan = NO;
}

- (void)viewDidDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setupViews
{
    //    self.view.backgroundColor = [UIColor d_colorWithColorLight:TInput_Background_Color dark:TInput_Background_Color_Dark];
    _status = Input_Status_Input;
    _inputBar = [[InputBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, TTextView_Height)];
    _inputBar.delegate = self;
    [self.view addSubview:_inputBar];

    _bottomBar = [[NoInputBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, TTextView_Height)];
    _bottomBar.backgroundColor = InputBarColor;
    [self.view addSubview:_bottomBar];
 
    [_bottomBar.faceButton addTarget:self action:@selector(clickBottomBarFaceBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_bottomBar.textViewBtn addTarget:self action:@selector(clickBottomBarTextViewBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_bottomBar.playListBtn addTarget:self action:@selector(clickBottomBarPlayListBtn:) forControlEvents:UIControlEventTouchUpInside];
     
    _bottomBar.hidden = NO;
    _inputBar.inputTextView.hidden = YES;
 
}

- (void)clickBottomBarFaceBtn:(UIButton *)sender {
    _bottomBar.hidden = YES;
    [_inputBar clickFaceBtn:sender];
}

- (void)clickBottomBarTextViewBtn:(UIButton *)sender {
    _bottomBar.hidden = YES;
    [_inputBar clickKeyboardBtn:sender];
}

- (void)clickBottomBarPlayListBtn:(UIButton *)sender {
  
}
 
- (void)keyboardWillHide:(NSNotification *)notification
{ 
    if (_delegate && [_delegate respondsToSelector:@selector(inputController:didChangeHeight:)]){
        [_delegate inputController:self didChangeHeight:_inputBar.frame.size.height + Bottom_SafeHeight];
    }
}

- (void)keyboardWillShow:(NSNotification *)notification
{
    if(_status == Input_Status_Input_Face){
        [self hideFaceAnimation];
    }
    else if(_status == Input_Status_Input_More){
        //        [self hideMoreAnimation];
    }
    else{
        //[self hideFaceAnimation:NO];
        //[self hideMoreAnimation:NO];
    }
    _status = Input_Status_Input_Keyboard;
}

- (void)keyboardWillChangeFrame:(NSNotification *)notification
{
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    if (_delegate && [_delegate respondsToSelector:@selector(inputController:didChangeHeight:)]){
        [_delegate inputController:self didChangeHeight:keyboardFrame.size.height + _inputBar.frame.size.height];
    }
    
}
//
- (void)hideFaceAnimation
{
    self.faceView.hidden = NO;
    self.faceView.alpha = 1.0;
    
    __weak __typeof(self) ws = self;
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        ws.faceView.alpha = 0.0;
    } completion:^(BOOL finished) {
        ws.faceView.hidden = YES;
        ws.faceView.alpha = 1.0;
        
        [ws.faceView removeFromSuperview];
    }];
}

- (void)showFaceAnimation
{
    [self.view addSubview:self.faceView];
    [_faceView showButton:_inputBar.inputTextView.text];
    
    self.faceView.hidden = NO;
    CGRect frame = self.faceView.frame;
    frame.origin.y = Screen_Height;
    self.faceView.frame = frame;
    
    frame.origin.y = self.faceView.frame.origin.y + self.faceView.frame.size.height;
    
    __weak __typeof(self) ws = self;;
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        CGRect newFrame = ws.faceView.frame;
        newFrame.origin.y = ws.inputBar.frame.origin.y + ws.inputBar.frame.size.height;
        ws.faceView.frame = newFrame;
        
        newFrame.origin.y = ws.faceView.frame.origin.y + ws.faceView.frame.size.height;
    } completion:nil];
}

- (void)inputBarDidTouchFace:(InputBar *)textView
{
    if([ChatKit sharedInstance].config.faceGroups.count == 0){
        return;
    }
    if(_status == Input_Status_Input_More){
        //        [self hideMoreAnimation];
    }
    [_inputBar.inputTextView resignFirstResponder];
    [self showFaceAnimation];
    _status = Input_Status_Input_Face;
    if (_delegate && [_delegate respondsToSelector:@selector(inputController:didChangeHeight:)]){
        [_delegate inputController:self didChangeHeight:_inputBar.frame.size.height + self.faceView.frame.size.height  + Bottom_SafeHeight];
    }
}

- (void)inputBarDidTouchKeyboard:(InputBar *)textView
{
    if(_status == Input_Status_Input_More){
        //        [self hideMoreAnimation];
    }
    if (_status == Input_Status_Input_Face) {
        [self hideFaceAnimation];
    }
    _status = Input_Status_Input_Keyboard;
    [_inputBar.inputTextView becomeFirstResponder];
}

- (void)inputBar:(InputBar *)textView didChangeInputHeight:(CGFloat)offset
{
    if(_status == Input_Status_Input_Face){
        [self showFaceAnimation];
    }
    else if(_status == Input_Status_Input_More){
        //        [self showMoreAnimation];
    }
    if (_delegate && [_delegate respondsToSelector:@selector(inputController:didChangeHeight:)]){
        [_delegate inputController:self didChangeHeight:self.view.frame.size.height + offset];
    }
}
- (void)inputBarTextViewDidChange:(InputBar *)textView {
    NSString *str = textView.inputTextView.text;
    [_faceView showButton:str];
    
}

- (void)inputBar:(InputBar *)textView didSendText:(NSString *)text
{
    //发送消息
    //    TUITextMessageCellData *data = [[TUITextMessageCellData alloc] initWithDirection:MsgDirectionOutgoing];
    //    data.content = text;
    //    if(_delegate && [_delegate respondsToSelector:@selector(inputController:didSendMessage:)]){
    //        [_delegate inputController:self didSendMessage:data];
    //    }
    
    ChatMessageDataModel *data = [[ChatMessageDataModel alloc] init];
    data.content = text;
    if(_delegate && [_delegate respondsToSelector:@selector(inputController:didSendMessage:)]){
        [_delegate inputController:self didSendMessage:data];
    }
    
}


- (void)reset {
    if(_status == Input_Status_Input){
        return;
    }
    else if(_status == Input_Status_Input_More){
        //        [self hideMoreAnimation];
    }
    else if(_status == Input_Status_Input_Face){
        [self hideFaceAnimation];
    }
    _status = Input_Status_Input;
    [_inputBar.inputTextView resignFirstResponder];
    if (_delegate && [_delegate respondsToSelector:@selector(inputController:didChangeHeight:)]){
        [_delegate inputController:self didChangeHeight:_inputBar.frame.size.height + Bottom_SafeHeight];
    }
    
    _bottomBar.hidden = NO;
    _inputBar.inputTextView.hidden = YES;
    
}



- (void)faceView:(FaceView *)faceView scrollToFaceGroupIndex:(NSInteger)index
{
    //    [self.menuView scrollToMenuIndex:index];
}

- (void)faceViewDidBackDelete:(FaceView *)faceView
{
    [_inputBar backDelete];
}
- (void)faceViewSendMessage:(FaceView *)faceView
{
    //发送消息
    NSString *text =  [_inputBar.inputTextView.attributedText toString];
    
    NSString *sp = [text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if (sp.length == 0) {
        //         UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"不能发送空白消息" message:nil preferredStyle:UIAlertControllerStyleAlert];
        //         [ac addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        //                [self.mm_viewController presentViewController:ac animated:YES completion:nil];
    }else if (sp.length >= 100) {
        //大于100字
        
    }else {
        
        [_inputBar clearInput];
        ChatMessageDataModel *data = [[ChatMessageDataModel alloc] init];
        data.content = text;
        if(_delegate && [_delegate respondsToSelector:@selector(inputController:didSendMessage:)]){
            [_delegate inputController:self didSendMessage:data];
        }
        
    }
    
}


- (void)faceView:(FaceView *)faceView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    TFaceGroup *group = [ChatKit sharedInstance].config.faceGroups[indexPath.section];
    TFaceCellData *face = group.faces[indexPath.row];
    if(indexPath.section == 0){
        //        [_inputBar addEmoji:face.path];
        [_inputBar addEmoji:face.name path:face.path];
    }
    else{
    }
}

#pragma mark - lazy load
- (FaceView *)faceView
{
    if(!_faceView){
        _faceView = [[FaceView alloc] initWithFrame:CGRectMake(0, _inputBar.frame.origin.y + _inputBar.frame.size.height, self.view.frame.size.width, TFaceView_Height)];
        _faceView.delegate = self;
        //        [_faceView setData:[ChatKit sharedInstance].config.faceGroups];
        [_faceView setData:[[ChatKit sharedInstance].config.faceGroups mutableCopy]];
        
    }
    return _faceView;
}

@end
