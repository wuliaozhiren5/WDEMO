//
//  WebVC.m
//  WDEMO
//
//  Created by rrtv on 2020/10/9.
//  Copyright © 2020 wwc. All rights reserved.
//
//https://www.cnblogs.com/oc-bowen/p/5946383.html
//https://cloud.tencent.com/developer/article/1445877
#import "WebVC.h"
#import "ChatHeader.h"
#import "WMacros.h"
#import <YYKit/YYKit.h>

@interface WebVC () <WKUIDelegate, WKNavigationDelegate, SKStoreProductViewControllerDelegate>

@end

@implementation WebVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc]init];
    configuration.preferences.minimumFontSize = 10;//设置最小字体
    configuration.preferences.javaScriptEnabled = YES;//是否可以使用JavaScript
    configuration.preferences.javaScriptCanOpenWindowsAutomatically = NO;//JS是否可以自动打开页面
    
    _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) configuration:configuration];
    _webView.scrollView.bounces = NO;
    // UI代理
    _webView.UIDelegate = self;
    // 导航代理
    _webView.navigationDelegate = self;
    // 是否允许手势左滑返回上一级, 类似导航控制的左滑返回
    _webView.allowsBackForwardNavigationGestures = YES;
    
    
    //        NSString *path = [[NSBundle mainBundle] pathForResource:@"JStoOC.html" ofType:nil];
    //        NSString *htmlString = [[NSString alloc]initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    //       //加载本地html文件
    //        [_webView loadHTMLString:htmlString baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]]];
    //
    
    //    //加载
    //    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20];
    //    [self.webView loadRequest:request];
    
    

//    //加载
//    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com/"]]];
//    [self.view addSubview:self.webView];
    
    NSString *url = @"https://tieba.baidu.com/p/6923827559?share=9105&fr=share&see_lz=0&sfc=copy&client_type=2&client_version=11.8.8.0&st=1599213271&unique=7CDCCDB1578C4B084BF25717FFE4C5ED&pn=0";
    //加载
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
    [self.view addSubview:self.webView];
    
//        [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.edges.equalTo(self.view);
//        }];
    
    
//    //提示框
//    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"可能离开人人视频，打开第三方应用" message:@"" preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//
//    }];
//    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"继续" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//
////        [self jumpApp];
//    }];
//    [alertController addAction:cancelAction];
//    [alertController addAction:confirmAction];
//    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - WKNavigationDelegate
// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    NSLog(@"页面开始加载时调用");
}
// 页面加载完成之后调用
-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    self.title = webView.title;
    NSLog(@"页面加载完成之后调用");
}
//页面跳转失败
- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    
}
//加载报错,通常来说如果页面出现不存在等问题，会走这里，如果需要对空白页面进行处理，在这里处理
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    
}
//请求之前，决定是否要跳转:用户点击网页上的链接，需要打开新页面时，将先调用这个方法。
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
//    跳转逻辑
//    1.是否已安装app，否直接跳转AppStore，是弹出提示框
//    2.弹出提示框后，点击否关闭，点击是跳转App

    NSString *urlString = [navigationAction.request.URL absoluteString];
    if ([navigationAction.request.URL.scheme caseInsensitiveCompare:@"rrmj"] == NSOrderedSame) {
        [self jumpWithUrl:urlString];
        decisionHandler(WKNavigationActionPolicyAllow);
    }
    /* 简单判断host，真实App代码中，需要更精确判断itunes链接 */
    else if ([navigationAction.request.URL.host isEqualToString:@"itunes.apple.com"]) {
        //跳AppStore
        [self jumpAppWithUrl:urlString];
        decisionHandler(WKNavigationActionPolicyCancel);
    } else {
        decisionHandler(WKNavigationActionPolicyAllow);
    }
}

//接收到相应数据后，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
    
    if (((NSHTTPURLResponse *)navigationResponse.response).statusCode == 200) {
        decisionHandler (WKNavigationResponsePolicyAllow);
    }else {
        decisionHandler(WKNavigationResponsePolicyCancel);
    }
}

- (void)jumpAlertWithUrl:(NSString *)urlString {
    //提示框
//    @weakify(self);
//    @strongify(self);

    WS(weakSelf)
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"可能离开人人视频，打开第三方应用" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"继续" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [weakSelf jumpAppWithUrl:urlString];
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:confirmAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)jumpWithUrl:(NSString *)urlString {
    //rrmj://tieba/open?
//    NSString *urlString = @"DemoBScheme://";//没有参数
    urlString = @"DemoBScheme://";//没有参数
    NSURL *url = [NSURL URLWithString:urlString];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        //安装了该应用
        [self jumpAlertWithUrl:urlString];
    } else {
        //没有安装该应用
    }
}

- (void)jumpAppWithUrl:(NSString *)urlString {
    NSURL *url = [NSURL URLWithString:urlString];
    if (@available(iOS 10.0, *)){
        [[UIApplication sharedApplication] openURL:url options:@{UIApplicationOpenURLOptionsSourceApplicationKey:@YES} completionHandler:^(BOOL success) {
            if (success) {
                NSLog(@"10以后可以跳转url");
            }else{
                NSLog(@"10以后不可以跳转url");
            }
        }];
    }else{
        BOOL success = [[UIApplication sharedApplication] openURL:url];
        if (success) {
            NSLog(@"10以前可以跳转url");
        }else{
            NSLog(@"10以前不可以跳转url");
        }
    }
}

//暂时不用
- (void)jumpAppStoreWithUrl:(NSString *)urlString {
    NSURL *url = [NSURL URLWithString:@"itms-apps://itunes.apple.com/app/id1142110895"];
    if (@available(iOS 10.0, *)){
        [[UIApplication sharedApplication] openURL:url options:@{UIApplicationOpenURLOptionsSourceApplicationKey:@YES} completionHandler:^(BOOL success) {
            if (success) {
                NSLog(@"10以后可以跳转url");
            }else{
                NSLog(@"10以后不可以跳转url");
            }
        }];
    }else{
        BOOL success = [[UIApplication sharedApplication] openURL:url];
        if (success) {
            NSLog(@"10以前可以跳转url");
        }else{
            NSLog(@"10以前不可以跳转url");
        }
    }
}

//暂时不用
- (void)jumpAppStoreInApp {
    //2:实现代理SKStoreProductViewControllerDelegate
    SKStoreProductViewController *storeProductViewContorller = [[SKStoreProductViewController alloc] init];
    storeProductViewContorller.delegate = self;
    //加载一个新的视图展示
    [storeProductViewContorller loadProductWithParameters: @{SKStoreProductParameterITunesItemIdentifier : @"1142110895"} completionBlock:^(BOOL result, NSError *error) {
        //回调
        if(error){
            NSLog(@"错误%@",error);
        }else{
            //应用界面
            [self presentViewController:storeProductViewContorller animated:YES completion:nil];
        }
    }];
}

#pragma mark - SKStoreProductViewControllerDelegate
- (void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
