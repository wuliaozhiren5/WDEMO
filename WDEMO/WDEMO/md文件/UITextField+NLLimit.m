//
//  UITextField+NLLimit.m
//  WDEMO
//
//  Created by aimeiju on 2022/7/4.
//  Copyright © 2022 wwc. All rights reserved.
//

#import "UITextField+NLLimit.h"
#import <objc/runtime.h>

@implementation UITextField (NLLimit)

static void *nlLimitMaxLengthKey = &nlLimitMaxLengthKey;

- (void)setNl_maxLength:(NSUInteger)nl_maxLength {
  objc_setAssociatedObject(self, nlLimitMaxLengthKey, @(nl_maxLength), OBJC_ASSOCIATION_COPY);

  /**
   *  监控自身文本变化
   */
  if (nl_maxLength > 0) {
    [self addTarget:self action:@selector(_nl_valueChanged:) forControlEvents:UIControlEventAllEditingEvents];
  } else {
    [self removeTarget:self action:@selector(_nl_valueChanged:) forControlEvents:UIControlEventAllEditingEvents];
  }
}

- (NSUInteger)nl_maxLength {
  return [objc_getAssociatedObject(self, nlLimitMaxLengthKey) unsignedIntegerValue];
}

#pragma mark - private
- (void)_nl_valueChanged:(UITextField *)textField {
  /**
   * 在文本变化后推断文本长度是否符合需求
   */
  if (self.nl_maxLength == 0) return;
  if ([textField.text length] <= self.nl_maxLength) return;

  NSString *subString = [textField.text substringToIndex:self.nl_maxLength];
  dispatch_async(dispatch_get_main_queue(), ^{
    textField.text = subString;
    [textField sendActionsForControlEvents:UIControlEventEditingChanged];
  });
}

@end

