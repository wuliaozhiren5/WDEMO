 
#iOS 获取URL链接中的各参数

iOS 获取URL链接中的各参数
原文链接：https://blog.csdn.net/Small_years/article/details/106481956

1、iOS请求URL中含有中文怎么办？
使用UTF-8编码一下就OK了

```
NSString* encodedString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

```

2、iOS获取URL链接中的各个参数值：

例：http://example.com?param1=value1&param2=param2

通过对一个合法的url（第一个参数用"?“连接，且url中只有一个”?"，剩下的参数用"&"连接）进行字符串分割等处理实现URL中参数的提取
```
//获取其中某个参数
- (NSString *)getParamByName:(NSString *)name URLString:(NSString *)url{
    NSError *error;
    NSString *regTags=[[NSString alloc] initWithFormat:@"(^|&|\\?)+%@=+([^&]*)(&|$)", name];
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regTags
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    
    // 执行匹配的过程
    NSArray *matches = [regex matchesInString:url
                                      options:0
                                        range:NSMakeRange(0, [url length])];
    for (NSTextCheckingResult *match in matches) {
        NSString *tagValue = [url substringWithRange:[match rangeAtIndex:2]];  // 分组2所对应的串
        return tagValue;
    }
    return @"";
}

```
示例：
```
NSString *URLStr = @"http://example.com?param1=value1&param2=param2";
NSLog(@"结果：",[self getParamByName:@"param1" URLString:URLStr])

```
```
结果：value1

```
2、一次性获取所有参数：
```

- (NSDictionary *)getParamsWithUrlString:(NSString*)urlString {
    if(urlString.length==0) {
        NSLog(@"链接为空！");
        return @{};
    }
    //先截取问号
    NSArray* allElements = [urlString componentsSeparatedByString:@"?"];
    NSMutableDictionary* params = [NSMutableDictionary dictionary];//待set的参数字典
    
    if(allElements.count == 2) {
        //有参数或者?后面为空
        NSString* paramsString = allElements[1];
        //获取参数对
        NSArray*paramsArray = [paramsString componentsSeparatedByString:@"&"];
        if(paramsArray.count>=2) {
            for(NSInteger i =0; i < paramsArray.count; i++) {
                NSString* singleParamString = paramsArray[i];
                NSArray* singleParamSet = [singleParamString componentsSeparatedByString:@"="];
                if(singleParamSet.count==2) {
                    NSString* key = singleParamSet[0];
                    NSString* value = singleParamSet[1];
                    if(key.length>0|| value.length>0) {
                        [params setObject: value.length>0? value:@"" forKey:key.length>0?key:@""];
                    }
                }
            }
        }else if(paramsArray.count == 1) {//无 &。url只有?后一个参数
            NSString* singleParamString = paramsArray[0];
            
            NSArray* singleParamSet = [singleParamString componentsSeparatedByString:@"="];
            if(singleParamSet.count==2) {
                NSString* key = singleParamSet[0];
                NSString* value = singleParamSet[1];
                if(key.length>0 || value.length>0) {
                    [params setObject:value.length>0?value:@""forKey:key.length>0?key:@""];
                }
            }else{
                //问号后面啥也没有 xxxx?  无需处理
            }
        }
        //整合url及参数
        return params;
    }else if(allElements.count>2) {
        NSLog(@"链接不合法！链接包含多个\"?\"");
        return @{};
    }else{
        NSLog(@"链接不包含参数！");
        return @{};
    }
}

```

示例：
```
    NSString *url = @"https://www.jd.com/?device=app&appVersion=1.0.7&platform=iOS";
    NSDictionary *dict = [self getParamsWithUrlString:url];
    NSLog(@"结果：%@",dict);

```
```
    结果：{
        appVersion = "1.0.7";
        device = app;
        platform = iOS;
    }

```


 
