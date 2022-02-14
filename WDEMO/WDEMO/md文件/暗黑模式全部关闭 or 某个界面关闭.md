#暗黑模式全部关闭 or 某个界面关闭

iOS13简单适配
https://www.jianshu.com/p/75f34462bd9a
iOS 暗黑模式全部关闭 or 某个界面关闭
https://blog.csdn.net/Goods_boy/article/details/104606170
```
// 强制关闭暗黑模式
   if #available(iOS 13.0, *) {
       window?.overrideUserInterfaceStyle = .light
   }
```

某个界面关闭

```
//swift代码
viewController.overrideUserInterfaceStyle = .light
```
```
//oc代码
if (@available(iOS 13.0, *)) {
    if (isDark) {
        self.overrideUserInterfaceStyle = UIUserInterfaceStyleDark;
    } else {
        self.overrideUserInterfaceStyle = UIUserInterfaceStyleUnspecified;
    }
}
```
```
公司代码
[self.view setDarkMode:YES];

```
