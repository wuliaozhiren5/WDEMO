//
//  SharedInstanceVC.m
//  WDEMO
//
//  Created by WDEMO on 2020/12/7.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "SharedInstanceVC.h"
//单例
#import "XXClass.h"
//红点管理器
#import "CollectionRedPointManager.h"

#import <ReactiveObjC/ReactiveObjC.h>
@interface SharedInstanceVC ()

@end

@implementation SharedInstanceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //单例
    [XXClass sharedInstance];
    //红点管理器
    CollectionRedPointManager *manager = [CollectionRedPointManager sharedInstance];
    [RACObserve(manager, isShowRedPoint) subscribeNext:^(id x) {
        NSLog(@"%@",x);
        NSLog(@"success");
    }];
    manager.isShowRedPoint = YES;
    manager.isShowRedPoint = NO;
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
