#iOS 之 [NSURL URLWithString]返回为空nil的解决方案
https://www.jianshu.com/p/f5dd3927aaf8
解决方法：
```
ios 8.0 之前使用：stringByAddingPercentEscapesUsingEncoding
// NSString *urlStr = [String stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
```

```
ios 9.0之后用：stringByAddingPercentEncodingWithAllowedCharacters 
NSString *audioUrl = [[NSString stringWithFormat:@"%@", self.model.audioPlayUrl] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
NSURL *url = [NSURL URLWithString:urlStr];
```

代码里用到
```
#define URL(s) ([NSURL URLWithString:(s)] ?: [NSURL URLWithString:[(s) stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]])
```
