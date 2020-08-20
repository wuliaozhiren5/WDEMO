//
//  PersonalCenterBarBtn.h
//  xxx
//
//  Created by xxx on 16/12/7.
//  Copyright © 2016年 developer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonalCenterBarBtn : UIControl

@property(nonatomic,strong)UILabel *titleLabel;

//- (instancetype)initWithFrame:(CGRect)frame Title:(NSString *)title;
- (instancetype)initWithFrame:(CGRect)frame
                        Title:(NSString *)title
                    TitleFont:(UIFont *)titleFont;

@end
