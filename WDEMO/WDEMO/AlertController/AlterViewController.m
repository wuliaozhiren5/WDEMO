//
//  AlterViewController.m
//  WDEMO
//
//  Created by longzhu on 2019/9/3.
//  Copyright © 2019年 wwc. All rights reserved.
//

#import "AlterViewController.h"

@interface AlterViewController ()

@end

@implementation AlterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    
    
    UIButton *alterBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 0, 100, 40)];
    //    [_goBtn setImage:[UIImage imageNamed:@"btn_upgradeaccount_close"] forState:UIControlStateNormal];
    [alterBtn setTitle:@"alter" forState:UIControlStateNormal];
    alterBtn.backgroundColor = [UIColor grayColor];
    [alterBtn addTarget:self action:@selector(showAlert:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:alterBtn];
    
    
    UIButton *textListBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 50, 100, 40)];
    //    [_goBtn setImage:[UIImage imageNamed:@"btn_upgradeaccount_close"] forState:UIControlStateNormal];
    [textListBtn setTitle:@"textList" forState:UIControlStateNormal];
    textListBtn.backgroundColor = [UIColor grayColor];
    [textListBtn addTarget:self action:@selector(showList:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:textListBtn];
    
    
    UIButton *sheetBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 100, 100, 40)];
    //    [_goBtn setImage:[UIImage imageNamed:@"btn_upgradeaccount_close"] forState:UIControlStateNormal];
    [sheetBtn setTitle:@"Sheet" forState:UIControlStateNormal];
    sheetBtn.backgroundColor = [UIColor grayColor];
    [sheetBtn addTarget:self action:@selector(showSheet:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sheetBtn];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



//iOS - UIAlertController三种显示提示框代码
//https://www.cnblogs.com/junhuawang/p/9013341.html
//- (IBAction)showAlert:(UIButton *)sender {
- (void)showAlert:(UIButton *)sender {
    //显示提示框
    //过时
    //    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Title" message:@"message" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
    //    [alert show];
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Title"
                                                                   message:@"This is an alert."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              //响应事件
                                                              NSLog(@"action = %@", action);
                                                          }];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action) {
                                                             //响应事件
                                                             NSLog(@"action = %@", action);
                                                         }];
    
    [alert addAction:defaultAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}

//- (IBAction)showList:(UIButton *)sender {
- (void)showList:(UIButton *)sender {
    //提示框添加文本输入框
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Title"
                                                                   message:@"This is an alert."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * action) {
                                                         //响应事件
                                                         //得到文本信息
                                                         for(UITextField *text in alert.textFields){
                                                             NSLog(@"text = %@", text.text);
                                                         }
                                                     }];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * action) {
                                                             //响应事件
                                                             NSLog(@"action = %@", alert.textFields);
                                                         }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"登录";
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"密码";
        textField.secureTextEntry = YES;
    }];
    
    [alert addAction:okAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
    
}

//- (IBAction)showSheet:(UIButton *)sender {
- (void)showSheet:(UIButton *)sender {
    //显示弹出框列表选择
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Title"
                                                                   message:@"This is an Sheet."
                                                            preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * action) {
                                                             //响应事件
                                                             NSLog(@"action = %@", action);
                                                         }];
    UIAlertAction* deleteAction = [UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDestructive
                                                         handler:^(UIAlertAction * action) {
                                                             //响应事件
                                                             NSLog(@"action = %@", action);
                                                         }];
    UIAlertAction* saveAction = [UIAlertAction actionWithTitle:@"保存" style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * action) {
                                                           //响应事件
                                                           NSLog(@"action = %@", action);
                                                       }];
    [alert addAction:saveAction];
    [alert addAction:cancelAction];
    [alert addAction:deleteAction];
    [self presentViewController:alert animated:YES completion:nil];
}
@end
