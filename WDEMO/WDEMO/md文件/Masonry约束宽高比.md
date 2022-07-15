#Masonry约束宽高比

iOS开发-Masonry约束宽高比
 https://www.jianshu.com/p/bd7bd970ea82
 
例子
```
// width/height比为1/3.0，要求是同一个控件的属性比例
  [bottomInnerView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.bottom.mas_equalTo(bottomView);
    make.center.mas_equalTo(bottomView);
    // 注意，这个multipliedBy的使用只能是设置同一个控件的，比如这里的bottomInnerView，
    // 设置高/宽为3:1
    make.height.mas_equalTo(bottomInnerView.mas_width).multipliedBy(3);

    make.width.height.mas_equalTo(bottomView).priorityLow();
    make.width.height.lessThanOrEqualTo(bottomView);
  }];

```
自己代码里
```    
[self.coverImgV mas_makeConstraints:^(MASConstraintMaker *make) {
make.top.equalTo(@(0));
make.leading.equalTo(@(0));
make.trailing.equalTo(@(0));
make.height.mas_equalTo(self.coverImgV.mas_width).multipliedBy(230 / 172.5);
}];

```

宽等于高 1:1
```
    [self.iconImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.leading.trailing.equalTo(@0);
        make.height.equalTo(self.iconImgV.mas_width);
    }];

```
