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
