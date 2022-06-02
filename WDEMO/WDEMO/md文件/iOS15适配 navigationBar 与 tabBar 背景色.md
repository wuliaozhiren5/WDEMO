#iOS15适配 navigationBar 与 tabBar 背景色

iOS15适配 navigationBar 与 tabBar 背景色
https://blog.csdn.net/survivorsfyh/article/details/121374280

在 iOS 15 之后发现常规设置 navigationBar 与 tabBar 的背景色后仍无效,具体需要配置如下 UINavigationBarAppearance 和 UITabBarAppearance 即可,具体 code 如下:

UINavigationBarAppearance
```
UIColor *bgColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
if (@available(iOS 15.0, *)) {
    UINavigationBarAppearance *navBar = [[UINavigationBarAppearance alloc] init];
    navBar.backgroundColor = bgColor;
    navBar.backgroundEffect = nil;
    self.navigationController.navigationBar.scrollEdgeAppearance = navBar;
    self.navigationController.navigationBar.standardAppearance = navBar;
} else {
    // 常规配置方式
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:bgColor]
                                                  forBarMetrics:UIBarMetricsDefault];
}
```
UITabBarAppearance
```
UIColor *bgColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
if (@available(iOS 15.0, *)) { 
    UITabBarAppearance *tabBar = [[UITabBarAppearance alloc] init];
    tabBar.backgroundColor = bgColor;
    tabBar.backgroundEffect = nil;
    self.tabBarController.tabBar.scrollEdgeAppearance = tabBar;
    self.tabBarController.tabBar.standardAppearance = tabBar;
} else {
  // 常规配置方式
}
```
