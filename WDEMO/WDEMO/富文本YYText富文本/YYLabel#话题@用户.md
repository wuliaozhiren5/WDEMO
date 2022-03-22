#YYLabel#话题@用户

YYLabel
YYTextLayout
#话题 @用户
使用YYLabel小结，供参考
https://blog.csdn.net/weixin_33709364/article/details/89616980

```
{
    //单个（字符串中出现的第一个）
    NSRange authorRange = [content rangeOfString:authorStr];
    if(authorRange.location != NSNotFound){
        NSLog(@"这个字符串中存在 authorRange");
        [text setTextHighlightRange:authorRange
                              color:[UIColor greenColor]
                    backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.220]
                          tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
            //自定义代码，此处根据需要调整
            NSLog(@"点击了%@",authorStr);
        }];
    }
}
```

iOS开发-获取字符串中多个相同字符的位置index
https://blog.csdn.net/Nathan1987_/article/details/54896319

```
#pragma mark - 获取这个字符串中的所有xxx的所在的index
- (NSMutableArray *)getRangeStr:(NSString *)text findText:(NSString *)findText
{
    
    NSMutableArray *arrayRanges = [NSMutableArray arrayWithCapacity:3];
    
    if (findText == nil && [findText isEqualToString:@""])
    {
        
        return nil;
        
    }
    
    NSRange rang = [text rangeOfString:findText]; //获取第一次出现的range
    
    if (rang.location != NSNotFound && rang.length != 0)
    {
        
        [arrayRanges addObject:[NSNumber numberWithInteger:rang.location]];//将第一次的加入到数组中
        
        NSRange rang1 = {0,0};
        
        NSInteger location = 0;
        
        NSInteger length = 0;
        
        for (int i = 0;; i++)
        {
            
            if (0 == i)
            {//去掉这个xxx
                
                location = rang.location + rang.length;
                
                length = text.length - rang.location - rang.length;
                
                rang1 = NSMakeRange(location, length);
                
            }
            else
            {
                
                location = rang1.location + rang1.length;
                
                length = text.length - rang1.location - rang1.length;
                
                rang1 = NSMakeRange(location, length);
                
            }
            
            //在一个range范围内查找另一个字符串的range
            
            rang1 = [text rangeOfString:findText options:NSCaseInsensitiveSearch range:rang1];
            
            if (rang1.location == NSNotFound && rang1.length == 0)
            {
                
                break;
                
            }
            else//添加符合条件的location进数组
            
            [arrayRanges addObject:[NSNumber numberWithInteger:rang1.location]];
            
        }
        
        return arrayRanges;
        
    }
    
    return nil;
    
}
```
