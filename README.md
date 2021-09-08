# WDEMO

内容

Macros 宏

Enums 枚举

Constants  常量

瀑布流CollectionView

表格TableView

选择TagBar

3DTouch

UIAlertController

语言包，字体包

一对一联动的CollectionView GaoDengViewController DEMO

UncaughtExceptionHandler

.plist plist文件





//填充数据
cell:  - (void)fillWithData:(id)data; 
//计算高度
cell:  + (CGFloat)heightForCellWithModel:(id)model;
cell:  + (CGFloat)cellHeightWithModel:(id)model;
//创建布局
view: - (void)setupViews;


UI缩写： Btn Lab Lab View VC


git

3： git add --all
4： git commit -m "a"
5：再重新 git pull origin master 
6：没问题再 git push origin master 

``` 
token

git remote set-url origin https://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@github.com/wuliaozhiren5/WDEMO.git/
```

```
warning: Pulling without specifying how to reconcile divergent branches is
discouraged. You can squelch this message by running one of the following
commands sometime before your next pull:

  git config pull.rebase false  # merge (the default strategy)
  git config pull.rebase true   # rebase
  git config pull.ff only       # fast-forward only

You can replace "git config" with "git config --global" to set a default
preference for all repositories. You can also pass --rebase, --no-rebase,
or --ff-only on the command line to override the configured default per
invocation.
————————————————
版权声明：本文为CSDN博主「Pleidy」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/github_50517091/article/details/115628500
```

 ```
warning: 不建议在没有为偏离分支指定合并策略时执行pull操作。 
您可以在执行下一次pull操作之前执行下面一条命令来抑制本消息：

git config pull.rebase false  # 合并（默认缺省策略）
git config pull.rebase true   # 变基
git config pull.ff only       # 仅快进

您可以将 "git config" 替换为 "git config --global" 以便为所有仓库设置
缺省的配置项。您也可以在每次执行 pull 命令时添加 --rebase、--no-rebase，
或者 --ff-only 参数覆盖缺省设置。
```
