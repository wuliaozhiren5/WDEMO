#iOS应用内跳转到系统设置页面
https://www.jianshu.com/p/5d82fb0c4051
```
NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
if (@available(iOS 10.0, *)) {
    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
}else {
    [[UIApplication sharedApplication] openURL:url];
}
```
