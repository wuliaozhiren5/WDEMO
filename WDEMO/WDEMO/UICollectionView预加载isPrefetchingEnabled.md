UICollectionView预加载


isPrefetchingEnabled

UICollectionView setPrefetchingEnabled
https://blog.csdn.net/weixin_30386713/article/details/99972718


UICollectionView 开启是否开启预加载，如果开启，cell在没显示的时候就回去调用cellForIndex…方法，如果没开启，cell只有在显示的时候才会去调用cellForIndex…方法

转载于:https://www.cnblogs.com/yibinpan/p/8366921.html



解释

@property (nonatomic, getter=isPrefetchingEnabled) BOOL prefetchingEnabled;

Discussion
When YES, the collection view requests cells in advance of when they will be displayed, spreading the rendering over multiple layout passes. When NO, the cells are requested as they are needed for display, often with multiple cells being requested in the same render loop. Setting this property to NO also disables data prefetching. The default value of this property is YES.


把对应页面的 collectionView的这个属性修改为NO,应该能解决你遇到的没有展示但是产生曝光埋点的问题


```
if (@available(iOS 10.0, *)) {
    self.collectionView.prefetchingEnabled = NO;
}
```
