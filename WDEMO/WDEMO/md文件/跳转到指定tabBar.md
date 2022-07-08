#跳转到指定tabBar

 
iOS从一个页面返回到tabbar上的任意一个页面
https://www.jianshu.com/p/8e0183d6f584

iOS返回tabbar页面
ios返回到tabbar的某个页面，总结了三种情况：
1.界面都在tabbar上时
比如：点击tabar的一个UIviewcontrol上的一个事件（比如点击按钮）跳转到tabbar上另一个UIviewcontrol页面，只需在事件的点击方法中添加如下代码就可实现
```
self.tabBarController.selectedIndex =3;
```
其中赋值1，代表tabbar对应的下标。一般如果tabbar上有4个选项，那对应的下标为0.1.2.3。

2.目前所在的界面是push的，返回tabbar界面，
在返回的方法里添加如下方法：
```
AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
UIViewController *controller = app.window.rootViewController;
//TabBarController是继承于UITabBarController） 
TabBarController *rvc = (TabBarController *)controller;
//假如要跳转到第四个tabBar那里，因为tabBar默认索引是从0开始的
[rvc setSelectedIndex:3];
[self.navigationController popToRootViewControllerAnimated:YES];
```
注意：这里是以TabBarController为window.rootViewController，如果你的tabbar不是根控制器，那么就没法返回。

3.目前所在的界面是模态（present）推出的，返回tabbar界面
在返回的方法里添加如下方法：
```
[self dismissViewControllerAnimated:YES completion:^{
  // 这是从一个模态出来的页面跳到tabbar的某一个页面
 AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
 //TabBarController是继承于UITabBarController） 
 TabBarController *tabViewController = (TabBarController *) appDelegate.window.rootViewController;
 [tabViewController setSelectedIndex:2];
}];
```
注意：模态推出的界面是tabbar里的界面进入的，如果这个模态推出的界面与tabbar中间隔了好几层UIviewcontrol，那么用这个方法返回，虽然能到tabbar界面，但你在点tabbar上其他按钮时，界面就乱了。（如果你没有出现这个问题，请忽略）。
以下链接写的已经很详细了，我只是把我写的过程中遇到的问题写出来，供大家参考。如果有什么问题，欢迎下方留言评论
参考链接：
iOS 跳转到指定tabBar界面.
iOS跳转到指定TabBar界面.
iOS跳转到指定tabBar界面.

作者：GatesLand
链接：https://www.jianshu.com/p/8e0183d6f584
来源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。



iOS 从子视图跳转到指定tabBar界面
https://blog.csdn.net/xlawszero/article/details/84849832








自己代码中
```
- (void)gotoTradeController {
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    MWSBaseNaigationViewController *currentNavigation = (MWSBaseNaigationViewController *)appDelegate.window.rootViewController;
    if (![currentNavigation isKindOfClass:[MWSBaseNaigationViewController class]]) {
        return;
    }
    MWSTabBarController *tabBarVC = (MWSTabBarController *)[currentNavigation.viewControllers objectOrNilAtIndex:0];
    if (![tabBarVC isKindOfClass:[MWSTabBarController class]]) {
        return;
    } 
    [tabBarVC setSelectedIndex:1];
    [currentNavigation setViewControllers:[self popedRootViewControllers] animated:YES];
}
 
- (NSMutableArray *)popedRootViewControllers {
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    MWSBaseNaigationViewController *currentNavigation = (MWSBaseNaigationViewController *)appDelegate.window.rootViewController;
    if (![currentNavigation isKindOfClass:[MWSBaseNaigationViewController class]]) {
        return nil;
    }
    UIViewController *topVC = currentNavigation.topViewController;
    [self dismissViewControllerTo:topVC completion:nil];
    return @[currentNavigation.viewControllers[0]].mutableCopy;
}

```
