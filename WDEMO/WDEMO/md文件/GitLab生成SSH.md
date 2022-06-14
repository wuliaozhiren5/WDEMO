 #GitLab生成SSH Key（Mac）

百度搜索
sshkey gitlab mac

使用GitLab生成SSH Key（Mac）
https://blog.csdn.net/csdn_aiyang/article/details/115637740
使用GitLab生成SSH Key（Mac）
https://www.jianshu.com/p/85f0fd55838b

GitLab简介：

公司代码放在gitlab上，想要拉去代码，需要先生成了一个SSH Key上传至gitlab。
直接说步骤：

第一步：检查是否已经存在SSH Key
打开电脑终端，输入以下命令

ls -al ~/.ssh  
会出现两种情况

终端出现文件id_rsa.pub 或 id_dsa.pub，则表示该电脑已经存在SSH Key
终端未出现id_rsa.pub 或 id_dsa.pub文件，表示该电脑还没有配置SSH Key
第二步：生成/设置SSH Key
1. 终端出现文件id_rsa.pub 或 id_dsa.pub，则表示该电脑已经存在SSH Key
此时可继续输入命令：

pbcopy < ~/.ssh/id_rsa.pub     
这时，SSH Key 已经复制到粘贴板上了，直接进入第三步

2. 终端未出现id_rsa.pub 或 id_dsa.pub文件，表示该电脑还没有配置SSH Key
此时需要输入命令：

ssh-keygen -t rsa -C "your_email@163.com"       
your_email@163.com就是你的邮箱。
这时候，默认会在相应路径下（/your_home_path）生成id_rsa和id_rsa.pub两个文件
并且终端会显示：

Generating public/private rsa key pair.
Enter file in which to save the key (/your_home_path/.ssh/id_rsa): 
连续敲回车键，之间有可能会输入密码，即开机密码。

此时再进行第一步，即输入：pbcopy < ~/.ssh/id_rsa.pub，一般会生成id_rsa.pub或 id_dsa.pub`两个文件。

第三步：将SSH Key添加到GitLab中
打开GitLab，找到左边栏有一个🔑的按钮，点击ADD SSH KEY按钮添加，将已经获得的SSH Key粘贴到Key，点击加入项目，这样就保持了本地与服务器端的联系.

"🔑"已替换为 Profile Setting里的"SSH Key"

作者：挣奶粉的打工人
链接：https://www.jianshu.com/p/85f0fd55838b
来源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。



 
