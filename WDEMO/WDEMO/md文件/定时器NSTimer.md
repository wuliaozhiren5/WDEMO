#定时器NSTimer

```

//追剧提示定时器
@property (nonatomic, strong) NSTimer *followTipTimer;



#pragma mark - FollowTipTimer 定时器
- (void)startFollowTipTimerWithDuration:(CGFloat)duration {
    if (duration <= 0) {
        return;
    }
    //时长的20%进行提示
    CGFloat seconds = duration * 0.2;
    //测试代码，方便测试测试
    //seconds = 5;
    //停止定时器
    [self stopFollowTipTimer];
    NSTimer *timer = [NSTimer timerWithTimeInterval:seconds target:self selector:@selector(showFollowTip) userInfo:nil repeats:NO];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    self.followTipTimer = timer;
}

- (void)stopFollowTipTimer  {
  if (self.followTipTimer) {
      [self.followTipTimer invalidate];
      self.followTipTimer = nil;
  }
}

- (void)showFollowTip {

}

//右滑返回时会调用
- (void)didMoveToParentViewController:(UIViewController *)parent{
    [super didMoveToParentViewController:parent];
    NSLog(@"%s,%@",__FUNCTION__,parent);
    if(!parent){
        NSLog(@"页面pop成功了");
        //停止定时器
        [self stopFollowTipTimer];
    }
}

- (void)popViewController {
//    [super popViewController];
    //停止定时器
    [self stopFollowTipTimer];
}

- (void)dealloc { 
    //停止定时器
    [self stopFollowTipTimer];
}
```
