//
//  NoInputBar.m
//  WDEMO
//
//  Created by rrtv on 2020/7/27.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "NoInputBar.h"
#import "UIImage+ChatKit.h"
#import "ChatHeader.h"

@implementation NoInputBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self){
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    UIButton *bottomBarFaceBtn;
    bottomBarFaceBtn = [[UIButton alloc] init];
    //      [bottomBarFaceBtn addTarget:self action:@selector(clickBottomBarFaceBtn:) forControlEvents:UIControlEventTouchUpInside];
    [bottomBarFaceBtn setImage:[UIImage chat_imageNamed:@"ic_inputbox_emoji_white"] forState:UIControlStateNormal];
    [bottomBarFaceBtn setImage:[UIImage chat_imageNamed:@"ic_inputbox_emoji_white"] forState:UIControlStateHighlighted];
    [self addSubview:bottomBarFaceBtn];
    
    
    UIButton *bottomBarTextViewBtn;
    bottomBarTextViewBtn = [[UIButton alloc] init];
    //      [bottomBarTextViewBtn addTarget:self action:@selector(clickBottomBarTextViewBtn:) forControlEvents:UIControlEventTouchUpInside];
    [bottomBarTextViewBtn setTitle:@"有爱发言，人人说两句～" forState:UIControlStateNormal];
    bottomBarTextViewBtn.layer.cornerRadius = 15;
    //    bottomBarTextViewBtn.layer.masksToBounds = YES;
    bottomBarTextViewBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    bottomBarTextViewBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);
    bottomBarTextViewBtn.titleLabel.font = kChatTextFont;
    [bottomBarTextViewBtn setTitleColor:NOInputBarTextColor forState:UIControlStateNormal];
    bottomBarTextViewBtn.backgroundColor = NoInputBarTextViewColor;
    [self addSubview:bottomBarTextViewBtn];
    
    UIButton *bottomBarPlayListBtn;
    bottomBarPlayListBtn = [[UIButton alloc] init];
    //      [bottomBarPlayListBtn addTarget:self action:@selector(clickBottomBarPlayListBtn:) forControlEvents:UIControlEventTouchUpInside];
    [bottomBarPlayListBtn setImage:[UIImage chat_imageNamed:@"playlist"] forState:UIControlStateNormal];
    [bottomBarPlayListBtn setImage:[UIImage chat_imageNamed:@"playlist"] forState:UIControlStateHighlighted];
    [self addSubview:bottomBarPlayListBtn];
    
    _faceButton = bottomBarFaceBtn;
    _textViewBtn = bottomBarTextViewBtn;
    _playListBtn = bottomBarPlayListBtn;
    
    
//    CGFloat textBtnwidth = 30;
//    CGSize buttonSize = TTextView_Button_Size;
//    CGFloat buttonOriginY = (TTextView_Height - buttonSize.height) * 0.5 - 4;
//    bottomBarFaceBtn.frame = CGRectMake(NoTTextView_LeftMargin, buttonOriginY, buttonSize.width, buttonSize.height);
//    bottomBarPlayListBtn.frame = CGRectMake(Screen_Width - NoTTextView_LeftMargin -  buttonSize.width , buttonOriginY, buttonSize.width, buttonSize.height);
//
//    CGFloat beginX = bottomBarFaceBtn.frame.origin.x + bottomBarFaceBtn.frame.size.width + NoTTextView_MidMargin;
//    CGFloat endX = Screen_Width - NoTTextView_LeftMargin * 2 - bottomBarPlayListBtn.frame.size.width;
//    bottomBarTextViewBtn.frame = CGRectMake(beginX, (TTextView_Height - textBtnwidth) * 0.5 - 4, endX - beginX, textBtnwidth);
  
}

- (void)halfStyle {
    
    CGFloat textBtnwidth = 30;
    CGSize buttonSize = TTextView_Button_Size;
    CGFloat buttonOriginY = (TTextView_Height - buttonSize.height) * 0.5 - 4;
    self.faceButton.frame = CGRectMake(NoTTextView_LeftMargin, buttonOriginY, buttonSize.width, buttonSize.height);
    self.playListBtn.frame = CGRectMake(Screen_Width - NoTTextView_LeftMargin -  buttonSize.width , buttonOriginY, buttonSize.width, buttonSize.height);
    
    CGFloat beginX = self.faceButton.frame.origin.x + self.faceButton.frame.size.width + NoTTextView_MidMargin;
    CGFloat endX = Screen_Width - NoTTextView_LeftMargin * 2 - self.playListBtn.frame.size.width;
    self.textViewBtn.frame = CGRectMake(beginX, (TTextView_Height - textBtnwidth) * 0.5 - 4, endX - beginX, textBtnwidth);
    
}

- (void)fullStyle {
    
    CGFloat textBtnwidth = 30;
    CGSize buttonSize = TTextView_Button_Size;
    CGFloat buttonOriginY = (TTextView_Height - buttonSize.height) * 0.5 - 4;
    self.faceButton.frame = CGRectMake(NoTTextView_LeftMargin, buttonOriginY, buttonSize.width, buttonSize.height);
    
    CGFloat beginX = self.faceButton.frame.origin.x + self.faceButton.frame.size.width + NoTTextView_MidMargin;
    CGFloat endX = FullScreenChatViewWidth - NoTTextView_LeftMargin;
    self.textViewBtn.frame = CGRectMake(beginX, (TTextView_Height - textBtnwidth) * 0.5 - 4, endX - beginX, textBtnwidth);
}
@end
