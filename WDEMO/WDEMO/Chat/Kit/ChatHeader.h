//
//  ChatHeader.h
//  WDEMO
//
//  Created by rrtv on 2020/7/24.
//  Copyright © 2020 wwc. All rights reserved.
//

#ifndef ChatHeader_h
#define ChatHeader_h

#define Version 4


#define Screen_Width        [UIScreen mainScreen].bounds.size.width
#define Screen_Height       [UIScreen mainScreen].bounds.size.height
#define Is_Iphone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define Is_IPhoneX (Screen_Width >=375.0f && Screen_Height >=812.0f && Is_Iphone)

#define StatusBar_Height    (Is_IPhoneX ? (44.0):(20.0))
#define TabBar_Height       (Is_IPhoneX ? (49.0 + 34.0):(49.0))
#define NavBar_Height       (44)
#define SearchBar_Height    (55)
#define Bottom_SafeHeight   (Is_IPhoneX ? (34.0):(0))
#define RGBA(r, g, b, a)    [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a]
#define RGB(r, g, b)    [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.f]

#define  MessageViewColor  RGBA(0, 0, 0, 0.7)
//inputview背景色
#define  InputBarBackgroundColor RGB(33, 33, 33)
//假的输入框背景色
#define  NoInputBarTextViewColor  RGBA(255, 255, 255, 0.1)
//输入框背景色
#define  InputBarTextViewColor  RGBA(46, 46, 46, 1.0)
//输入框默认文字
#define  NOInputBarTextColor  RGBA(255, 255, 255, 0.35)
//输入框默认文字
#define  InputBarTextColor  RGBA(97, 100, 102, 1.0)
 

//face发送按钮 文字颜色
#define  FaceButtonTextNoAvailable  RGB(65, 65, 65)
#define  FaceButtonTextAvailable  RGB(255, 255, 255)
 
//face发送按钮 背景颜色
#define  FaceButtonBackGroundNoAvailable  RGB(46, 46, 46)
#define  FaceButtonBackGroundAvailable    RGB(0, 187, 255)

//公告气泡
#define  NoticeBubbleColor    RGBA(255, 255, 255, 0.1)
//聊天文字
#define  ChatTextColor    RGBA(218, 219, 220, 1.0)
//进入房间文字
#define  EnterUserContenTextColor RGBA(218, 219, 220, 0.5)
//聊天姓名
#define  ChatNameColor    RGBA(145, 150, 153, 1.0)
//聊天气泡
#define  ChatBubbleColor    RGBA(0, 0, 0, 0.2)

//TextFont 聊天输入框字体
#define kChatTextFont      [UIFont systemFontOfSize:15.0]

//cell
#define TMessageCell_Head_Width 45
#define TMessageCell_Head_Height 45
#define TMessageCell_Head_Size CGSizeMake(45, 45)
#define TMessageCell_Padding 8
#define TMessageCell_Margin 8
#define TMessageCell_Indicator_Size CGSizeMake(20, 20)

#define ChatMessageCell_ReuseId @"ChatMessageCell"
#define TipMessageCell_ReuseId @"TipMessageCell"
#define FaceMessageCell_ReuseId @"FaceMessageCell"
#define EnterMessageCell_ReuseId @"EnterMessageCell"

//text cell
#define TTextMessageCell_ReuseId @"TTextMessageCell"
#define TTextMessageCell_Height_Min (TMessageCell_Head_Size.height + 2 * TMessageCell_Padding)
#define TTextMessageCell_Text_PADDING (160)
//#define TTextMessageCell_Text_Width_Max (Screen_Width - TTextMessageCell_Text_PADDING)
//#define TTextMessageCell_Text_Width_Max (Screen_Width - 12 * 2 - 9 * 2)
//右边间距132px/2（跟放映厅共用一个组件的话，右边为其他功能预留区域）
//#define TTextMessageCell_Text_Width_Max (Screen_Width - 15 - 9 * 2 - 132 / 2)
//全屏/半屏 分别的宽度
#define TTextMessageCell_Text_Width_Max      (Screen_Width - 15 - 9 * 2 - 132 / 2)
//全屏/半屏 分别的宽度
//半屏时候Screen_Width会变化,要获取最短的一条边,所以不能使用(Screen_Width - 15 - 9 * 2 - 132 / 2)
#define TTextMessageCell_Text_Width_Max_Half_NEW(width) (width - 15 - 9 * 2 - 132 / 2)
#define TTextMessageCell_Text_Width_Max_Full_NEW(width) (width - 15 * 2 - 9 * 2)

//气泡和左边的边距
#define TTextMessageCell_Bubble_LeftMargin 15
//气泡和上边的边距
#define TTextMessageCell_Bubble_TopMargin  6
//文字和气泡的边距
#define TTextMessageCell_BubbleText_Margin  9

#define TTextMessageCell_Margin 12
 
//face item cell
#define TFaceCell_ReuseId @"TFaceCell"

//text view
#define TTextView_Height (51)
#define TTextView_Button_Size CGSizeMake(30, 30)
#define TTextView_Margin 9
#define TTextView_TextView_Height_Min (TTextView_Height - 2 * TTextView_Margin)
#define TTextView_TextView_Height_Max 80

#define TTextView_LeftMargin 11
#define TTextView_RightMargin 15
//#define TTextView_MidMargin 4

#define NoTTextView_LeftMargin 11
#define NoTTextView_MidMargin 4

//face view
#define TFaceView_Height 195
#define TFaceView_Margin 12
#define TFaceView_Page_Padding 20
#define TFaceView_Page_Height 30
 
#define TFaceView_Page_TopPadding 21
#define TFaceView_Page_LeftPadding 15
#define TFaceView_Page_BottomPadding 15
#define TFaceView_LineSpacing 21
#define TFaceView_InteritemSpacing 21


//message controller
#define TMessageController_Header_Height 40

//navigationbar indicator view
#define TNaviBarIndicatorView_Margin 5

// controller commom color
#define TController_Background_Color RGBA(237, 237, 237, 1.0)
#define TController_Background_Color_Dark RGBA(25, 25, 25, 1.0)

// title commom color
#define TText_Color [UIColor blackColor]
#define TText_Color_Dark RGB(217, 217, 217)
#define TText_OutMessage_Color_Dark RGB(0, 15, 0)

// cell commom color
#define TCell_Nomal [UIColor whiteColor]
#define TCell_Nomal_Dark RGB(35, 35, 35)
#define TCell_Touched RGB(219, 219, 219)
#define TCell_Touched_Dark RGB(47, 47, 47)
#define TCell_OnTop RGB(247, 247, 247)
#define TCell_OnTop_Dark RGB(47, 47, 47)

// line commom color
#define TLine_Color RGBA(188, 188, 188, 0.6)
#define TLine_Color_Dark RGBA(35, 35, 35, 0.6)
#define TLine_Heigh 0.5

// page commom color
#define TPage_Color RGBA(222, 222, 222, 1.0)
#define TPage_Color_Dark RGBA(55, 55, 55, 1.0)
#define TPage_Current_Color RGBA(125, 125, 125, 1.0)
#define TPage_Current_Color_Dark RGBA(140, 140, 140, 1.0)

// input view commom color
#define TInput_Background_Color  RGBA(246, 246, 246, 1.0)
#define TInput_Background_Color_Dark  RGBA(30, 30, 30, 1.0)


//resource
//#define ChatKitResource(name) [NSString stringWithFormat:@"ChatKitResource.bundle/%@", name]
//#define ChatKitFace(name) [NSString stringWithFormat:@"ChatKitFace.bundle/%@", name]
#define ChatKitFace(name) [[NSBundle mainBundle] pathForResource:@"ChatKitFace" ofType:@"bundle"] == nil ? ([[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: @"Frameworks/TXIMSDK_TUIKit_iOS.framework/ChatKitFace.bundle"] stringByAppendingPathComponent:name]) : ([[[NSBundle mainBundle] pathForResource:@"ChatKitFace" ofType:@"bundle"] stringByAppendingPathComponent:name])
#define ChatKitResource(name) [[NSBundle mainBundle] pathForResource:@"ChatKitResource" ofType:@"bundle"] == nil ? ([[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: @"Frameworks/TXIMSDK_TUIKit_iOS.framework/ChatKitResource.bundle"] stringByAppendingPathComponent:name]) : ([[[NSBundle mainBundle] pathForResource:@"ChatKitResource" ofType:@"bundle"] stringByAppendingPathComponent:name])
//#define ChatKitResource(name) name
//#define ChatKitFace(name) name
 
// rich
#define kDefaultRichCellHeight 50
#define kDefaultRichCellMargin 8
#define kRichCellDescColor  [UIColor blackColor]
#define kRichCellValueColor [UIColor grayColor]
#define kRichCellTextFont      [UIFont systemFontOfSize:14]

 
//全屏聊天的宽
#define FullScreenChatViewWidth      270
//半屏聊天的宽
#define HalfScreenChatViewWidth     [UIScreen mainScreen].bounds.size.width

#define ChatViewWidth               Screen_Width < Screen_Height ? [UIScreen mainScreen].bounds.size.width : 270
 
#endif /* ChatHeader_h */
