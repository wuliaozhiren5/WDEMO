#UIView中坐标转换

UIView中坐标转换中convertRect:toView与convertRect:fromView的关系
https://blog.csdn.net/u012581760/article/details/80249315

view 中有 红
红     中有 蓝
```
CGRect newRect = [self.view convertRect:self.blueView.frame fromView:self.redView];
相等于:
CGRect newRect = [self.redView convertRect:self.blueView.frame toView:self.view];
打印结果都为:{{200, 250}, {50, 50}}
上面的两行代码都表示:算出在红色控件里的蓝色控件在控制器view中的位置（其实就是算x和y的值，因为宽高不变）

————————————————
版权声明：本文为CSDN博主「harkecho」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/u012581760/article/details/80249315
```



iOS获取点击的点在屏幕上的坐标，获取某个view在屏幕上的位置
https://blog.csdn.net/weixin_34007879/article/details/88038107

```
1.获取点击事件的点相对于屏幕的位置
如果点击事件是如下这个方法（将UIEvent当做参数传回来）

-(void)expandButtonClicked:(id)sender withEvent:(UIEvent*)event

那么点击的位置相对于屏幕的坐标就是：

UITouch* touch = [[event touchesForView:btn] anyObject];
CGPoint rootViewLocation = [touch locationInView:[FtAppDelegate shareAppDelegate].rootViewCtrl.view];

2.如果想知道一个view相对于屏幕或者另外一个view 的坐标，那么可以通过如下的方法得到：

UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
CGRect rect=[bView convertRect: bView.bounds toView:window];

```
