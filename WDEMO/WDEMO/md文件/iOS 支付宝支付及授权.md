#iOS 支付宝支付及授权
https://blog.csdn.net/ChasingDreamsCoder/article/details/82391546

```
//这个是在ios9后的接口，如果需要适配ios9以前的系统，请找对应的api
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options
{
    if ([url.host isEqualToString:@"safepay"]) {
        
      
        //跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            DLog(@"result = %@",resultDic);
            NSInteger orderState = [resultDic[@"resultStatus"] integerValue];
            NSString *notice = nil;
            if (orderState == 9000) {
                [[NSNotificationCenter defaultCenter] postNotificationName:AppPay object:nil];
                notice = @"支付成功";
            } else {
                switch (orderState) {
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
                        break;
                }
            }
 
        }];
    }
    return YES;
}
```
 
