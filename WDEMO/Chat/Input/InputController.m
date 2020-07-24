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
#import "TUITextMessageCellData.h"
#import "NSAttributedString+zy_string.h"

typedef NS_ENUM(NSUInteger, InputStatus) {
    Input_Status_Input,
    Input_Status_Input_Face,
    Input_Status_Input_More,
    Input_Status_Input_Keyboard,
    Input_Status_Input_Talk,
};

@interface InputController () <TTextViewDelegate, TFaceViewDelegate>
@property (nonatomic, assign) InputStatus status;
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
}

- (void)keyboardWillHide:(NSNotification *)notification
{
    // http://tapd.oa.com/20398462/bugtrace/bugs/view?bug_id=1020398462072883317&url_cache_key=b8dc0f6bee40dbfe0e702ef8cebd5d81
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
  
    __weak typeof(self) ws = self;
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
  
    self.faceView.hidden = NO;
    CGRect frame = self.faceView.frame;
    frame.origin.y = Screen_Height;
    self.faceView.frame = frame;
 
    frame.origin.y = self.faceView.frame.origin.y + self.faceView.frame.size.height;
 
    __weak typeof(self) ws = self;
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

- (void)inputBar:(InputBar *)textView didSendText:(NSString *)text
{
    
    TUITextMessageCellData *data = [[TUITextMessageCellData alloc] initWithDirection:MsgDirectionOutgoing];
    data.content = text;
    if(_delegate && [_delegate respondsToSelector:@selector(inputController:didSendMessage:)]){
        [_delegate inputController:self didSendMessage:data];
    }
}


- (void)reset
{
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
    NSString *text =  [_inputBar.inputTextView.attributedText toString];
    if([text isEqualToString:@""]){
        return;
    }
    [_inputBar clearInput];
    TUITextMessageCellData *data = [[TUITextMessageCellData alloc] initWithDirection:MsgDirectionOutgoing];
    data.content = text;
    if(_delegate && [_delegate respondsToSelector:@selector(inputController:didSendMessage:)]){
        [_delegate inputController:self didSendMessage:data];
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
        [_faceView setData:[ChatKit sharedInstance].config.faceGroups];
    }
    return _faceView;
}

@end
