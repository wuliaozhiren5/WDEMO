//
//  ChatBottomInputBarViewController.h
//  WDEMO
//
//  Created by rrtv on 2020/11/5.
//  Copyright © 2020 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChatBottomInputBarViewController : UIViewController

@property (nonatomic, strong) UIButton *faceButton;

@property (nonatomic, strong) UIButton *textViewBtn;

@property (nonatomic, strong) UIButton *playListBtn;

- (void)halfStyle;

- (void)fullStyle;

@end

NS_ASSUME_NONNULL_END
