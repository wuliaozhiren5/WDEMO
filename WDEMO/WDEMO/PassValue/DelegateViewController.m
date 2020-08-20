//
//  DelegateViewController.m
//  WDEMO
//
//  Created by longzhu on 2019/9/5.
//  Copyright © 2019年 wwc. All rights reserved.
//

#import "DelegateViewController.h"

@interface DelegateViewController ()

@end

@implementation DelegateViewController

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
    
    //delegate
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(delegateChangevValue:)]) {
        
        NSString *str = @"delegateSuccess";
        [self.delegate delegateChangevValue:str];
        
    }
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
