
#ScrollView使用Masonry布局
 
///////////////////////////////////////////////////////////////////////////

//ScrollView使用Masonry布局
//https://www.jianshu.com/p/074a29ff96ef

//ScrollView使用Masonry自动布局
//https://www.jianshu.com/p/689bc02da6ea


Masonry 布局 scrollView
https://www.cnblogs.com/wjw-blog/p/11215533.html
 
原理
scrollView的高度（纵向滑动时）时靠内部的子控件撑起来的。我们直接给ScrollView布局会发现失败。用层级检查器发现，ScrollVIiw的高度有问题，我们可以选择添加一个UIView容器，约束容器的edge.equalTo(self.scrollView)，和 containerView.height.mas_equalTo(self.scrollView);
往这个容器中添加控件，所有子空间相对于容器布局。
最后一个控件不要忘记 添加一个 和 容器底部的约束。否则 容器的高度是0， 里面所有的控件都无法响应手势了。因为 容器的size为0时，手势做坐标转换时响应链到达控制器时不是原来的期望的坐标了。
而且高度为0 的控件本来就是不因该存在的。

```
//
[self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.equalTo(self.view).offset(kNaviHeight);
    make.left.right.bottom.equalTo(self.view);
    make.width.mas_equalTo(kScreenW);
    make.height.mas_equalTo(kScreenH -(kNavHeight);
}];

//容器
[self.scrollView addSubview:self.conatinerView];
[self.conatinerView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.edges.equalTo(self.scrollView);
    make.width.equalTo(self.scrollView);
}];

[self.subView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.equalTo(self.someChildView.mas_bottom);
    make.left.right.equalTo(self.conatinerView);//左右约束
    make.height.mas_equalTo(kOneLineItemHeight);
    make.bottom.equalTo(self.conatinerView);//这个不能忘记
}];
```

```
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
//        _scrollView.backgroundColor = kCOLOR_FFFFFF;
        
//        _scrollView.delegate = self;
////        _scrollView.delegate = self;
//        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
//        [_scrollView addGestureRecognizer:tap];
        
        if (@available(iOS 11.0, *)) {
            _scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            //        self.automaticallyAdjustsScrollViewInsets = NO;
        }
    }
    return _scrollView;
    
}
```
