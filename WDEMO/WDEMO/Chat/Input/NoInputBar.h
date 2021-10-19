//
//  NoInputBar.h
//  WDEMO
//
//  Created by WDEMO on 2020/7/27.
//  Copyright © 2020 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NoInputBar : UIView

@property (nonatomic, strong) UIButton *faceButton;

@property (nonatomic, strong) UIButton *textViewBtn;

@property (nonatomic, strong) UIButton *playListBtn;

- (void)halfStyle;

- (void)fullStyle;
@end

NS_ASSUME_NONNULL_END
