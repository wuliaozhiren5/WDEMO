
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

 
