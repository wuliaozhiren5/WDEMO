#iOS 删除所有子View

iOS 删除所有子View
https://blog.csdn.net/lwjok2007/article/details/50817624
比如说我们要删除当前View的所有子View 一行代码即可搞定
```
[self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
```
