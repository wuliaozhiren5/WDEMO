//
//  UILabel+Util.h
//  WDEMO
//
//  Created by rrtv on 2021/3/25.
//  Copyright © 2021 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <YYKit/YYKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Util) //Util Util是utiliy
//获取UILabel每一行显示的文字
+ (NSArray *)getSeparatedLinesFromLabel:(UILabel *)label;
//获取行数
+ (NSArray *)getSeparatedLinesFromYYLabel:(YYLabel *)yyLabel;
 
@end

NS_ASSUME_NONNULL_END
