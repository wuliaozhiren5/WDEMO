#pop到指定控制器

 
//iOS 滑动返回到指定控制器，pop到指定控制器
//https://www.jianshu.com/p/9c26df8e6382
//

点击返回按钮，返回到指定控制器
```
for (UIViewController *controller in self.navigationController.viewControllers) {
    if (controller isKindOfClass:[XXViewController Class]) {
       [self.navigationController popToViewController:controller animated:YES];
       return;
    }
}
```

关闭滑动返回手势
```
self.navigationController.interactivePopGestureRecognizer.enabled = NO;
```





 





 
