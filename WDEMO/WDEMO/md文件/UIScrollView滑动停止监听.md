
#UIScrollView滑动停止监听

UIScrollView滑动停止监听
https://www.jianshu.com/p/c68d58413126

第一种：
```
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (!decelerate) {
        BOOL dragToDragStop = scrollView.tracking && !scrollView.dragging && !scrollView.decelerating;
        if (dragToDragStop) {
            [self scrollViewDidEndScroll];
        }
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    BOOL scrollToScrollStop = !scrollView.tracking && !scrollView.dragging && !scrollView.decelerating;
    if (scrollToScrollStop) {
        [self scrollViewDidEndScroll];
    }
}


- (void)scrollViewDidEndScroll {
   //在这里写监听滑动停止要做的事
}
```


使用Masonry对UIScrollView自动布局 
https://www.cnblogs.com/lurenq/archive/2019/03/20/10567098.html

Masonry适配——UIScrollView的设置
https://www.jianshu.com/p/5f3d5807ad53

水平方向
```
UIScrollView *horizontalScrollView = [[UIScrollView alloc] init];
horizontalScrollView.backgroundColor = [UIColor orangeColor];
horizontalScrollView.pagingEnabled =YES;
// 添加scrollView添加到父视图，并设置其约束
[self.view addSubview:horizontalScrollView];
[horizontalScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(100);
}];
// 创建过渡视图并设置contentSize和其约束
UIView *horizontalContainerView = [[UIView alloc] init];
[horizontalScrollView addSubview:horizontalContainerView];
[horizontalContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(horizontalScrollView);
        make.height.equalTo(horizontalScrollView);#//水平滚动高度固定，这个很重要
}];
//过渡视图上添加子视图
UIView *previousView =nil;
for (int i =0; i <10; i++) {

        UILabel *label = [[UILabelalloc]init];
        label.textAlignment =NSTextAlignmentCenter;
        label.backgroundColor = [UIColorcolorWithHue:(arc4random() %256 / 256.0)
                                          saturation:(arc4random() %128 /256.0) +0.5
                                          brightness:(arc4random() %128 /256.0) +0.5
                                               alpha:1];
        label.text = [NSStringstringWithFormat:@"第 %d个视图", i];
      
       //添加到过渡视图，并设置子视图的约束
        [horizontalContainerView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.bottom.equalTo(horizontalContainerView);
            make.width.equalTo(horizontalScrollView);
            
            if (previousView) {
                make.left.mas_equalTo(previousView.mas_right);
            }
            else {
                make.left.mas_equalTo(0);
            }
        }];
 
        previousView = label;
}
#// 设置过渡视图的右距（此设置将影响到scrollView的contentSize）这个也是关键的一步
[horizontalContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(previousView.mas_right);
}];
```

垂直平方向
```
UIScrollView *verticalScrollView = [[UIScrollView alloc] init];
verticalScrollView.backgroundColor = [UIColor greenColor];
verticalScrollView.pagingEnabled =YES;
// 添加scrollView添加到父视图，并设置其约束
[self.view addSubview:verticalScrollView];
[verticalScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.bottom.and.right.mas_equalTo(-10.0);
        make.height.mas_equalTo(100);
}];
// 设置scrollView的子视图，即过渡视图contentSize，并设置其约束
UIView *verticalContainerView = [[UIView alloc] init];
[verticalScrollView addSubview:verticalContainerView];
[verticalContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.and.right.equalTo(verticalScrollView);
        make.width.equalTo(verticalScrollView);#//垂直滚动宽度固定，这个很重要
}];
//过渡视图添加子视图
UIView *lastView =nil;
for (NSInteger index =0; index <10; index++) {

        UILabel *label = [[UILabelalloc]init];
        label.textAlignment =NSTextAlignmentCenter;
        label.backgroundColor = [UIColorcolorWithHue:(arc4random() %256 / 256.0)
                                          saturation:(arc4random() %128 /256.0) +0.5
                                          brightness:(arc4random() %128 /256.0) +0.5
                                               alpha:1];
        label.text = [NSStringstringWithFormat:@"第 %ld个视图", index];
        
        
       //添加到过渡视图，并设置子视图的约束
        [verticalContainerView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(verticalContainerView);
            make.height.mas_equalTo(verticalScrollView.mas_height);
            
            if (lastView)  {
                make.top.mas_equalTo(lastView.mas_bottom);
            }
            else  {
                make.top.mas_equalTo(0);
            }
        }];
        
        lastView = label;
}
    
#// 设置过渡视图的底边距（此设置将影响到scrollView的contentSize）这个也是关键的一步
[verticalContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastView.mas_bottom);
}];
```






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
