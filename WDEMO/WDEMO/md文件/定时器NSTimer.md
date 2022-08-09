#定时器NSTimer

//不重复的定时器
```

//追剧提示定时器
@property (nonatomic, strong) NSTimer *followTipTimer;



#pragma mark - FollowTipTimer 定时器
- (void)startFollowTipTimerWithDuration:(CGFloat)duration {
    if (duration <= 0) {
        //停止定时器
        [self stopFollowTipTimer];
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


------------------------------------------------------
//常用
//每隔1秒的定时器
```
@property (nonatomic, strong) NSTimer *timer;


- (void)updateViews { 

    //当前时间（秒）
    NSDate *data = [NSDate date];
    NSTimeInterval nowTime = [data timeIntervalSince1970];
    //过期时间（秒）
    NSTimeInterval expireTime = self.tradeModel.expireTime / 1000.0;
    //相差的时间（秒）
    NSInteger allSeconds = expireTime - nowTime;
   
    if (allSeconds > 0) {
        [self startTimer];
    } else {
        //停止定时器
        [self stopTipTimer];
//        [self showTip];
        
        NSString *showTimeStr = @"00:00:00";
        self.header.topView.countDownTimeLab.text = showTimeStr;
    }
    
}

#pragma mark - Timer 定时器
- (void)startTimer {
   
    //停止定时器
    [self stopTipTimer];
    //每隔一秒
    CGFloat duration = 1;
    NSTimer *timer = [NSTimer timerWithTimeInterval:duration target:self selector:@selector(showTip) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    self.timer = timer;
}

- (void)stopTipTimer  {
  if (self.timer) {
      [self.timer invalidate];
      self.timer = nil;
  }
}

- (void)showTip {
    //当前时间（秒）
    NSDate *data = [NSDate date];
    NSTimeInterval nowTime = [data timeIntervalSince1970];
    //过期时间（秒）
    NSTimeInterval expireTime = self.tradeModel.expireTime / 1000.0;
    //相差的时间（秒）
    NSInteger allSeconds = expireTime - nowTime;
   
    if (allSeconds <= 0) {
        allSeconds = 0;
        //停止定时器
        [self stopTipTimer];
    }

    //秒数
    NSInteger seconds = allSeconds % 60;
    //分钟：(allSeconds /60) 转换为分钟
    NSInteger minute = (allSeconds / 60) % 60;
    //小时
    NSInteger hour = allSeconds / (60 * 60);

    NSString *showTimeStr = [NSString stringWithFormat:@"%02zi:%02zi:%02zi", hour, minute, seconds];
    self.header.topView.countDownTimeLab.text = showTimeStr;
    
}

//右滑返回时会调用
- (void)didMoveToParentViewController:(UIViewController *)parent{
    [super didMoveToParentViewController:parent];
    NSLog(@"%s,%@",__FUNCTION__,parent);
    if(!parent){
        NSLog(@"页面pop成功了");
        //停止定时器
        [self stopTipTimer];
    }
}

- (void)backButtonClick {
    [super backButtonClick];
    //停止定时器
    [self stopTipTimer];
}
 
- (void)dealloc {
    //停止定时器
    [self stopTipTimer];
}

```
