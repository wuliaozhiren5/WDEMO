#抓包Charles
 
抓包Charles
iOS 真机和模拟器HTTPS Charles抓包指南
https://easeapi.com/blog/blog/91-charles-https.html

```
Charles是十分流行的HTTP代理服务器软件，是移动开发者的常用工具。使用Charles时需要正确的配置才能使其正常工作。笔者常常遗漏某些步骤，每次都花费一些时间查问题，好记忆不如烂笔头，笔者这里记录下操作步骤，方便后续查询。

在macOS上安装Charles证书
在macOS打开Charles->Help->SSL Proxying->Install Charles Root Certificate， 会使用”钥匙串访问”安装。安装之后在”钥匙串访问”中找到”Charles Proxy Custom Root Certificate”，选择”Get Info“->Trust->Always Trust。

在iPhone上安装Charles证书
打开iPhone的无线局域网连接，连上和macOS相同的热点，并在iPhone上配置代理地址为macOS的IP地址，端口号默认为8888.

在macOS打开Charles->Help->SSL Proxying->Install Charles Root Certificate on a Mobile Device。  在iPhone上访问http://chls.pro/ssl，按提示安装证书。

在iPhone上信任证书
 在iPhone中打开通用->关于本机->证书信任设置->开启对Charles证书的信任。

Charles HTTPS配置
还需要针对指定网站开启对https的抓取：
Charles->Proxy->SSL Proxying Settings->勾选Enable SSL Proxying，添加需要抓取的HTTPS地址，端口为443。

iOS模拟器抓包
iOS模拟器抓包和真机抓包类似，额外操作如下：

设置macOS网络代理
在macOS系统偏爱设置->网络->高级->代理->网页代理(HTTP)/安全网页代理(HTTPS)填写本机IP和端口。

安装模拟器证书
勾选Proxy->macOS Proxy，同时操作Help->SSL Proxying->Install Charles Root Certificate in iOS Simulators。iOS模拟器进入Settings->General->Profile，操作安装Charles证书。


```
