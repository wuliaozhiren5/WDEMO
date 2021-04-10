
#tableview section header 不悬停


让UITableView的section header view不悬停的方法
https://www.jianshu.com/p/e505ff6889c8

```
当UITableView的style属性设置为Plain时，这个tableview的section header在滚动时会默认悬停在界面顶端。取消这一特性的方法有两种：

1，将style设置为Grouped。这时所有的section header都会随着scrollview滚动了。不过grouped和plain的样式有轻微区别，切换样式后也许需要重新调整UI

2，重载scrollview的delegate方法

- (void)scrollViewDidScroll1:(UIScrollView *)scrollView {
    CGFloat sectionHeaderHeight=40;
    if(scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset=UIEdgeInsetsMake(-scrollView.contentOffset.y,0,0,0);
    }else if(scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight,0,0,0);
    }
}

这是原出处的地址：http://www.tuicool.com/articles/niuQZjm

作者：陈大帅
链接：https://www.jianshu.com/p/e505ff6889c8
来源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
```



如何让UITableViewHeaderFooterView不停在顶端
https://www.jianshu.com/p/534421a4e483?t=1461599187028

```
//去掉UItableview headerview黏性(sticky)
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.tableView)
    {
        CGFloat sectionHeaderHeight = 64; //sectionHeaderHeight
        if (scrollView.contentOffset.y <= sectionHeaderHeight && scrollView.contentOffset.y >= 0) {
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        } else if (scrollView.contentOffset.y >= sectionHeaderHeight) {
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
        }
    }
}
```
