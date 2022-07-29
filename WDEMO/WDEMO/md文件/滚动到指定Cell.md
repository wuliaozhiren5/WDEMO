#滚动到指定Cell

 

-------------------------------------------------------

UICollectionView滚动到指定Cell不生效问题
https://www.jianshu.com/p/f6d724ef8941

```
[self.collectionView layoutIfNeeded];
[self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredVertically animated:NO];
```
------------------------------------------------------------

UITableView 滚动到指定行cell
https://blog.csdn.net/foolsong/article/details/49842009
```
[self.tableview scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:temp inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
```

iOS tableView滚动到相应位置
https://www.jianshu.com/p/323ef015e3dd
1、tableView一行代码滚动到顶部
```
 [self.tableView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:YES];
```
tableView一行代码滚动对应cell
``
//获取到需要跳转位置的行数
NSIndexPath *scrollIndexPath = [NSIndexPath indexPathForRow:10 inSection:0];
//滚动到其相应的位置
[[self tableView] scrollToRowAtIndexPath:scrollIndexPath
        atScrollPosition:UITableViewScrollPositionTop animated:YES];
```
枚举类型
```
以下枚举决定滚动到指定位置的哪个位置
typedef NS_ENUM(NSInteger, UITableViewScrollPosition) {
    UITableViewScrollPositionNone,
    UITableViewScrollPositionTop,    
    UITableViewScrollPositionMiddle,   
    UITableViewScrollPositionBottom
};
```
2、scrollView一行代码滚动到顶部
```
  [self.scrollView setContentOffset:CGPointMake(0,0) animated:YES];
```

https://www.jianshu.com/p/8f6b8b2be986
https://www.cnblogs.com/hero11223/p/9237205.html


--------------------------------------------------------------------------------

IOS学习之UITableView滚动到指定位置
https://www.cnblogs.com/oyhj/p/4959731.html
方法一：
```
[self.tableView reloadData];
[self.tableView layoutIfNeeded];
//刷新完成
```

方法二：
```
[self.tableView reloadData];
dispatch_async(dispatch_get_main_queue(), ^{
    //刷新完成
});
```


 
