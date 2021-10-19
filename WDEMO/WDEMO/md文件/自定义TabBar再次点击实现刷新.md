#iOS开发之TabBar再次点击实现刷新
https://www.jianshu.com/p/fdc8ad60c4c0


2018.4.28 补充
本文被转载后，有很多好心的读者进行批评指正：这种方式不够优雅，不够简单。怎么最简单呢？其实只要重写UITabBarController的代理就可以实现，方法如下
```
//这个是UITabBarController的代理方法
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    
    // 判断哪个界面要需要再次点击刷新，这里以第一个VC为例
    if ([tabBarController.selectedViewController isEqual:[tabBarController.viewControllers firstObject]]) {
        // 判断再次选中的是否为当前的控制器
        if ([viewController isEqual:tabBarController.selectedViewController]) {
            // 执行操作
            NSLog(@"刷新界面");
         
            return NO;
        }
        
    }
    
    return YES;

}
```
作者：YungFan
链接：https://www.jianshu.com/p/fdc8ad60c4c0
来源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
