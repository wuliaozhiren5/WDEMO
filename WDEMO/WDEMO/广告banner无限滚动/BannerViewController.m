//
//  BannerViewController.m
//  WDEMO
//
//  Created by rrtv on 2021/1/11.
//  Copyright © 2021 wwc. All rights reserved.
//

#import "BannerViewController.h"
#import "LXHBanner.h"
#import "WTCycleRollView.h"

@interface BannerViewController ()

@end

@implementation BannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createBannerView];
    
    [self createBannerView1];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)createBannerView {
    NSArray * array = @[@"Demo", @"Demo1"];
    LXHBanner *view = [[LXHBanner alloc] initWithFrame:CGRectMake(16, 100,self.view.frame.size.width - 32, 128)
                                                 array:array];
    [self.view addSubview:view];
}

- (void)createBannerView1 {
//    NSArray * array = @[@"Demo", @"Demo1"];
//    LXHBanner *view = [[LXHBanner alloc] initWithFrame:CGRectMake(16, 100,self.view.frame.size.width - 32, 128)
//                                                 array:array];
//    [self.view addSubview:view];
    
    WTCycleRollView *view = [WTCycleRollView cycleRollViewWithFrame:CGRectMake(16, 250,self.view.frame.size.width - 32, 128)];
    NSArray *imageUrlArr = @[@"https://bkimg.cdn.bcebos.com/pic/4610b912c8fcc3ce32f324e19345d688d43f2035?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2U4MA==,g_7,xp_5,yp_5/format,f_auto",
                            @"https://bkimg.cdn.bcebos.com/pic/4610b912c8fcc3ce32f324e19345d688d43f2035?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2U4MA==,g_7,xp_5,yp_5/format,f_auto",];
    [view setImgUrls:imageUrlArr
       autoCycleRoll:YES
       clickImgBlock:^(NSInteger selectedIndex) {
         
    }];
    [self.view addSubview:view];

}
@end
