#IDFA权限弹框，弹出框
 
ios审核被拒-ios15下IDFA权限申请无法弹出
链接：https://www.jianshu.com/p/fa1231b275b0
 
文案 
获取IDFA标记权限向您提供更优质、安全的个性化服务及内容；开启后，您也可以前往系统“设置-隐私 ”中随时关闭。

此标识符将用于向您推荐个性化广告。

```
1.在info.plist文件里添加跟踪权限请求描述文字:
<key>NSUserTrackingUsageDescription</key>

<string>此标识符将用于向您推荐个性化广告。</string>
  

2.导入框架：
#import <AppTrackingTransparency/AppTrackingTransparency.h>

#import <AdSupport/ASIdentifierManager.h>


3.获取IDFA:

- (void)getIDFA {
    if (@available(iOS 14, *)) { // iOS14及以上版本需要先请求权限
        [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) { // 获取到权限后，依然使用老方法获取idfa
            if (status == ATTrackingManagerAuthorizationStatusAuthorized) {
                NSString *idfa = [[ASIdentifierManager sharedManager].advertisingIdentifier UUIDString];
                NSLog(@"%@",idfa);
            } else {
                NSLog(@"请在设置-隐私-跟踪中允许App请求跟踪");
            }}];
    } else {
        // iOS14以下版本依然使用老方法
        // 判断在设置-隐私里用户是否打开了广告跟踪
        if ([[ASIdentifierManager sharedManager] isAdvertisingTrackingEnabled]) {
            NSString *idfa = [[ASIdentifierManager sharedManager].advertisingIdentifier UUIDString];
            NSLog(@"%@",idfa);
        } else {
            NSLog(@"请在设置-隐私-广告中打开广告跟踪功能");
        }
    }
}


重要：
但是此方法，在ios15中，如果在AppDelegate中的didFinishLaunchingWithOptions方法中调用，则测试无法弹出权限申请的弹框，这个可能是Ios15的bug，所以这边调用方法写在了applicationDidBecomeActive这个方法中，则可以顺利弹出权限申请弹框。在此记录下。

如果没有弹出，则延迟1秒调用。

作者：yangluDDD
链接：https://www.jianshu.com/p/fa1231b275b0
来源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
```




//////////////////////////////////////////////////////


iOS上架被拒绝的解决方案汇总
https://www.proyy.com/6996096289729413127.html

 
