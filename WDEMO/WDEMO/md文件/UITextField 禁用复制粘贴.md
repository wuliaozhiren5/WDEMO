#UITextField 禁用复制粘贴



iOS--UITextField 禁用复制粘贴
https://www.jianshu.com/p/274428ed7a2c

自己写了
PasswordTextField

禁用UITextField的复制、粘贴、全选。。。
创建UITextField的子类，重写canPerformAction:withSender:方法
```
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
    {
        if (action == @selector(paste:))//禁止粘贴
            return NO;
        if (action == @selector(select:))// 禁止选择   
            return NO;   
        if (action == @selector(selectAll:))// 禁止全选   
            return NO;  
        return [super canPerformAction:action withSender:sender];
    }
```
整体禁用：
```
-(BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    UIMenuController *menuController = [UIMenuController sharedMenuController];
    if (menuController) {
        [UIMenuController sharedMenuController].menuVisible = NO;
    }
    return NO;
}
```
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
