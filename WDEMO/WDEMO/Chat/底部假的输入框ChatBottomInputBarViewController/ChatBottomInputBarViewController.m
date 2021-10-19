//
//  ChatBottomInputBarViewController.m
//  WDEMO
//
//  Created by WDEMO on 2020/11/5.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "ChatBottomInputBarViewController.h"
#import "UIImage+ChatKit.h"
#import "ChatHeader.h"

@interface ChatBottomInputBarViewController ()

@end

@implementation ChatBottomInputBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupViews];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)setupViews {
    
    UIButton *bottomBarFaceBtn;
    bottomBarFaceBtn = [[UIButton alloc] init];
    //      [bottomBarFaceBtn addTarget:self action:@selector(clickBottomBarFaceBtn:) forControlEvents:UIControlEventTouchUpInside];
    [bottomBarFaceBtn setImage:[UIImage chat_imageNamed:@"ic_inputbox_emoji_white"] forState:UIControlStateNormal];
    [bottomBarFaceBtn setImage:[UIImage chat_imageNamed:@"ic_inputbox_emoji_white"] forState:UIControlStateHighlighted];
    [self.view addSubview:bottomBarFaceBtn];
    
    
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
    [self.view addSubview:bottomBarTextViewBtn];
    
    UIButton *bottomBarPlayListBtn;
    bottomBarPlayListBtn = [[UIButton alloc] init];
    //      [bottomBarPlayListBtn addTarget:self action:@selector(clickBottomBarPlayListBtn:) forControlEvents:UIControlEventTouchUpInside];
    [bottomBarPlayListBtn setImage:[UIImage chat_imageNamed:@"playlist"] forState:UIControlStateNormal];
    [bottomBarPlayListBtn setImage:[UIImage chat_imageNamed:@"playlist"] forState:UIControlStateHighlighted];
    [self.view addSubview:bottomBarPlayListBtn];
    
    _faceButton = bottomBarFaceBtn;
    _textViewBtn = bottomBarTextViewBtn;
    _playListBtn = bottomBarPlayListBtn;
    
//    CGFloat textBtnWidth = 30;
//    CGSize buttonSize = TTextView_Button_Size;
//    CGFloat buttonOriginY = (TTextView_Height - buttonSize.height) * 0.5 - 4;
//    bottomBarFaceBtn.frame = CGRectMake(NoTTextView_LeftMargin, buttonOriginY, buttonSize.width, buttonSize.height);
//    bottomBarPlayListBtn.frame = CGRectMake(Screen_Width - NoTTextView_LeftMargin -  buttonSize.width , buttonOriginY, buttonSize.width, buttonSize.height);
//
//    CGFloat beginX = bottomBarFaceBtn.frame.origin.x + bottomBarFaceBtn.frame.size.width + NoTTextView_MidMargin;
//    CGFloat endX = Screen_Width - NoTTextView_LeftMargin * 2 - bottomBarPlayListBtn.frame.size.width;
//    bottomBarTextViewBtn.frame = CGRectMake(beginX, (TTextView_Height - textBtnWidth) * 0.5 - 4, endX - beginX, textBtnWidth);
    
//    [self halfStyle];
}

- (void)halfStyle {
    CGFloat textBtnWidth = 30;
    CGSize buttonSize = TTextView_Button_Size;
    CGFloat buttonOriginY = (TTextView_Height - buttonSize.height) * 0.5 - 4;
    self.faceButton.frame = CGRectMake(NoTTextView_LeftMargin, buttonOriginY, buttonSize.width, buttonSize.height);
    self.playListBtn.frame = CGRectMake(Screen_Width - NoTTextView_LeftMargin -  buttonSize.width , buttonOriginY, buttonSize.width, buttonSize.height);

    CGFloat beginX = self.faceButton.frame.origin.x + self.faceButton.frame.size.width + NoTTextView_MidMargin;
    CGFloat endX = Screen_Width - NoTTextView_LeftMargin * 2 - self.playListBtn.frame.size.width;
    self.textViewBtn.frame = CGRectMake(beginX, (TTextView_Height - textBtnWidth) * 0.5 - 4, endX - beginX, textBtnWidth);
}

- (void)fullStyle {
    
    CGFloat top = TTextView_Height - NoTTextView_Height;
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, FullScreenChatViewWidth, top)];
    topView.backgroundColor = RGBA(33, 33, 33, 0.85);
    [self.view addSubview:topView];
    
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, top, FullScreenChatViewWidth, NoTTextView_Height)];
    bottomView.backgroundColor = InputBarBackgroundColor;
    [self.view addSubview:bottomView];
     
    [self.view sendSubviewToBack:topView];
    [self.view sendSubviewToBack:bottomView];
    
    CGFloat textBtnWidth = 30;
    CGSize buttonSize = TTextView_Button_Size;
    CGFloat buttonOriginY = (NoTTextView_Height - buttonSize.height) * 0.5 + top;
    self.faceButton.frame = CGRectMake(NoTTextView_LeftMargin, buttonOriginY, buttonSize.width, buttonSize.height);
    
    CGFloat beginX = self.faceButton.frame.origin.x + self.faceButton.frame.size.width + NoTTextView_MidMargin;
    CGFloat endX = FullScreenChatViewWidth - NoTTextView_LeftMargin;
    self.textViewBtn.frame = CGRectMake(beginX, (NoTTextView_Height - textBtnWidth) * 0.5 + top, endX - beginX, textBtnWidth);
}
@end
