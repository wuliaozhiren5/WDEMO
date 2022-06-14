#左上角换回app

iOS支付宝 左上角换回app

XZ_iOS之iOS9.0后跳支付点击左上角返回app
https://blog.csdn.net/understand_XZ/article/details/76906664

 
iOS 微信支付点击左上角返回解决方案
https://www.csdn.net/tags/OtDaEg2sMzY1OC1ibG9n.html
参考文章：

（1）iOS 微信支付点击左上角返回解决方案

（2）https://www.cnblogs.com/yang-shuai/p/7457639.html

（3）https://www.javazxz.com/thread-5879-1-1.html
 



iOS之iOS9.0后跳支付点击左上角返回APP,兼听不到支付状态

https://www.jianshu.com/p/5b16c255868b



iOS 微信支付点击左上角返回解决方案
https://www.cnblogs.com/yang-shuai/p/7457639.html


---------------------------------------------


```
//
//  MWSPayTypeManager.h
//  MoWanShang
//
//  Created by rrtv on 2022/6/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, MWSPayType) {
    Pay_Type_none = 0,
    Pay_Type_wxpay = 1,
    Pay_Type_alipay = 2
};

@interface MWSPayTypeManager : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic, assign) MWSPayType payType;

- (void)reset;
@end

NS_ASSUME_NONNULL_END
```

```
//
//  MWSPayTypeManager.m
//  MoWanShang
//
//  Created by rrtv on 2022/6/7.
//

#import "MWSPayTypeManager.h"

@implementation MWSPayTypeManager

+ (instancetype)sharedInstance {
    static MWSPayTypeManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _payType = Pay_Type_none;
    }
    return self;
}

- (void)reset {
    _payType = Pay_Type_none;
}
@end
```


AppDelegate
```
//将进入前台
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    self.truefalseBack = NO;
    @weakify(self);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        @strongify(self);
        if (!self.truefalseBack && [MWSPayTypeManager sharedInstance].payType != Pay_Type_none) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"AppPay" object:nil userInfo:nil];
        }
        //清空状况
        [MWSPayTypeManager sharedInstance].payType = Pay_Type_none;
    });
} 

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    self.truefalseBack = YES;
    
    if ([url.host isEqualToString:@"safepay"]) {
        [IanAlert showloadingAllowUserInteraction:NO];
        // 支付跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            [IanAlert hideLoading];
            NSLog(@"result = %@",resultDic);
            [[NSNotificationCenter defaultCenter] postNotificationName:@"AppPay" object:nil userInfo:resultDic];
        }];
        //清空状况
        [MWSPayTypeManager sharedInstance].payType = Pay_Type_none;
    }
    return YES;
}

// NOTE: 9.0以后使用新API接口
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options
{
    self.truefalseBack = YES;

    if ([url.host isEqualToString:@"safepay"]) {
        [IanAlert showloadingAllowUserInteraction:NO];
        // 支付跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            [IanAlert hideLoading];
            NSLog(@"result = %@",resultDic);
            [[NSNotificationCenter defaultCenter] postNotificationName:@"AppPay" object:nil userInfo:resultDic];
        }];
        //清空状况
        [MWSPayTypeManager sharedInstance].payType = Pay_Type_none;

    }
    return YES;
}
```
