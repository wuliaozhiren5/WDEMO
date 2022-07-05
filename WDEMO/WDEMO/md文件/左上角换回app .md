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


支付的时候
``` 
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appPayResult:) name:@"AppPay" object:nil];
    [self setupViews];
}

- (void)doAPPayWithTradePayModel:(MWSPayModel *)model {
    
    NSString *orderString = model.body;
    // NOTE: 如果加签成功，则继续执行支付
    if (orderString != nil) {
        //应用注册scheme,在AliSDKDemo-Info.plist定义URL types
        //        NSString *appScheme = @"alisdkdemo";
        NSString *appScheme = @"com.MoWanShang.www";
        // NOTE: 调用支付结果开始支付
        
        NSURL *url = [NSURL URLWithString:@"alipay://"];//注意设置白名单
        if (![[UIApplication sharedApplication] canOpenURL:url]) {//未安装
            //自己的代码逻辑处理
            [MWSPayTypeManager sharedInstance].payType = Pay_Type_none;
        } else {
            [MWSPayTypeManager sharedInstance].payType = Pay_Type_alipay;
        }
        
//        [IanAlert showloadingAllowUserInteraction:NO];
        @weakify(self);
        [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
            @strongify(self);
//            [IanAlert hideLoading];
            NSLog(@"reslut = %@",resultDic);
            [self handleAppPayWithResultDic:resultDic];
        }];
    } else {
        TOAST(@"支付参数错误，支付宝sdk调用失败")
        
    }
}



- (void)handleAppPayWithResultDic:(NSDictionary *)resultDic {
    
    if (!resultDic) {
        //点击左上角回来的
        //查询订单
        [self paySuccess];
        return;
    }
    //    返回码 含义
    //    9000 订单支付成功。
    //    8000 正在处理中，支付结果未知（有可能已经支付成功），请查询商户订单列表中订单的支付状态。
    //    4000 订单支付失败。
    //    5000 重复请求。
    //    6001 用户中途取消。
    //    6002 网络连接出错。
    //    6004 支付结果未知（有可能已经支付成功），请查询商户订单列表中订单的支付状态。
    //    其他 其他支付错误。
    NSInteger orderState = [resultDic[@"resultStatus"] integerValue];
    NSString *notice = nil;
    switch (orderState) {
        case 9000:
            NSLog(@"order_id = %@",self.order_id);
            notice = @"支付成功";
            //查询订单
            [self paySuccess];
            break;
        case 8000:
            notice = @"支付正在处理中";
            break;
        case 4000:
            notice = @"支付失败";
            break;
        case 6001:
            notice = @"支付取消";
            break;
        case 6002:
            notice = @"网络连接出错";
            break;
            
        default:
            notice = @"支付出错";
            break;
    }
    TOAST(notice);
}

```
