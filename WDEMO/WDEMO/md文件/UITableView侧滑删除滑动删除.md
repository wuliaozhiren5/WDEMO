#UITableView侧滑删除滑动删除

 
//iOS11解决UITableView侧滑删除无限拉伸的方法
//原文链接：https://www.jb51.net/article/145243.htm
```
- (UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath API_AVAILABLE(ios(11.0)){
 if (@available(iOS 11.0, *)) {
  
  NSString *title = @"置顶";
  if (indexPath.section == 0) {
   title = @"取消置顶";
  } else {
   title = @"置顶";
  }
  UIContextualAction *topAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleNormal title:title handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
   
   ...
   
   // 这句很重要，退出编辑模式，隐藏左滑菜单
   [tableView setEditing:NO animated:YES];
   completionHandler(true);
  }];
  
  UIContextualAction *deleteAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleDestructive title:@"删除" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
   
   // 这句很重要，退出编辑模式，隐藏左滑菜单
   [tableView setEditing:NO animated:YES];
   completionHandler(true);
  }];
  
  UISwipeActionsConfiguration *actions = [UISwipeActionsConfiguration configurationWithActions:@[deleteAction,topAction]];
  // 禁止侧滑无线拉伸
  actions.performsFirstActionWithFullSwipe = NO;
  return actions;
 }else{
  return nil;
 }
}
```


//iOS 11 删除
//iOS 11 editActionsForRowAtIndexPath
//https://www.jianshu.com/p/75f6264e5cb5 
```
// iOS 11 新特性 左边侧滑

- (nullable UISwipeActionsConfiguration *)tableView:(UITableView *)tableView leadingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath {
}

// iOS 11 新特性 右边侧滑
- (nullable UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath {
}
```
