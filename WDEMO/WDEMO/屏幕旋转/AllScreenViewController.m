//
//  AllScreenViewController.m
//  WDEMO
//
//  Created by WDEMO on 2020/9/4.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "AllScreenViewController.h"

@interface AllScreenViewController ()

@end

@implementation AllScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *goBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 0, 100, 40)];
    //    [goBtn setImage:[UIImage imageNamed:@"btn_upgradeaccount_close"] forState:UIControlStateNormal];
    [goBtn setTitle:@"tagListBtn" forState:UIControlStateNormal];
    goBtn.backgroundColor = [UIColor grayColor];
    [goBtn addTarget:self action:@selector(clickgoBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goBtn];
}

-(void)clickgoBtn:(UIButton *)btn {
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(BOOL)shouldAutorotate{
    return YES;
}
@end
