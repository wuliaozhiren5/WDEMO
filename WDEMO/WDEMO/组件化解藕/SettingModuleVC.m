//
//  SettingModuleVC.m
//  WDEMO
//
//  Created by rrtv on 2020/12/7.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "SettingModuleVC.h"
#import "SettingModuleHandler.h"

@interface SettingModuleVC ()

@end

@implementation SettingModuleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //DEMO
    //使用
    SettingModuleHandler *handler = [[SettingModuleHandler alloc]init];
    NSString *user = [handler.setting.delegate userId];
    NSLog(@"user = %@", user);
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
