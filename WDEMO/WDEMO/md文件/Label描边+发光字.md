#Label描边+发光字
 
 
 Label描边+发光字
 
【iOS UI篇】Label描边+发光字
https://www.jianshu.com/p/4fd1a769559a

github
https://github.com/luckyzhu/myPrepo


本文介绍如何给Label实现酷炫的描边+外发光效果，虽然实现简单，但是网上资料却是很少。

绘制实现描边
继承Lable,重写下面方法
.h文件：

```
#import "MSStrokeLabel.h"

@property (strong,nonatomic) UIColor *strokeColor;
@property (assign,nonatomic) CGFloat strokeWidth;
```

.m文件
```
- (void)drawTextInRect:(CGRect)rect
{
    if (self.strokeWidth > 0) {
        CGSize shadowOffset = self.shadowOffset;
        UIColor *textColor = self.textColor;
    
        CGContextRef c = UIGraphicsGetCurrentContext();
        CGContextSetLineWidth(c, self.strokeWidth);
        CGContextSetLineJoin(c, kCGLineJoinRound);
        //画外边
        CGContextSetTextDrawingMode(c, kCGTextStroke);
        self.textColor = self.strokeColor;
        [super drawTextInRect:rect];
        //画内文字
        CGContextSetTextDrawingMode(c, kCGTextFill);
        self.textColor = textColor;
        self.shadowOffset = CGSizeMake(0, 0);
        [super drawTextInRect:rect];
        self.shadowOffset = shadowOffset;
    } else {
        [super drawTextInRect:rect];
    }
}
```

使用方法
```
MSStrokeLabel *label = [MSStrokeLabel new];
label.frame = CGRectMake(160, 70, 150, 100);
label.text = @"Hello";
label.backgroundColor = [UIColor clearColor];
label.textColor = [UIColor greenColor];
label.font = [UIFont systemFontOfSize:50];
//描边
label.strokeColor = [UIColor orangeColor];
label.strokeWidth = 1;
//发光
label.layer.shadowRadius = 2;
label.layer.shadowColor = [UIColor redColor].CGColor;
label.layer.shadowOffset = CGSizeMake(0, 0);
label.layer.shadowOpacity = 1.0;
[self.view addSubview:label];
```



 
