//
//  DevEnvironmentViewController.m
//  MoWanShang
//
//  Created by rrtv on 2022/4/15.
//

#import "DevEnvironmentViewController.h"

@interface DevEnvironmentViewController ()
@property (nonatomic, strong) UIButton *button;
@end

@implementation DevEnvironmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.hidden = NO;
    
    [self initDebugButton];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 200, 40)];
    btn.tag = 0;
    [btn setTitle:@"开发环境" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor grayColor];
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 150, 200, 40)];
    btn1.tag = 1;
    [btn1 setTitle:@"test环境" forState:UIControlStateNormal];
    btn1.backgroundColor = [UIColor grayColor];
    [btn1 addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 200, 200, 40)];
    btn2.tag = 2;
    [btn2 setTitle:@"test1环境" forState:UIControlStateNormal];
    btn2.backgroundColor = [UIColor grayColor];
    [btn2 addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(0, 250, 200, 40)];
    btn3.tag = 3;
    [btn3 setTitle:@"正式环境" forState:UIControlStateNormal];
    btn3.backgroundColor = [UIColor grayColor];
    [btn3 addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
}

- (void)clickBtn:(UIButton *)btn {
    NSString *environment = @"";
    switch (btn.tag) {
        case 0:
            environment = @"dev";
            break;
        case 1:
            environment = @"test";
            break;
        case 2:
            environment = @"test1";
            break;
        case 3:
            environment = @"produce";
            break;
        default:
            return;
            break;
    }
    
    [[NSUserDefaults standardUserDefaults] setValue:environment forKey:@"MWSAPP"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    //    TOAST(@"切换环境会退出登录，且需要重启App")
    NSLog(@"切换环境会退出登录，且需要重启App");
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


- (void)initDebugButton {
    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button.backgroundColor = [UIColor greenColor];
    [self.button setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    self.button.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    self.button.alpha = 0.65;
    self.button.frame = CGRectMake(0 , KHeight / 3 * 2, 66, 36);
    self.button.layer.cornerRadius = 18;
    self.button.layer.masksToBounds = YES;
    [self.button addTarget:self action:@selector(huanJingAction) forControlEvents:UIControlEventTouchUpInside];
    NSString *environment = [[NSUserDefaults standardUserDefaults] stringForKey:@"MWSAPP"];
    if ([environment isEqualToString:@"dev"]) {
        environment = @"开发";
    } else if ([environment isEqualToString:@"test"]) {
        environment = @"测试";
    } else if ([environment isEqualToString:@"test1"]) {
        environment = @"测试1";
    } else {
        environment = @"正式";
    }
    [self.button setTitle:environment forState:UIControlStateNormal];
    [self.view addSubview:self.button];
    //    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:
    //    self action:@selector(buttonLocationChange:)];
    //    pan.delaysTouchesBegan = YES;
    //    [self.button addGestureRecognizer:pan];
}

- (void)huanJingAction {
    
}
//----------------------------------------

- (NSString *)baseUrl {
   NSString *baseUrl;
#if DEBUG
   NSString *environment = [[NSUserDefaults standardUserDefaults] stringForKey:@"MWSAPP"];
   if ([environment isEqualToString:@"dev"]) {
       baseUrl = @"http://dev-vision.appappapp.com";
   } else if ([environment isEqualToString:@"test"]) {
       baseUrl = @"http://test-vision.appappapp.com";
   } else if ([environment isEqualToString:@"test1"]) {
       baseUrl = @"http://test1-vision.appappapp.com";
   } else {
       baseUrl = @"https://vision.appappapp.com";
   }
#else
   baseUrl = @"https://vision.appappapp.com";
#endif
   return baseUrl;
}

@end
