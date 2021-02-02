#空白

iOS父子控制器添加与移除
https://www.jianshu.com/p/8d02bbe5d234


addChildViewController
```
ExampleController *VC = [[ExampleController alloc]init];
VC.view.frame = self.view.bounds;
[self addChildViewController:VC];//1
[self.view addSubview:VC.view];//2
[VC didMoveToParentViewController:self];//3
```

removeFromParentViewController
```
[VC willMoveToParentViewController:nil]; //1
[VC.view removeFromSuperview]; //2
[VC removeFromParentViewController]; //3
```

```
[VC beginAppearanceTransition:YES animated:YES]触发towCol的viewWillAppear。
[VC endAppearanceTransition]触发viewDidAppear。

[VC beginAppearanceTransition:NO animated:YES]触发towCol的viewWillDisappear。
[VC endAppearanceTransition]触发viewDidDisappear。
```



iOS监听系统侧滑返回事件
https://www.jianshu.com/p/b7331546a18b

```
- (void)willMoveToParentViewController:(UIViewController)parent{
    [super willMoveToParentViewController:parent];
    NSLog(@"%s,%@",FUNCTION,parent);
}

- (void)didMoveToParentViewController:(UIViewController)parent{
    [super didMoveToParentViewController:parent];
    NSLog(@"%s,%@",FUNCTION,parent);
    if(!parent){
        NSLog(@"页面pop成功了");
    }
}
```
