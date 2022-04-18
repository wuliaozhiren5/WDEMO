#UIButton状态

UIButton在正常（UIControlStateNormal）和选中状态（UIControlStateSelected）下的高亮状态（UIControlStateHighlighted）
https://www.jianshu.com/p/241993bb2bab

```
UIButton在不同状态下的设置：

UIControlStateNormal 正常状态

UIControlStateHighlighted 高亮状态，按钮按下时状态，在正常状态时按下

UIControlStateSelected 选中状态

UIControlStateSelected|UIControlStateHighlighted 高亮状态，按钮按下时状态，在选中状态时按下

例如：

[btn setImage:  forState:UIControlStateNormal];

[btn setImage:  forState:UIControlStateHighlighted];

[btn setImage:  forState:UIControlStateSelected];

[btn setImage:  forState:UIControlStateSelected|UIControlStateHighlighted];

作者：iOSCoder_XH
链接：https://www.jianshu.com/p/241993bb2bab
来源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
```

 
