//
//  TodayViewController.m
//  Widget
//
//  Created by longzhu on 2017/11/24.
//  Copyright © 2017年 wwc. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
 
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
    self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeExpanded;
#endif
    
    
    
    //  添加一个button,点击button后改变背景的颜色
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"点击一下" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor whiteColor];
    [button addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(50, 10, 100, 30);
    [self.view addSubview:button];
}

#ifdef NSFoundationVersionNumber_iOS_9_x_Max
-(void)widgetActiveDisplayModeDidChange:(NCWidgetDisplayMode)activeDisplayMode withMaximumSize:(CGSize)maxSize{
    switch (activeDisplayMode) {
        case NCWidgetDisplayModeCompact:
            self.preferredContentSize = CGSizeMake(maxSize.width,300);
            //ios10以后，widget的关闭时高度为固定值，设置没效果。
            break;
        case NCWidgetDisplayModeExpanded:
            self.preferredContentSize = CGSizeMake(maxSize.width,400);
            break;
        default:
            break;
    }
    
}
#endif


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}


- (void)clickAction{
    self.view.backgroundColor = [UIColor redColor];
}
@end
