#自定义TabBar添加背景图片

iOS UITabBar添加背景图片、去掉shadow线
https://blog.csdn.net/zhw521411/article/details/85103383

```
//[[UITabBar appearance] setBackgroundImage:[[UIImage imageNamed:@“tabbarBack”] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];//此种方法改变背景,但是图片变短重复铺
UIImageView *ima = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@“tabbarBack”]];
ima.frame = CGRectMake(0,0,self.view.frame.size.width, 49);
self.tabBar.opaque = YES;
[self.tabBar insertSubview:ima atIndex:0];
//去黑线
[[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
[UITabBar appearance].layer.borderWidth = 0.0f;
[UITabBar appearance].clipsToBounds = YES;
```
