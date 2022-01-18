//
//  RRTalkContentTextView.h
//  PPVideo
//
//  Created by rrtv on 2021/12/14.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol RRTalkContentTextViewDelegate <NSObject>
- (void)clickOpen;
- (void)clickClose;
@end

@interface RRTalkContentTextView : UIView
//行数
//@property (nonatomic, assign) NSInteger numberOfLines;
//最大行数 不能为0
@property (nonatomic, assign) NSInteger maxNumberOfLines;
//行间距
@property (nonatomic, assign) CGFloat lineSpacing;
//字体
//注意：使用系统字体，会有布局问题，计算宽度出问题
//以下是系统提醒
// CoreText note: Client requested name ".SFUI-Regular", it will get TimesNewRomanPSMT rather than the intended font. All system UI font access should be through proper APIs such as CTFontCreateUIFontForLanguage() or +[UIFont systemFontOfSize:].
@property (nonatomic, strong) UIFont *font;
//字体颜色
@property (nonatomic, strong) UIColor *textColor;

@property (nonatomic, copy) NSString *text;

@property (nonatomic, assign) BOOL isShowMore;
//按钮颜色
@property (nonatomic, strong) UIColor *btnTextColor;

@property (nonatomic, weak) id<RRTalkContentTextViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
