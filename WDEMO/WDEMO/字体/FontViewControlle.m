//
//  FontVC.m
//  WDEMO
//
//  Created by longzhu on 2019/11/29.
//  Copyright © 2019年 wwc. All rights reserved.
//

#import "FontViewControlle.h"
//语言包
#import "FGLanguageTool.h"
@interface FontViewControlle ()

@end

@implementation FontViewControlle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //字体
    for (NSString *fontfamilyname in [UIFont familyNames])
    {
        NSLog(@"family:'%@'",fontfamilyname);
        for(NSString *fontName in [UIFont fontNamesForFamilyName:fontfamilyname])
        {
            NSLog(@"\tfont:'%@'",fontName);
        }
        NSLog(@"-------------");
    }
    
    //微软雅黑字体包太大所以删除
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 20)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"字体";
    titleLabel.font = [UIFont systemFontOfSize:16];
    titleLabel.font = [UIFont fontWithName:@"MicrosoftYaHei" size:16];
    titleLabel.textColor = [UIColor grayColor];
    [self.view addSubview:titleLabel];
    
    //方正粗谭黑简体
    UILabel *titleLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, 320, 20)];
    titleLabel1.textAlignment = NSTextAlignmentCenter;
    titleLabel1.text = @"字体";
    titleLabel1.font = [UIFont fontWithName:@"FZCTHJW--GB1-0" size:16];
    titleLabel1.textColor = [UIColor grayColor];
    [self.view addSubview:titleLabel1];
    
    UILabel *titleLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(0, 40, 320, 20)];
    titleLabel2.textAlignment = NSTextAlignmentCenter;
    titleLabel2.text = @"字体";
    titleLabel2.font = [UIFont systemFontOfSize:16];
    titleLabel2.textColor = [UIColor grayColor];
    [self.view addSubview:titleLabel2];
    
    UILabel *titleLabel3 = [[UILabel alloc]initWithFrame:CGRectMake(0, 60, 320, 20)];
    titleLabel3.textAlignment = NSTextAlignmentCenter;
    titleLabel3.text = @"字体";
    titleLabel3.font = [UIFont systemFontOfSize:16];
    titleLabel3.textColor = [UIColor grayColor];
    [self.view addSubview:titleLabel3];
    
    NSString *string = FGGetStringWithKeyFromTable(@"NowLanguage", @"InfoPlist");
    NSLog(@"string:%@",string);
    titleLabel3.text = string;
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
