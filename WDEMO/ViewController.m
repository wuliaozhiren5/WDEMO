//
//  ViewController.m
//  WDEMO
//
//  Created by longzhu on 2017/11/13.
//  Copyright © 2017年 wwc. All rights reserved.
//

#import "ViewController.h"
#import "LZTagListVC.h"
#import "ForceTouchListVC.h"

@interface ViewController ()
@property(strong,nonatomic)UIButton *goBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

//    iOS7之后由于navigationBar.translucent默认是YES，坐标零点默认在（0，0）点  当不透明的时候，零点坐标在（0，64）；如果你想设置成透明的，而且还要零点从（0，64）开始，那就添加：self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationController.navigationBar.translucent = NO;
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    _goBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 100, 100, 42)];
//    [_goBtn setImage:[UIImage imageNamed:@"btn_upgradeaccount_close"] forState:UIControlStateNormal];
    [_goBtn setTitle:@"xxx" forState:UIControlStateNormal];
    _goBtn.backgroundColor = [UIColor grayColor];
    [_goBtn addTarget:self action:@selector(clickGoBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_goBtn];
    
     UIButton *touchBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 150, 100, 42)];
    //    [_goBtn setImage:[UIImage imageNamed:@"btn_upgradeaccount_close"] forState:UIControlStateNormal];
    [touchBtn setTitle:@"3D Touch" forState:UIControlStateNormal];
    touchBtn.backgroundColor = [UIColor grayColor];
    [touchBtn addTarget:self action:@selector(clickTouchBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:touchBtn];
} 

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)clickGoBtn:(UIButton *)btn {
    
    LZTagListVC *vc= [[LZTagListVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)clickTouchBtn:(UIButton *)btn {
    
    ForceTouchListVC *vc= [[ForceTouchListVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
