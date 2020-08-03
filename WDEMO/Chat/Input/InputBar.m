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
#import "UIImage+ChatKit.h"
#import "ChatMessageDataModel.h"
#import "ChatImageCache.h"
#import "FaceAttachment.h"
#import "NSAttributedString+FaceString.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface InputBar() <UITextViewDelegate>
//textView 默认文字
@property (nonatomic, copy) NSString *placeholderStr;
//textView Text 文字保存
@property (nonatomic, strong) NSAttributedString *textViewTextStr;

@end

@implementation InputBar

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self){
        [self setupViews];
        [self defaultLayout];
        
    }
    return self;
}

- (void)setupViews {
    _placeholderStr = @"有爱发言，人人说两句～";
    _lineView = [[UIView alloc] init];
    //    _lineView.backgroundColor = [UIColor d_colorWithColorLight:TLine_Color dark:TLine_Color_Dark];
    [self addSubview:_lineView];
    
    _faceButton = [[UIButton alloc] init];
    [_faceButton addTarget:self action:@selector(clickFaceBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_faceButton setImage:[UIImage chat_imageNamed:@"ic_inputbox_emoji_white"] forState:UIControlStateNormal];
    [_faceButton setImage:[UIImage chat_imageNamed:@"ic_inputbox_emoji_white"] forState:UIControlStateHighlighted];
    [self addSubview:_faceButton];
    
    _keyboardButton = [[UIButton alloc] init];
    [_keyboardButton addTarget:self action:@selector(clickKeyboardBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_keyboardButton setImage:[UIImage chat_imageNamed:@"ic_inputbox_keyboard_white"] forState:UIControlStateNormal];
    [_keyboardButton setImage:[UIImage chat_imageNamed:@"ic_inputbox_keyboard_white"] forState:UIControlStateHighlighted];
    _keyboardButton.hidden = YES;
    [self addSubview:_keyboardButton];
    
    _inputTextView = [[TResponderTextView alloc] init];
    _inputTextView.delegate = self;
    [_inputTextView setFont:[UIFont systemFontOfSize:16]];
    [_inputTextView.layer setMasksToBounds:YES];
    [_inputTextView.layer setCornerRadius:5.0f];
    _inputTextView.backgroundColor = InputBarTextViewColor;
    _inputTextView.textColor = ChatTextColor;
    [_inputTextView setReturnKeyType:UIReturnKeySend];
    [self addSubview:_inputTextView];
    
    _placeholderLabel = [[UILabel alloc] init];
    _placeholderLabel.frame = CGRectMake(17, 8, 100, 20);
    _placeholderLabel.font = [UIFont systemFontOfSize:18.0];
    _placeholderLabel.text = _placeholderStr;
    _placeholderLabel.textColor = InputBarTextColor;
    //    _placeholderLabel.enabled = NO;//lable必须设置为不可用
    _placeholderLabel.backgroundColor = [UIColor clearColor];
    [_inputTextView addSubview:_placeholderLabel];
    
}

- (void)defaultLayout {
    _lineView.frame = CGRectMake(0, 0, Screen_Width, TLine_Heigh);
    CGSize buttonSize = TTextView_Button_Size;
    CGFloat buttonOriginY = (TTextView_Height - buttonSize.height) * 0.5;
    
    _faceButton.frame = CGRectMake(TTextView_Margin, buttonOriginY, buttonSize.width, buttonSize.height);
    
    
    CGFloat beginX = _faceButton.frame.origin.x + _faceButton.frame.size.width + TTextView_Margin;
    CGFloat endX = Screen_Width - TTextView_Margin;
    _inputTextView.frame = CGRectMake(beginX, (TTextView_Height - TTextView_TextView_Height_Min) * 0.5, endX - beginX, TTextView_TextView_Height_Min);
    
    _placeholderLabel.frame = CGRectMake(8, 8, _inputTextView.frame.size.width - 8 * 2, 20);
    //    _placeholderLabel.frame = CGRectMake(_inputTextView.textContainerInset.left, _inputTextView.textContainerInset.top, 200, 20);
    
}

- (void)layoutButton:(CGFloat)height {
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

- (void)clickKeyboardBtn:(UIButton *)sender {
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

- (void)clickFaceBtn:(UIButton *)sender {
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
- (void)textViewDidBeginEditing:(UITextView *)textView {
    self.keyboardButton.hidden = YES;
    self.faceButton.hidden = NO;
    //设置textView的textColor颜色，原因修改过程中会变色
    textView.textColor = ChatTextColor;
    
    if (_textViewTextStr) {
        textView.attributedText = _textViewTextStr;
        [self textViewDidChange:_inputTextView];
    } else {}
}

- (void)textViewDidChange:(UITextView *)textView {
    //默认文字
    if (textView.text.length == 0) {
        _placeholderLabel.text = _placeholderStr;
    }else{
        _placeholderLabel.text = @"";
    }
    
    //faceview 发送删除按钮显示
    if(_delegate && [_delegate respondsToSelector:@selector(inputBarTextViewDidChange:)]) {
        [_delegate inputBarTextViewDidChange:self];
    }
    
    CGSize size = [_inputTextView sizeThatFits:CGSizeMake(_inputTextView.frame.size.width, TTextView_TextView_Height_Max)];
    CGFloat oldHeight = _inputTextView.frame.size.height;
    CGFloat newHeight = size.height;
    
    //iOS：解决UITextView自适应高度粘贴大量文字导致上移显示不全的问题
    CGFloat maxHeight = TTextView_TextView_Height_Max;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.02 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (size.height >= maxHeight) {
            textView.scrollEnabled = YES;   // 允许滚动
            [textView scrollRangeToVisible:textView.selectedRange];
        }else {
            textView.scrollEnabled = NO;    // 不允许滚动，当textview的大小足以容纳它的text的时候，需要设置scrollEnabed为NO，否则会出现光标乱滚动的情况
        }
    });
    
    if(newHeight > TTextView_TextView_Height_Max){
        newHeight = TTextView_TextView_Height_Max;
    }
    if(newHeight < TTextView_TextView_Height_Min){
        newHeight = TTextView_TextView_Height_Min;
    }
    if(oldHeight == newHeight){
        return;
    }
    
    __weak __typeof(self) ws = self;
    [UIView animateWithDuration:0.3 animations:^{
        CGRect textFrame = ws.inputTextView.frame;
        textFrame.size.height += newHeight - oldHeight;
        ws.inputTextView.frame = textFrame;
        [ws layoutButton:newHeight + 2 * TTextView_Margin];
    }];
    
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if([text isEqualToString:@"\n"]){
        if(_delegate && [_delegate respondsToSelector:@selector(inputBar:didSendText:)]) {
            //            NSString *sp = [textView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
            //去除前后空格
            NSString *sp = [[textView.attributedText toString] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
            
            if (sp.length == 0) {
                UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"不能发送空白消息" message:nil preferredStyle:UIAlertControllerStyleAlert];
                [ac addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
                //                [self.mm_viewController presentViewController:ac animated:YES completion:nil];
            }else if (sp.length > 100) {
                //大于100字
                
//                UIView *view = [UIApplication sharedApplication].delegate.window;
//                //只显示文字
//                MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
//                hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
//                hud.bezelView.backgroundColor = [UIColor blackColor];
//                hud.mode = MBProgressHUDModeText;
//                hud.label.text = @"Some message...";
//                hud.label.textColor = [UIColor whiteColor];
//                [hud hideAnimated:YES afterDelay:2];
            }else {
                
                //发送消息
                [_delegate inputBar:self didSendText:sp];
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

- (void)clearInput {
    _inputTextView.text = @"";
    [self textViewDidChange:_inputTextView];
     _textViewTextStr = nil;
}

- (NSString *)getInput {
    return _inputTextView.text;
}

- (void)keyboardHidden {
    _textViewTextStr = _inputTextView.attributedText;
    _inputTextView.text = @"";
    [self textViewDidChange:_inputTextView];
}
//- (void)addEmoji:(NSString *)emoji
- (void)addEmoji:(NSString *)emoji path:(NSString *)path {
    // //创建一个附件
    FaceAttachment *faceAttachement = [[FaceAttachment alloc]init];
    //添加表情
    faceAttachement.imageName = path;
    //添加标签名
    faceAttachement.tagName = emoji;
    //设置表情大小
    faceAttachement.bounds = CGRectMake(0, 0, 16, 16);
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

- (void)backDelete {
    //wwc
    //    [self textView:_inputTextView shouldChangeTextInRange:NSMakeRange(_inputTextView.text.length - 1, 1) replacementText:@""];
    
    //系统的删除方法
    [_inputTextView deleteBackward];
    
    [self textViewDidChange:_inputTextView];
}

@end
