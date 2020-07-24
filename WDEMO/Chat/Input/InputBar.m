//
//  TUIInputBar.m
//  UIKit
//
//  Created by kennethmiao on 2018/9/18.
//  Copyright © 2018年 Tencent. All rights reserved.
//

#import "InputBar.h"
#import "ChatHeader.h"
#import "ChatKit.h"
#import <AVFoundation/AVFoundation.h>
#import "ReactiveObjC/ReactiveObjC.h"

#import "UIImage+TUIKIT.h"
#import "TUITextMessageCellData.h"
#import "TUIImageCache.h"
#import "FaceAttachment.h"
#import "NSAttributedString+zy_string.h"


@interface InputBar() <UITextViewDelegate, AVAudioRecorderDelegate>
//@property (nonatomic, strong) TUIRecordView *record;
@property (nonatomic, strong) NSDate *recordStartTime;
@property (nonatomic, strong) AVAudioRecorder *recorder;
@property (nonatomic, strong) NSTimer *recordTimer;
@end

@implementation InputBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        [self setupViews];
        [self defaultLayout];
    }
    return self;
}

- (void)setupViews
{
    
    _lineView = [[UIView alloc] init];
    //    _lineView.backgroundColor = [UIColor d_colorWithColorLight:TLine_Color dark:TLine_Color_Dark];
    [self addSubview:_lineView];
    
    _faceButton = [[UIButton alloc] init];
    [_faceButton addTarget:self action:@selector(clickFaceBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_faceButton setImage:[UIImage tk_imageNamed:@"ToolViewEmotion"] forState:UIControlStateNormal];
    [_faceButton setImage:[UIImage tk_imageNamed:@"ToolViewEmotionHL"] forState:UIControlStateHighlighted];
    [self addSubview:_faceButton];
    
    _keyboardButton = [[UIButton alloc] init];
    [_keyboardButton addTarget:self action:@selector(clickKeyboardBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_keyboardButton setImage:[UIImage tk_imageNamed:@"ToolViewKeyboard"] forState:UIControlStateNormal];
    [_keyboardButton setImage:[UIImage tk_imageNamed:@"ToolViewKeyboardHL"] forState:UIControlStateHighlighted];
    _keyboardButton.hidden = YES;
    [self addSubview:_keyboardButton];
    
    _inputTextView = [[TResponderTextView alloc] init];
    _inputTextView.delegate = self;
    [_inputTextView setFont:[UIFont systemFontOfSize:16]];
    [_inputTextView.layer setMasksToBounds:YES];
    [_inputTextView.layer setCornerRadius:4.0f];
    [_inputTextView.layer setBorderWidth:0.5f];
    //    [_inputTextView.layer setBorderColor:[UIColor d_colorWithColorLight:TLine_Color dark:TLine_Color_Dark].CGColor];
    [_inputTextView setReturnKeyType:UIReturnKeySend];
    [self addSubview:_inputTextView];
}

- (void)defaultLayout
{
    _lineView.frame = CGRectMake(0, 0, Screen_Width, TLine_Heigh);
    CGSize buttonSize = TTextView_Button_Size;
    CGFloat buttonOriginY = (TTextView_Height - buttonSize.height) * 0.5;
    
    _faceButton.frame = CGRectMake(TTextView_Margin, buttonOriginY, buttonSize.width, buttonSize.height);
    
    CGFloat beginX = _faceButton.frame.origin.x + _faceButton.frame.size.width + TTextView_Margin;
    CGFloat endX = Screen_Width - TTextView_Margin;
    
    _inputTextView.frame = CGRectMake(beginX, (TTextView_Height - TTextView_TextView_Height_Min) * 0.5, endX - beginX, TTextView_TextView_Height_Min);
}

- (void)layoutButton:(CGFloat)height
{
    CGRect frame = self.frame;
    CGFloat offset = height - frame.size.height;
    frame.size.height = height;
    self.frame = frame;
    
    CGSize buttonSize = TTextView_Button_Size;
    CGFloat bottomMargin = (TTextView_Height - buttonSize.height) * 0.5;
    CGFloat originY = frame.size.height - buttonSize.height - bottomMargin;
    
    CGRect faceFrame = _faceButton.frame;
    faceFrame.origin.y = originY;
    _faceButton.frame = faceFrame;
    _keyboardButton.frame = faceFrame;
    
    if(_delegate && [_delegate respondsToSelector:@selector(inputBar:didChangeInputHeight:)]){
        [_delegate inputBar:self didChangeInputHeight:offset];
    }
}

- (void)clickKeyboardBtn:(UIButton *)sender
{
    //    _micButton.hidden = NO;
    _keyboardButton.hidden = YES;
    //    _recordButton.hidden = YES;
    _inputTextView.hidden = NO;
    _faceButton.hidden = NO;
    [self layoutButton:_inputTextView.frame.size.height + 2 * TTextView_Margin];
    if(_delegate && [_delegate respondsToSelector:@selector(inputBarDidTouchKeyboard:)]){
        [_delegate inputBarDidTouchKeyboard:self];
    }
}

- (void)clickFaceBtn:(UIButton *)sender
{
    //    _micButton.hidden = NO;
    _faceButton.hidden = YES;
    _keyboardButton.hidden = NO;
    //    _recordButton.hidden = YES;
    _inputTextView.hidden = NO;
    if(_delegate && [_delegate respondsToSelector:@selector(inputBarDidTouchFace:)]){
        [_delegate inputBarDidTouchFace:self];
    }
    _keyboardButton.frame = _faceButton.frame;
}


#pragma mark - talk

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    self.keyboardButton.hidden = YES;
    self.faceButton.hidden = NO;
}

- (void)textViewDidChange:(UITextView *)textView
{
    //wwc
    //    TUITextMessageCellData *data = [[TUITextMessageCellData alloc] initWithDirection:MsgDirectionOutgoing];
    //    data.content = textView.text;
    //    textView.attributedText = data.attributedString;
    
    CGSize size = [_inputTextView sizeThatFits:CGSizeMake(_inputTextView.frame.size.width, TTextView_TextView_Height_Max)];
    CGFloat oldHeight = _inputTextView.frame.size.height;
    CGFloat newHeight = size.height;
    
    if(newHeight > TTextView_TextView_Height_Max){
        newHeight = TTextView_TextView_Height_Max;
    }
    if(newHeight < TTextView_TextView_Height_Min){
        newHeight = TTextView_TextView_Height_Min;
    }
    if(oldHeight == newHeight){
        return;
    }
    
    __weak typeof(self) ws = self;
    [UIView animateWithDuration:0.3 animations:^{
        CGRect textFrame = ws.inputTextView.frame;
        textFrame.size.height += newHeight - oldHeight;
        ws.inputTextView.frame = textFrame;
        [ws layoutButton:newHeight + 2 * TTextView_Margin];
    }];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if([text isEqualToString:@"\n"]){
        if(_delegate && [_delegate respondsToSelector:@selector(inputBar:didSendText:)]) {
            NSString *sp = [textView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
            if (sp.length == 0) {
                UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"不能发送空白消息" message:nil preferredStyle:UIAlertControllerStyleAlert];
                [ac addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
                //                [self.mm_viewController presentViewController:ac animated:YES completion:nil];
            } else {
                //                [_delegate inputBar:self didSendText:textView.text];
                
                [_delegate inputBar:self didSendText:[textView.attributedText toString]];
                
                [self clearInput];
            }
        }
        return NO;
    }
    else if ([text isEqualToString:@""]) {
        if (textView.text.length > range.location && [textView.text characterAtIndex:range.location] == ']') {
            NSUInteger location = range.location;
            NSUInteger length = range.length;
            while (location != 0) {
                location --;
                length ++ ;
                char c = [textView.text characterAtIndex:location];
                if (c == '[') {
                    textView.text = [textView.text stringByReplacingCharactersInRange:NSMakeRange(location, length) withString:@""];
                    return NO;
                }
                else if (c == ']') {
                    return YES;
                }
            }
        }
    }
    return YES;
}

- (void)clearInput
{
    _inputTextView.text = @"";
    [self textViewDidChange:_inputTextView];
}

- (NSString *)getInput
{
    return _inputTextView.text;
}

//- (void)addEmoji:(NSString *)emoji
- (void)addEmoji:(NSString *)emoji path:(NSString *)path;
{
    //wwc
    //    [_inputTextView setText:[_inputTextView.text stringByAppendingString:emoji]];
    
    //    NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
    //    textAttachment.image = [[TUIImageCache sharedInstance] getFaceFromCache:emoji];
    //    textAttachment.bounds = CGRectMake(0, 0, 16, 16);
    //    NSInteger location = _inputTextView.selectedRange.location;
    //    //插入表情
    //    [_inputTextView.textStorage insertAttributedString:[NSAttributedString attributedStringWithAttachment:textAttachment] atIndex:_inputTextView.selectedRange.location];
    //    //将光标位置向前移动一个单位
    //    _inputTextView.selectedRange = NSMakeRange(location + 1, 0);
    //
    //
    
    // //创建一个附件
    FaceAttachment *faceAttachement = [[FaceAttachment alloc]init];
    //添加表情
    faceAttachement.imageName = path;
    //添加标签名
    faceAttachement.tagName = emoji;
    //设置表情大小
    faceAttachement.bounds = CGRectMake(0, 0, 18, 18);
    //记录光标位置
    NSInteger location = _inputTextView.selectedRange.location;
    //插入表情
    [_inputTextView.textStorage insertAttributedString:[NSAttributedString attributedStringWithAttachment:faceAttachement] atIndex:_inputTextView.selectedRange.location];
    //将光标位置向前移动一个单位
    _inputTextView.selectedRange = NSMakeRange(location + 1, 0);
    
    [_inputTextView setFont:[UIFont systemFontOfSize:16.0f]];
    
    
    if(_inputTextView.contentSize.height > TTextView_TextView_Height_Max){
        float offset = _inputTextView.contentSize.height - _inputTextView.frame.size.height;
        [_inputTextView scrollRectToVisible:CGRectMake(0, offset, _inputTextView.frame.size.width, _inputTextView.frame.size.height) animated:YES];
    }
    
    [self textViewDidChange:_inputTextView];
}

- (void)backDelete
{
    //wwc
    //    [self textView:_inputTextView shouldChangeTextInRange:NSMakeRange(_inputTextView.text.length - 1, 1) replacementText:@""];
    
    //系统的删除方法
    [_inputTextView deleteBackward];
    
    [self textViewDidChange:_inputTextView];
}


@end
