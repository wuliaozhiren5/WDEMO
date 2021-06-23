#按钮选中这时时候图片闪烁问题Selected

按钮在UIControlStateSelected状态设置图片，莫名其妙的闪烁问题
https://www.jianshu.com/p/b65047f732d3

让UIButton在按下时没有高亮效果
https://www.cnblogs.com/ihojin/p/uicontrolstate.html


```
以前问题：会有按钮在UIControlStateSelected状态设置图片，莫名其妙的闪烁问题
UIImage *someImage = [UIImage imageNamed:@"SomeResource.png"];
UIImage *someImage1 = [UIImage imageNamed:@"SomeResource.png"]; 
[button setBackgroundImage:someImage1 forState:UIControlStateNormal];
//[button setBackgroundImage:someImage forState:UIControlStateHighlighted];
[button setBackgroundImage:someImage forState:UIControlStateSelected];

解决 
[button setBackgroundImage:someImage forState:(UIControlStateHighlighted|UIControlStateSelected];
 

我的代码中解决
- (UIButton *)praiseBtn {
    if (!_praiseBtn) {
        _praiseBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320, 45)];
        [_praiseBtn setImage:IMAGENAME(@"ic_comment_like_n") forState:UIControlStateNormal];
        [_praiseBtn setImage:IMAGENAME(@"ic_comment_like_h") forState: UIControlStateHighlighted | UIControlStateSelected];
        [_praiseBtn setImage:IMAGENAME(@"ic_comment_like_h") forState:UIControlStateSelected];
        _praiseBtn.selected = YES;
        _praiseBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    }
    return _praiseBtn;
}

```
