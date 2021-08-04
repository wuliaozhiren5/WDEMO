#self.view = nil



ViewController中玩过self.view = nil; 吗？
https://www.jianshu.com/p/8e051e48e9b0


在ViewController中执行
```
self.view = nil;
```
```
#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    if ([self isViewLoaded] && self.view.window == nil) {
        self.view = nil;
    }
    
    dataArray = nil;
}
```

