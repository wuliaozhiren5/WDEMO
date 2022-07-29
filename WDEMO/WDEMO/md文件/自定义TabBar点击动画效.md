#iOS tabbar点击动画效果实现

iOS tabbar点击动画效果实现
https://www.cnblogs.com/yajunLi/p/6288811.html

iOS UITabbar图标点击动画效果实现
https://blog.csdn.net/fongim/article/details/88422233


正常情况下，我们点击tabbar都只有一个变色效果，但有时候，如果我们想给它添加一个点击动画，该如何做呢？
 
原理：利用UITabBarController实现，在tabbar的 didSelectItem 代理里添加动画效果。

下面就以上几种场景贴上代码：

准备代码：
```
@interface MainTabbarVC ()<UITabBarControllerDelegate>
@property (nonatomic,assign) NSInteger  indexFlag;　　//记录上一次点击tabbar，使用时，记得先在init或viewDidLoad里 初始化 = 0
@end
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    NSInteger index = [self.tabBar.items indexOfObject:item];
    if (index != self.indexFlag) {
        //执行动画
        NSMutableArray *arry = [NSMutableArray array];
        for (UIView *btn in self.tabBar.subviews) {
            if ([btn isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
                 [arry addObject:btn];
            }
        }
        //添加动画　　　　 //---将下面的代码块直接拷贝到此即可---
        
        self.indexFlag = index;
    }
}
```

1、先放大，再缩小
```
//放大效果，并回到原位
CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//速度控制函数，控制动画运行的节奏
animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
animation.duration = 0.2;       //执行时间
animation.repeatCount = 1;      //执行次数
animation.autoreverses = YES;    //完成动画后会回到执行动画之前的状态
animation.fromValue = [NSNumber numberWithFloat:0.7];   //初始伸缩倍数
animation.toValue = [NSNumber numberWithFloat:1.3];     //结束伸缩倍数
[[arry[index] layer] addAnimation:animation forKey:nil];
```

2、Z轴旋转
```
//z轴旋转180度
CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
//速度控制函数，控制动画运行的节奏
animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
animation.duration = 0.2;       //执行时间
animation.repeatCount = 1;      //执行次数
animation.removedOnCompletion = YES;
animation.fromValue = [NSNumber numberWithFloat:0];   //初始伸缩倍数
animation.toValue = [NSNumber numberWithFloat:M_PI];     //结束伸缩倍数
[[arry[index] layer] addAnimation:animation forKey:nil];
```

3、Y轴位移
```
//向上移动
CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
//速度控制函数，控制动画运行的节奏
animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
animation.duration = 0.2;       //执行时间
animation.repeatCount = 1;      //执行次数
animation.removedOnCompletion = YES;
animation.fromValue = [NSNumber numberWithFloat:0];   //初始伸缩倍数
animation.toValue = [NSNumber numberWithFloat:-10];     //结束伸缩倍数
[[arry[index] layer] addAnimation:animation forKey:nil];
```

4、放大并保持
```
//放大效果
CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//速度控制函数，控制动画运行的节奏
animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
animation.duration = 0.2;       //执行时间
animation.repeatCount = 1;      //执行次数
animation.removedOnCompletion = NO;
animation.fillMode = kCAFillModeForwards;           //保证动画效果延续
animation.fromValue = [NSNumber numberWithFloat:1.0];   //初始伸缩倍数
animation.toValue = [NSNumber numberWithFloat:1.15];     //结束伸缩倍数
[[arry[index] layer] addAnimation:animation forKey:nil];
//移除其他tabbar的动画
for (int i = 0; i<arry.count; i++) {
    if (i != index) {
        [[arry[i] layer] removeAllAnimations];
    }
}
```
