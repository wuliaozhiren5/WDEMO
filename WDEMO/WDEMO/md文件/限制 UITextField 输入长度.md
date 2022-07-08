#限制 UITextField 输入长度



限制 UITextField 输入长度
https://www.likecs.com/show-306991238.html

1、通过 delegate 来实现（不推荐）

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range
 replacementString:(NSString *)string; // 返回 NO 就不会改变文本
```
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
  NSString *beString = [textField.text stringByReplacingCharactersInRange:range withString:string];
  if ([beString length] > 20) {
    textField.text = [beString substringToIndex:20];
    return NO;
  }

  return YES;
}
```


3、分类加入属性来实现（推荐）

```
// .h file
@interface UITextField (NLLimit)
@property (assign, nonatomic) NSUInteger nl_maxLength;
@end

// .m file
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
```



自己代码中的
```
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSInteger kMaxLength = 20;
    NSInteger strLength = textField.text.length - range.length + string.length;
    return (strLength <= kMaxLength);
//    TOAST(@"最多输入20个字符");
}
```


 
