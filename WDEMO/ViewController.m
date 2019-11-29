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
#import "FontViewControlle.h"

//语言包
#import "FGLanguageTool.h"

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
    
    UIButton *languageBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 250, 100, 40)];
    //    [_goBtn setImage:[UIImage imageNamed:@"btn_upgradeaccount_close"] forState:UIControlStateNormal];
    [languageBtn setTitle:@"Language" forState:UIControlStateNormal];
    languageBtn.backgroundColor = [UIColor grayColor];
    [languageBtn addTarget:self action:@selector(clickLanguageBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:languageBtn];
    
    UIButton *fontBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 300, 100, 40)];
    //    [_goBtn setImage:[UIImage imageNamed:@"btn_upgradeaccount_close"] forState:UIControlStateNormal];
    [fontBtn setTitle:@"Font" forState:UIControlStateNormal];
    fontBtn.backgroundColor = [UIColor grayColor];
    [fontBtn addTarget:self action:@selector(clickFontBtnBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fontBtn];
 
//    //字体
//    for (NSString *fontfamilyname in [UIFont familyNames])
//    {
//        NSLog(@"family:'%@'",fontfamilyname);
//        for(NSString *fontName in [UIFont fontNamesForFamilyName:fontfamilyname])
//        {
//            NSLog(@"\tfont:'%@'",fontName);
//        }
//        NSLog(@"-------------");
//    }
//
//    //微软雅黑字体包太大所以删除
//    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 20)];
//    titleLabel.textAlignment = NSTextAlignmentCenter;
//    titleLabel.text = @"字体";
//    titleLabel.font = [UIFont systemFontOfSize:16];
//    titleLabel.font = [UIFont fontWithName:@"MicrosoftYaHei" size:16];
//    titleLabel.textColor = [UIColor grayColor];
//    [self.view addSubview:titleLabel];
//
//    //方正粗谭黑简体
//    UILabel *titleLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, 320, 20)];
//    titleLabel1.textAlignment = NSTextAlignmentCenter;
//    titleLabel1.text = @"字体";
//    titleLabel1.font = [UIFont fontWithName:@"FZCTHJW--GB1-0" size:16];
//    titleLabel1.textColor = [UIColor grayColor];
//    [self.view addSubview:titleLabel1];
//
//    UILabel *titleLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(0, 40, 320, 20)];
//    titleLabel2.textAlignment = NSTextAlignmentCenter;
//    titleLabel2.text = @"字体";
//    titleLabel2.font = [UIFont systemFontOfSize:16];
//    titleLabel2.textColor = [UIColor grayColor];
//    [self.view addSubview:titleLabel2];

    UILabel *titleLabel3 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20)];
    titleLabel3.textAlignment = NSTextAlignmentRight;
    titleLabel3.text = @"字体";
    titleLabel3.font = [UIFont systemFontOfSize:16];
    titleLabel3.textColor = [UIColor grayColor];
    [self.view addSubview:titleLabel3];
    //字体包
    NSString *string = FGGetStringWithKeyFromTable(@"Language", @"InfoPlist"); 
    NSLog(@"string:%@",string); 
    titleLabel3.text = string;

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

-(void)clickLanguageBtn:(UIButton *)btn {

    //    [[FGLanguageTool sharedInstance] setNewLanguage:@"en"];
    //    [[FGLanguageTool sharedInstance] setNewLanguage:@"zh-Hans"];
    [[FGLanguageTool sharedInstance] changeNowLanguage];
}

-(void)clickFontBtnBtn:(UIButton *)btn {
    
    FontViewControlle *vc= [[FontViewControlle alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end

