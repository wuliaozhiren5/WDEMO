//
//  ZYFaceHelper.h
//  自定义表情包
//
//  Created by 张祎 on 17/2/23.
//  Copyright © 2017年 张祎. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FaceAttachment.h"

@interface ZYFaceHelper : NSObject

/**
 插入自定义表情

 @param model 表情对象
 @param textView 对象文本框
 */
+ (void)insertFaceToString:(FaceAttachment *)model textView:(UITextView *)textView;

/**
 表情纯文本 转换富文本

 @param string @"[可爱][可爱][菜刀][菜刀][菜刀][生气][生气][尴尬][惊吓][惊吓]"
 @return 带表情的NSAttributedString
 */
- (NSAttributedString *)faceWithServerString:(NSString *)string;

@end
