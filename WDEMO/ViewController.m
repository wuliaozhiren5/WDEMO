//
//  ViewController.m
//  WDEMO
//
//  Created by xxx on 2017/11/13.
//  Copyright © 2017年 wwc. All rights reserved.
//

#import "ViewController.h"
#import "LZTagListVC.h"
#import "ForceTouchListVC.h"
#import "AlterViewController.h"
#import "WTableViewController.h"
#import "PassValueViewController.h"
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
    
    _goBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 0, 100, 40)];
//    [_goBtn setImage:[UIImage imageNamed:@"btn_upgradeaccount_close"] forState:UIControlStateNormal];
    [_goBtn setTitle:@"Taglist" forState:UIControlStateNormal];
    _goBtn.backgroundColor = [UIColor grayColor];
    [_goBtn addTarget:self action:@selector(clickGoBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_goBtn];
    
    UIButton *touchBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 50, 100, 40)];
    //    [_goBtn setImage:[UIImage imageNamed:@"btn_upgradeaccount_close"] forState:UIControlStateNormal];
    [touchBtn setTitle:@"3D Touch" forState:UIControlStateNormal];
    touchBtn.backgroundColor = [UIColor grayColor];
    [touchBtn addTarget:self action:@selector(clickTouchBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:touchBtn];
    
    
    UIButton *alterBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 100, 100, 40)];
    //    [_goBtn setImage:[UIImage imageNamed:@"btn_upgradeaccount_close"] forState:UIControlStateNormal];
    [alterBtn setTitle:@"SystemAlter" forState:UIControlStateNormal];
    alterBtn.backgroundColor = [UIColor grayColor];
    [alterBtn addTarget:self action:@selector(clickAlterBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:alterBtn];
    
    
    UIButton *tableViewBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 150, 100, 40)];
    //    [_goBtn setImage:[UIImage imageNamed:@"btn_upgradeaccount_close"] forState:UIControlStateNormal];
    [tableViewBtn setTitle:@"Tableview" forState:UIControlStateNormal];
    tableViewBtn.backgroundColor = [UIColor grayColor];
    [tableViewBtn addTarget:self action:@selector(clickTableViewBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tableViewBtn];
    
    UIButton *passValueBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 200, 100, 40)];
    //    [_goBtn setImage:[UIImage imageNamed:@"btn_upgradeaccount_close"] forState:UIControlStateNormal];
    [passValueBtn setTitle:@"PassValue" forState:UIControlStateNormal];
    passValueBtn.backgroundColor = [UIColor grayColor];
    [passValueBtn addTarget:self action:@selector(clickPassValueBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:passValueBtn];
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

-(void)clickAlterBtn:(UIButton *)btn {
    
    AlterViewController *vc= [[AlterViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)clickTableViewBtn:(UIButton *)btn {
    
    WTableViewController *vc= [[WTableViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)clickPassValueBtn:(UIButton *)btn {
    
    PassValueViewController *vc= [[PassValueViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
