#自定义TabBar文字颜色
  

解决ios 13 UITabBarItem选中时的文字颜色，有时有效，有时无效
https://www.jianshu.com/p/35c029da702a

```
if (@available(iOS 13.0, *)) {
        // iOS 13以上
        self.tabBar.tintColor = [UIColor redColor];
        self.tabBar.unselectedItemTintColor = [UIColor grayColor];
        UITabBarItem *item = [UITabBarItem appearance];
        [item setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} forState:UIControlStateNormal];
        [item setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} forState:UIControlStateSelected];
    } else {
        // iOS 13以下
        UITabBarItem *item = [UITabBarItem appearance];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateNormal];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateSelected];
    }
```
