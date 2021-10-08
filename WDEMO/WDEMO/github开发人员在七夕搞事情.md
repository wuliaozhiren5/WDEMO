#github开发人员在七夕搞事情：remote: Support for password authentication was removed on August 13, 2021.
https://blog.csdn.net/weixin_41010198/article/details/119698015



也可以 把token直接添加远程仓库链接中，这样就可以避免同一个仓库每次提交代码都要输入token了：

git remote set-url origin https://<your_token>@github.com/<USERNAME>/<REPO>.git

<your_token>：换成你自己得到的token
<USERNAME>：是你自己github的用户名
<REPO>：是你的仓库名称
例如：

git remote set-url origin https://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@github.com/shliang0603/Yolov4_DeepSocial.git/
 
