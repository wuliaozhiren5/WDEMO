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
#import "WCollectionViewController.h"

#import "PassValueViewController.h"
#import "FontViewControlle.h"
#import "TagListViewController.h"
#import "GaoDengViewController.h"

//语言包
#import "FGLanguageTool.h"
#import "WMacros.h"
#import "CpuMemoryUsage.h"

#import "ChatViewController.h"
//HUB
#import <MBProgressHUD/MBProgressHUD.h>
#import "YYViewController.h"

@interface ViewController ()

@property(strong,nonatomic)UIButton *goBtn;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //    iOS7之后由于navigationBar.translucent默认是YES，坐标零点默认在（0，0）点  当不透明的时候，零点坐标在（0，64）；如果你想设置成透明的，而且还要零点从（0，64）开始，那就添加：self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationController.navigationBar.translucent = NO;
    //    self.edgesForExtendedLayout = UIRectEdgeNone;
     
    UIButton *tagListBtn1 = [[UIButton alloc]initWithFrame:CGRectMake(10, 0, 100, 40)];
    //    [_goBtn setImage:[UIImage imageNamed:@"btn_upgradeaccount_close"] forState:UIControlStateNormal];
    [tagListBtn1 setTitle:@"tagListBtn1" forState:UIControlStateNormal];
    tagListBtn1.backgroundColor = [UIColor grayColor];
    [tagListBtn1 addTarget:self action:@selector(clickTagListBtn1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tagListBtn1];
    
    
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
    [tableViewBtn setTitle:@"TableView" forState:UIControlStateNormal];
    tableViewBtn.backgroundColor = [UIColor grayColor];
    [tableViewBtn addTarget:self action:@selector(clickTableViewBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tableViewBtn];
    
    UIButton *collectionViewBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 200, 100, 40)];
    //    [_goBtn setImage:[UIImage imageNamed:@"btn_upgradeaccount_close"] forState:UIControlStateNormal];
    [collectionViewBtn setTitle:@"CollectionView" forState:UIControlStateNormal];
    collectionViewBtn.backgroundColor = [UIColor grayColor];
    [collectionViewBtn addTarget:self action:@selector(clickCollectionViewBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:collectionViewBtn];
    
    
    UIButton *passValueBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 250, 100, 40)];
    //    [_goBtn setImage:[UIImage imageNamed:@"btn_upgradeaccount_close"] forState:UIControlStateNormal];
    [passValueBtn setTitle:@"PassValue" forState:UIControlStateNormal];
    passValueBtn.backgroundColor = [UIColor grayColor];
    [passValueBtn addTarget:self action:@selector(clickPassValueBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:passValueBtn];
    
    UIButton *languageBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 300, 100, 40)];
    //    [_goBtn setImage:[UIImage imageNamed:@"btn_upgradeaccount_close"] forState:UIControlStateNormal];
    [languageBtn setTitle:@"Language" forState:UIControlStateNormal];
    languageBtn.backgroundColor = [UIColor grayColor];
    [languageBtn addTarget:self action:@selector(clickLanguageBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:languageBtn];
    
    UIButton *fontBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 350, 100, 40)];
    //    [_goBtn setImage:[UIImage imageNamed:@"btn_upgradeaccount_close"] forState:UIControlStateNormal];
    [fontBtn setTitle:@"Font" forState:UIControlStateNormal];
    fontBtn.backgroundColor = [UIColor grayColor];
    [fontBtn addTarget:self action:@selector(clickFontBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fontBtn];
    
    
    UIButton *taglistBtn2 = [[UIButton alloc]initWithFrame:CGRectMake(10, 400, 100, 40)];
    //    [_goBtn setImage:[UIImage imageNamed:@"btn_upgradeaccount_close"] forState:UIControlStateNormal];
    [taglistBtn2 setTitle:@"taglistBtn2" forState:UIControlStateNormal];
    taglistBtn2.backgroundColor = [UIColor grayColor];
    [taglistBtn2 addTarget:self action:@selector(clickTaglistBtn2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:taglistBtn2];
    
    UIButton *collectionBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 450, 100, 40)];
    //    [_goBtn setImage:[UIImage imageNamed:@"btn_upgradeaccount_close"] forState:UIControlStateNormal];
    [collectionBtn setTitle:@"一对一联动" forState:UIControlStateNormal];
    collectionBtn.backgroundColor = [UIColor grayColor];
    [collectionBtn addTarget:self action:@selector(clickCollectionBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:collectionBtn];
    
    
    UIButton *crashBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 500, 100, 40)];
    //    [_goBtn setImage:[UIImage imageNamed:@"btn_upgradeaccount_close"] forState:UIControlStateNormal];
    [crashBtn setTitle:@"抓取崩溃信息" forState:UIControlStateNormal];
    crashBtn.backgroundColor = [UIColor grayColor];
    [crashBtn addTarget:self action:@selector(clickCrashBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:crashBtn];
    
    
    UIButton *chatBtn  = [[UIButton alloc]initWithFrame:CGRectMake(10, 550, 100, 40)];
    //    [_goBtn setImage:[UIImage imageNamed:@"btn_upgradeaccount_close"] forState:UIControlStateNormal];
    [chatBtn setTitle:@"chatBtn" forState:UIControlStateNormal];
    chatBtn.backgroundColor = [UIColor grayColor];
    [chatBtn addTarget:self action:@selector(clickChatBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:chatBtn];

    
    UIButton *YYBtn  = [[UIButton alloc]initWithFrame:CGRectMake(10, 600, 100, 40)];
    //    [_goBtn setImage:[UIImage imageNamed:@"btn_upgradeaccount_close"] forState:UIControlStateNormal];
    [YYBtn setTitle:@"clickYYBtn" forState:UIControlStateNormal];
    YYBtn.backgroundColor = [UIColor grayColor];
    [YYBtn addTarget:self action:@selector(clickYYBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:YYBtn];
    
    
    
    //#############################################################################################################
    
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
    
    //    //cup memory监控
    //    [self.timer fire];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)clickTagListBtn1:(UIButton *)btn {
    
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
-(void)clickCollectionViewBtn:(UIButton *)btn {
    
    WCollectionViewController *vc= [[WCollectionViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


-(void)clickPassValueBtn:(UIButton *)btn {
    
    PassValueViewController *vc= [[PassValueViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)clickLanguageBtn:(UIButton *)btn {
    
    //    [[FGLanguageTool sharedInstance] setNewLanguage:@"en"];
    //    [[FGLanguageTool sharedInstance] setNewLanguage:@"zh-Hans"];
    //    中文简体@"zh-Hans"
    //    中文繁体@"zh-Hant"
    //    英文@"en"
    
    [[FGLanguageTool sharedInstance] changeNowLanguage];
}

-(void)clickFontBtn:(UIButton *)btn {
    
    FontViewControlle *vc= [[FontViewControlle alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)clickTaglistBtn2:(UIButton *)btn {
    
    TagListViewController *vc= [[TagListViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)clickCollectionBtn:(UIButton *)btn {
    
    //    上下一对一联动的Collection
    GaoDengViewController *vc= [[GaoDengViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

-(void)clickCrashBtn:(UIButton *)btn {
    
    NSArray *arry=[NSArray arrayWithObject:@"sss"];
    NSLog(@"%@",[arry objectAtIndex:1]);
}

-(void)clickChatBtn:(UIButton *)btn {
    
    ChatViewController *vc= [[ChatViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)clickYYBtn:(UIButton *)btn { 
    YYViewController *vc= [[YYViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (NSTimer *)timer {
    if (!_timer || _timer.isValid) {
        //        WeakObject(self)
        _timer = [NSTimer timerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
            //            float cpu = [RRDebugUtilService cpu_usage];
            //            self.lbCpu.text = [NSString stringWithFormat:@"cpu使用率：%.2f%%", cpu];
            //            float mem = [RRDebugUtilService memoryUsage];
            //            self.lbMem.text = [NSString stringWithFormat:@"内存使用：%.2fM", mem];
            
            float cpu = [CpuMemoryUsage cpuUsage];
            NSString *cpuStr = [NSString stringWithFormat:@"cpu使用率：%.2f%%", cpu];
            float mem = [CpuMemoryUsage memoryUsage];
            NSString *memoryStr = [NSString stringWithFormat:@"内存使用：%.2fM", mem];
            
            NSLog(@"%@,%@", cpuStr, memoryStr);
            
        }];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
    return _timer;
}

- (void)hub{
    
    UIView *view = [UIApplication sharedApplication].delegate.window;
    //只显示文字
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = [UIColor blackColor];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = @"Some message...";
    hud.label.textColor = [UIColor whiteColor];
    [hud hideAnimated:YES afterDelay:2];
}

- (void)dealloc {
    [self.timer invalidate];
    self.timer = nil;
}
@end

