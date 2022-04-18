#允许使用http协议请求

 

允许iOS项目使用http协议请求的解决办法
https://www.jianshu.com/p/b729a94eeb66
```
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
</dict>
````





  
