#广告banner无限滚动


iOS 实现UIScrollView的无限轮播（原理）
https://www.jianshu.com/p/7c4b79e5b123


github 上star比较好的
TYCyclePagerView
https://github.com/12207480/TYCyclePagerView

SDCycleScrollView
https://github.com/gsdios/SDCycleScrollView
```

```


demo
选项卡
http://code.cocoachina.com/view/1000588
https://github.com/Tonyleu/DemoSlideView
```
- (void)createSlideView {
    NSArray *viewControllers = @[@{@"Page1":[ContentView new]},@{@"Page2":[ContentView new]},@{@"Page3":[ContentView new]}];
      
    LXHSlideView * SlideView = [[LXHSlideView alloc]initWithFrame:CGRectMake(0, 240, self.view.frame.size.width, 260) WithViewControllers:viewControllers];
      
    [self.view addSubview:SlideView];
}

```

简单的Banner
LXHBanner
http://code.cocoachina.com/view/1000586
```
- (void)createBannerView {
    NSArray * array = @[@"Demo", @"Demo1", @"Demo2", @"Demo3"];
    LXHBanner * view = [[LXHBanner alloc]initWithFrame:CGRectMake(16, 100,self.view.frame.size.width - 32, 128) :array];
    [self.view addSubview:view];
}
```

第一种
前言
ios实现无限循环滚动主要有两种办法，都利用了UIScrollView，第一种是创建一个很大的UIScrollView（(n+2)*屏幕宽度），把要展示的图片都添加到这个视图上，通过对偏移值的更改达到循环的效果；第二种是创建一个三倍屏幕大小的UIScrollView，只使用三张图片，通过不断更新图片来达到循环的效果。
 
附：
ios之实现自动无限循环滚动视图（1）
https://blog.csdn.net/weixin_42643216/article/details/97952808


第二种
前言
ios实现无限循环滚动的两种方法，昨天已经讲了第一种，第一种方法的弊端是，假如要展示很多张图片（成百上千张），UIScrollView要设置的contentSize值会非常大，同时，假如这些图片都是从网络下载的，要先一次性下载全部的图片明显也不合理。因此一般采用第二种方法，只用三个图片视图用于展示，每次滑动结束后再获取新的图片数据，然后重新展示到视图上。

附：
ios之实现自动无限循环滚动视图（2）
https://blog.csdn.net/weixin_42643216/article/details/98081237
 





iOS实现无限循环轮播图效果
https://www.jb51.net/article/144207.htm
iOS开发：无限循环轮播图
https://blog.csdn.net/u012234115/article/details/53905732
demo
https://github.com/tashaxing/CarouseView
