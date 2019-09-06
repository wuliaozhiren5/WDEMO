//
//  NotificationViewController.m
//  WDEMO
//
//  Created by longzhu on 2019/9/5.
//  Copyright © 2019年 wwc. All rights reserved.
//

#import "NotificationViewController.h"

@interface NotificationViewController ()

@end

@implementation NotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 50, 100, 40)];
    //    [backBtn setImage:[UIImage imageNamed:@"btn_upgradeaccount_close"] forState:UIControlStateNormal];
    [backBtn setTitle:@"back" forState:UIControlStateNormal];
    backBtn.backgroundColor = [UIColor grayColor];
    [backBtn addTarget:self action:@selector(clickBackBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
}

-(void)clickBackBtn:(UIButton *)btn {
    
    //Notification
 
    NSDictionary  *dict=[[NSDictionary alloc]initWithObjects:@[@"keso"] forKeys:@[@"key"]];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"PassValue" object:@"http://www.cnblogs.com/xiaofeixiang" userInfo:dict];

    
    [self.navigationController popViewControllerAnimated:YES];
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
