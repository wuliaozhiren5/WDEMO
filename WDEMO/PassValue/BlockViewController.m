//
//  BlockViewController.m
//  WDEMO
//
//  Created by longzhu on 2019/9/5.
//  Copyright © 2019年 wwc. All rights reserved.
//

#import "BlockViewController.h"

@interface BlockViewController ()

@end

@implementation BlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     
    UIButton *backBtn1 = [[UIButton alloc]initWithFrame:CGRectMake(10, 50, 100, 40)];
    //    [backBtn setImage:[UIImage imageNamed:@"btn_upgradeaccount_close"] forState:UIControlStateNormal];
    [backBtn1 setTitle:@"back1" forState:UIControlStateNormal];
    backBtn1.backgroundColor = [UIColor grayColor];
    [backBtn1 addTarget:self action:@selector(clickBackBtn1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn1];
    
    
    UIButton *backBtn2 = [[UIButton alloc]initWithFrame:CGRectMake(10, 150, 100, 40)];
    //    [backBtn setImage:[UIImage imageNamed:@"btn_upgradeaccount_close"] forState:UIControlStateNormal];
    [backBtn2 setTitle:@"back2" forState:UIControlStateNormal];
    backBtn2.backgroundColor = [UIColor grayColor];
    [backBtn2 addTarget:self action:@selector(clickBackBtn2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn2];
}

-(void)clickBackBtn1:(UIButton *)btn {
    
    //block
    if (self.buttonClickBlock) {
        NSString *str = @"blockSuccess";
        self.buttonClickBlock(str);
        
    }
 
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)clickBackBtn2:(UIButton *)btn {
    
    
    if (self.valueBlcok) {
        self.valueBlcok();
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

- (void)startWithCompletionBlock:(void (^)(id result, NSError *error))block {
    
}
@end
