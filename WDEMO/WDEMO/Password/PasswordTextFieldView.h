//
//  PasswordTextFieldView.h
//  WDEMO
//
//  Created by WDEMO on 2020/8/31.
//  Copyright © 2020 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PasswordTextField.h"

NS_ASSUME_NONNULL_BEGIN

@interface PasswordTextFieldView : UIView

@property (nonatomic, strong) PasswordTextField *textField;

@property (nonatomic, strong) UIButton *showTextBtn;

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, copy) NSString *placeholder;

@property (nonatomic, copy) NSAttributedString *attributedPlaceholder;

@end

NS_ASSUME_NONNULL_END
