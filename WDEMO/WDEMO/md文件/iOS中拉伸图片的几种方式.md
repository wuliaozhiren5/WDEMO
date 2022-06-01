#iOS中拉伸图片的几种方式
https://www.jianshu.com/p/c9cbbdaa9b02


方式三:（iOS6）
利用下面的方法: 
```
- (UIImage *)resizableImageWithCapInsets:(UIEdgeInsets)capInsets resizingMode:(UIImageResizingMode)resizingMode NS_AVAILABLE_IOS(6_0); 
// the interior is resized according to the resizingMode
```

说明:相比iOS5中的方法多了一个resizingMode参数
```
typedef NS_ENUM(NSInteger, UIImageResizingMode) {
    UIImageResizingModeTile, // 平铺模式，通过重复显示UIEdgeInsets指定的矩形区域来填充图片
    UIImageResizingModeStretch, // 拉伸模式，通过拉伸UIEdgeInsets指定的矩形区域来填充图片
};
```

具体代码如下：
```
// 加载图片
UIImage *image = [UIImage imageNamed:@"chat_send_nor"];

// 设置端盖的值
CGFloat top = image.size.height * 0.5;
CGFloat left = image.size.width * 0.5;
CGFloat bottom = image.size.height * 0.5;
CGFloat right = image.size.width * 0.5;

// 设置端盖的值
UIEdgeInsets edgeInsets = UIEdgeInsetsMake(top, left, bottom, right);
// 设置拉伸的模式
UIImageResizingMode mode = UIImageResizingModeStretch;

// 拉伸图片
UIImage *newImage = [image resizableImageWithCapInsets:edgeInsets resizingMode:mode];

// 设置按钮的背景图片
[btn setBackgroundImage:newImage forState:UIControlStateNormal];
```
