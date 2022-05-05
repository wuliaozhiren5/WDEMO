#view旋转角度

---------------------------------------------------------------------------------------------------------
ios-如何将UIImageView旋转20度？
https://www.itranslater.com/qa/details/2582907939778462720

如果要向右转，则如果要向左旋转，则该值必须大于0，并用符号“-”表示该值。 例如-20。

CGFloat degrees = 20.0f; //the value in degrees
CGFloat radians = degrees * M_PI/180;
imageView.transform = CGAffineTransformMakeRotation(radians);

---------------------------------------------------------------------------------------------------------
iOS 围绕某点转动(锚点)动画
https://www.jianshu.com/p/cf378851d809
 
 ---------------------------------------------------------------------------------------------------------
 
 ios view绕指定点旋转和绕中心不停旋转
 https://blog.csdn.net/baidu_40537062/article/details/89030093
 原文链接：https://blog.csdn.net/baidu_40537062/article/details/89030093
 
 ios view绕指定点旋转和绕中心不停旋转
 1.绕指定点旋转
 1.1 设置旋转中心点：在不改变view在父视图中的位置的情况下，改变anchorPoint.(界面中其他视图的位置变化，甚至label.text的细微变化都会影响view的位置，所以把旋转中心点放在透明的父view的中心可能是更好的解决方案)
```
 [self setAnchorPoint:CGPointMake(0.6, 0.1) forView:self.switchImageView];
 - (void)setAnchorPoint:(CGPoint)anchorPoint forView:(UIView *)view
 {
     CGPoint oldOrigin = view.frame.origin;
     view.layer.anchorPoint = anchorPoint;
      CGPoint newOrigin = view.frame.origin;
     CGPoint transition;
     transition.x = newOrigin.x - oldOrigin.x;
     transition.y = newOrigin.y - oldOrigin.y;
     view.center = CGPointMake (view.center.x - transition.x, view.center.y - transition.y); 
 ```
 
 1.2 旋转一定角度
 ```
 self.switchImageView.transform = CGAffineTransformMakeRotation(-M_PI*0.3);
```
 1.3 还原
 ```
 self.switchImageView.transform = CGAffineTransformIdentity;
```
 2.绕中心不停旋转
 ```
 - (void)rotateView:(UIImageView *)view

 {
     [view.layer removeAllAnimations];
       CABasicAnimation *rotationAnimation;
       rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
       rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI*2.0];
       rotationAnimation.duration = 1;
       rotationAnimation.repeatCount = HUGE_VALF;
      [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
 }
```
 
#重要
#实际使用代码
```
//        52.5-48
        UIView *view  = [[UIView alloc] initWithFrame:CGRectMake(0, 52.5, 320, 20)];
        view.backgroundColor = [UIColor blackColor];
        [_titleBackgroundImgV addSubview:view];
        
        [self setAnchorPoint:CGPointMake(0, 0) forView:view];
        CGFloat degrees = -2.7f; //the value in degrees
        CGFloat radians = degrees * M_PI / 180;
        view.transform = CGAffineTransformMakeRotation(radians);
        
        
        
        - (void)setAnchorPoint:(CGPoint)anchorPoint forView:(UIView *)view
        {
            CGPoint oldOrigin = view.frame.origin;
            view.layer.anchorPoint = anchorPoint;
            CGPoint newOrigin = view.frame.origin;
            CGPoint transition;
            transition.x = newOrigin.x - oldOrigin.x;
            transition.y = newOrigin.y - oldOrigin.y;
            view.center = CGPointMake (view.center.x - transition.x, view.center.y - transition.y);
        }

```
