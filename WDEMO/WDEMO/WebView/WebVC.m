//
//  WebVC.m
//  WDEMO
//
//  Created by rrtv on 2020/10/9.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "WebVC.h"
#import "ChatHeader.h"

@interface WebVC ()

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
    
    //页面后退
    [_webView goBack];
    //页面前进
    [_webView goForward];
    //刷新当前页面
    [_webView reload];
    
    //        NSString *path = [[NSBundle mainBundle] pathForResource:@"JStoOC.html" ofType:nil];
    //        NSString *htmlString = [[NSString alloc]initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    //       //加载本地html文件
    //        [_webView loadHTMLString:htmlString baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]]];
    //
    
    //加载
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20];
    [self.webView loadRequest:request];
    
    
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
