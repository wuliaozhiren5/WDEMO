//
//  PassValueViewController.m
//  WDEMO
//
//  Created by longzhu on 2019/9/5.
//  Copyright © 2019年 wwc. All rights reserved.
//

#import "PassValueViewController.h"
#import "BlockViewController.h"
#import "DelegateViewController.h"
#import "NotificationViewController.h"

@interface PassValueViewController ()<valueDelegate>
{
    
}
@end

@implementation PassValueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor grayColor];
    
    
    UIButton *delegateBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 50, 100, 40)];
    //    [_goBtn setImage:[UIImage imageNamed:@"btn_upgradeaccount_close"] forState:UIControlStateNormal];
    [delegateBtn setTitle:@"delegate" forState:UIControlStateNormal];
    delegateBtn.backgroundColor = [UIColor grayColor];
    [delegateBtn addTarget:self action:@selector(clickDelegateBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:delegateBtn];
    
    
    UIButton *blockBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 100, 100, 40)];
    //    [_goBtn setImage:[UIImage imageNamed:@"btn_upgradeaccount_close"] forState:UIControlStateNormal];
    [blockBtn setTitle:@"block" forState:UIControlStateNormal];
    blockBtn.backgroundColor = [UIColor grayColor];
    [blockBtn addTarget:self action:@selector(clickBlockBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:blockBtn];
    
    
    UIButton *notificationBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 150, 100, 40)];
    //    [_goBtn setImage:[UIImage imageNamed:@"btn_upgradeaccount_close"] forState:UIControlStateNormal];
    [notificationBtn setTitle:@"notification" forState:UIControlStateNormal];
    notificationBtn.backgroundColor = [UIColor grayColor];
    [notificationBtn addTarget:self action:@selector(clickNotificationBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:notificationBtn];
}

-(void)clickDelegateBtn:(UIButton *)btn {
    
    DelegateViewController *vc = [[DelegateViewController alloc]init];
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:YES];
 
}

-(void)clickBlockBtn:(UIButton *)btn {
    
    BlockViewController *vc = [[BlockViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    vc.buttonClickBlock = ^(NSString *str) {
       
        NSLog(@"block写法1");
        NSLog(@"%@",str);
    };
    
    vc.valueBlcok = ^{
        NSLog(@"block写法2");
        NSLog(@"block fafasfsasdfdsfadsfadsf");
    };

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - delegate
-(void)delegateChangevValue:(NSString *)value {
    
    NSLog(@"delegate写法");
    NSLog(@"%@",value);

    
}



//Notification
-(void)clickNotificationBtn:(UIButton *)btn {
    
    [self addNotification];
    
    NotificationViewController *vc = [[NotificationViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)addNotification {
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(passValue:)
                                                 name:@"PassValue"
                                               object:nil];
    
}
-(void)removeNotification {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:@"PassValue"
                                                  object:nil];
    
}
-(void)passValue:(NSNotification *)notification {
    
//    NSString  *name=[notification name];
//    NSString  *object=[notification object];
//    NSDictionary  *dict=[notification userInfo];
    
    NSString  *name=notification.name;
    NSString  *object=notification.object;
    NSDictionary  *dict=notification.userInfo;
    NSLog(@"名称:%@----对象:%@",name,object);
    NSLog(@"获取的值:%@",[dict objectForKey:@"key"]);
    
}
-(void)dealloc{
    NSLog(@"观察者销毁了");
    [self removeNotification];
}
@end
