//
//  WebVC.h
//  WDEMO
//
//  Created by rrtv on 2020/10/9.
//  Copyright © 2020 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface WebVC : UIViewController

@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, copy) NSString *url;

@end

NS_ASSUME_NONNULL_END
