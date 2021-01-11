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
#import "HorizontalCollectionViewController.h"
#import "VerticalCollectionViewController.h"

#import "PassValueViewController.h"
#import "FontViewControlle.h"
#import "TagListViewController.h"
#import "GaoDengViewController.h"

//语言包
#import "FGLanguageTool.h"
#import "WMacros.h"
#import "CpuMemoryUsage.h"

//chat
#import "ChatViewController.h"
#import "FullScreenChatController.h"

//HUB
#import <MBProgressHUD/MBProgressHUD.h>
#import <SDWebImage/SDAnimatedImageView.h>
#import <SDWebImage/UIImage+GIF.h>
#import <SDWebImage/UIImageView+WebCache.h>

#import "YYViewController.h"
#import "MaskViewController.h"

//model
#import "ListModel.h"
#import "ListModelCell.h"
//系统的富文本
#import "AttributedTextViewController.h"
#import "IsEqualViewController.h"
//暗黑
#import "UIColor+TUIDarkMode.h"
#import "UIImage+TUIDarkMode.h"

#import "TestViewController.h"
#import "RRDestroyAccountAgreenmentViewController.h"

//RAC
#import "OrderViewController.h"
#import "RACLoginViewController.h"
#import "RACViewController.h"

//滚动视图
#import "WScrollViewController.h"
//修改密码
#import "ChangePasswordVC.h"
//设置密码 没有密码
#import "SetPasswordVC.h"
//设置密码 注册时候（可跳过）
#import "RegisterSetPasswordVC.h"
//重置密码 忘记密码 需要：手机号phone，验证码code
#import "ForgetPasswordResetPasswordVC.h"
//重置密码 存量用户
#import "NeedResetPasswordVC.h"
//全屏
#import "AllScreenViewController.h"
//webview
#import "WebVC.h"
//提示条
#import "FollowTips.h"

#import <Lottie/Lottie.h>
 
#import <ReactiveObjC/ReactiveObjC.h>
//评分
#import "ScoreView.h"
#import "ScoreViewController.h"
//编辑页面
#import "ListEditViewController.h"
//搜索
#import "SearchViewController.h"
//PageVC
#import "HomePageViewController.h"
#import "WMCustomizedPageController.h"


#define angle2Rad(angle) ((angle) / 180.0 *M_PI)

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, CAAnimationDelegate>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, copy) NSArray *data;
@property (nonatomic, strong) NSTimer *timer;
//追剧提示定时器
@property (nonatomic, strong) NSTimer *followTipsTimer;


@property (nonatomic, strong) UIImageView *removeImageView;

@end

@implementation ViewController
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"首页";
    //    [self clickChat];
    //    [self clickWebView];
    
    //    iOS7之后由于navigationBar.translucent默认是YES，坐标零点默认在（0，0）点  当不透明的时候，零点坐标在（0，64）；如果你想设置成透明的，而且还要零点从（0，64）开始，那就添加：self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationController.navigationBar.translucent = NO;
    //    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    //深色模式 切换时会自动变化
    self.view.backgroundColor = [UIColor d_colorWithColorLight:[UIColor whiteColor] dark:[UIColor grayColor]];
    
    UIButton *tagListBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 0, 100, 40)];
    //    [tagListBtn setImage:[UIImage imageNamed:@"btn_upgradeaccount_close"] forState:UIControlStateNormal];
    [tagListBtn setTitle:@"tagListBtn" forState:UIControlStateNormal];
    tagListBtn.backgroundColor = [UIColor grayColor];
    [tagListBtn addTarget:self action:@selector(clickTagListBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tagListBtn];
    
    //#############################################################################################################
    //字典
    //    对setObject:forKey:与setObject:forKeyedSubscript:的理解
    //    http://www.cocoachina.com/articles/28519
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    dict[@"name"] = @"jack"; //@{@"name":@"jack"}   //等效于[mutableDictionary setObject:value forKeyedSubscript:@"someKey"];
    dict[@"name"] = nil;     //@{}
    
    
    NSArray * array = @[
        
        [ListModel initWithTitle:@"ScoreView" detail:@"评分只是展示ScoreView" type:ListModelTypeScore],
        [ListModel initWithTitle:@"TagList1" detail:@"瀑布流" type:ListModelTypeTagList1],
        [ListModel initWithTitle:@"TagList2" detail:@"瀑布流优化" type:ListModelTypeTagList2],
        [ListModel initWithTitle:@"3DTouch" detail:@"3DTouch" type:ListModelType3DTouch],
        [ListModel initWithTitle:@"SystemAlter" detail:@"系统提示框" type:ListModelTypeSystemAlter],
        [ListModel initWithTitle:@"TableView" detail:@"简单的列表" type:ListModelTypeTableView],
        [ListModel initWithTitle:@"VerticalCollectionView" detail:@"简单的垂直网格" type:ListModelTypeVerticalCollectionView],
        [ListModel initWithTitle:@"HorizontalCollectionVie" detail:@"简单的水平网格" type:ListModelTypeHorizontalCollectionView],
        [ListModel initWithTitle:@"PassValue" detail:@"传值" type:ListModelTypePassValue],
        [ListModel initWithTitle:@"Language" detail:@"语言切换" type:ListModelTypeLanguage],
        [ListModel initWithTitle:@"Font" detail:@"字体" type:ListModelTypeFont],
        [ListModel initWithTitle:@"TwoList" detail:@"上下一对一联动的Collection" type:ListModelTypeTwoCollectionList],
        [ListModel initWithTitle:@"Crash" detail:@"抓取崩溃信息" type:ListModelTypeCrash],
        [ListModel initWithTitle:@"Chat" detail:@"聊天UI" type:ListModelTypeChat],
        [ListModel initWithTitle:@"YYText" detail:@"YYText富文本YY富文本" type:ListModelTypeYYText],
        [ListModel initWithTitle:@"Mask" detail:@"遮罩" type:ListModelTypeMask],
        [ListModel initWithTitle:@"AttributedText" detail:@"系统富文本" type:ListModelTypeAttributedText],
        [ListModel initWithTitle:@"IsEqua" detail:@"判断对象是否相等" type:ListModelTypeIsEqual],
        [ListModel initWithTitle:@"DestroyAccount" detail:@"用户注销" type:ListModelTypeDestroyAccount],
        [ListModel initWithTitle:@"ReactiveObjC" detail:@"RAC" type:ListModelTypeReactiveObjC],
        [ListModel initWithTitle:@"登录" detail:@"RAC login" type:ListModelTypeReactiveObjCLogin],
        [ListModel initWithTitle:@"ListEdit" detail:@"列表编辑" type:ListModelTypeListEdit],
        [ListModel initWithTitle:@"Search" detail:@"搜索" type:ListModelTypeSearch],
        [ListModel initWithTitle:@"WKWebView" detail:@"网页" type:ListModelTypeWebView],
        [ListModel initWithTitle:@"首页page样式" detail:@"PageController" type:ListModelTypePageController],

        
        
        
        [ListModel initWithTitle:@"Test" detail:@"测试" type:ListModelTypeTest],
    ];
    self.data = array;
    
    //列表tableview
    [self setupViews];
    
    //    //cup memory监控
    //    [self.timer fire];
    
    
    //#############################################################################################################
    
    UILabel *titleLabel3 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20)];
    titleLabel3.textAlignment = NSTextAlignmentRight;
    titleLabel3.text = @"字体";
    titleLabel3.font = [UIFont systemFontOfSize:16];
    titleLabel3.textColor = [UIColor grayColor];
    [self.view addSubview:titleLabel3];
    //字体包
    NSString *string = FGGetStringWithKeyFromTable(@"Language", @"InfoPlist");
    NSLog(@"APP当前语言:%@",string);
    NSString *showStr = [NSString stringWithFormat:@"APP当前语言:%@",string];
    titleLabel3.text = showStr;
    
    
    //    UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 200, 320, 320)];
    //    textView.backgroundColor= [UIColor grayColor];
    //    [self.view addSubview:textView];
    
    CGFloat f = 1.1;
    NSLog(@"%f",f);
    
    ////    房主
    //    UIImageView *imageV = [[UIImageView alloc]init];;
    //    imageV.image = [UIImage roomOwnimage];
    //    imageV.frame = CGRectMake(50, 50, 50, 50);
    //    [self.view addSubview:imageV];
    ////    [self shakeAnimationForView:imageV];
    ////    [self longPress:imageV];
    //
    ////    [imageV removeFromSuperview];
    //
    //
    //    NSLog(@"%@",imageV.superview);
    //    if (!imageV.superview) {
    //        imageV = nil;
    //    }
    ////    imageV = nil;
    //    [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.top.equalTo(@0);
    //        make.leading.equalTo(@0);
    //        make.width.mas_equalTo(213);
    //        make.height.mas_equalTo(45);
    //    }];
    
  
//    FollowTips *tips = [[FollowTips alloc]initWithFrame:CGRectMake(0, 200, 320, 50)];
//    [tips show];
//    tips.followTipHidden = ^{
//    };
    
    //    //强制移除
    //    [tips removeFromSuperview];
    //    tips = nil;
    
    
    //    [self createFollowTipsTimerWithDuration:25.0];
     
    
    //    //线程
    //    //线程1
    //    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    //        @synchronized(self){
    //            NSLog(@"23423");
    //            sleep(10);
    //        }
    //    });
    //
    //    //线程2
    //    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    //        sleep(1);
    //        @synchronized(self){
    //            NSLog(@"23423--------");
    //        }
    //    });
     
    
//    //展示gif
//    [self testGIF];
    //主线程 remove nil 修改约束 会不会崩溃测试
//    [self testRemoveBug];
//    //json 动画
//    [self LOTAnimation];
//    //房主
//    [self createRoomOwnimage]; 
}

//房主
- (void)createRoomOwnimage {
    UIImageView *imageV = [[UIImageView alloc]init];;
    imageV.image = [UIImage roomOwnimage];
    imageV.frame = CGRectMake(150, 50, 40, 20);
    [self.view addSubview:imageV];
 
}

- (void)testGIF {
    //GIF：sdwebimage
    UIImageView *gifV = [[UIImageView alloc]init];;
    //        gifV.image = [UIImage sd_animatedGIFNamed:@"追剧引导-白色-一次"];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"追剧引导-白色-一次" ofType:@"gif"];
    gifV.image = [UIImage sd_imageWithGIFData:[NSData dataWithContentsOfFile:path]];
    gifV.frame = CGRectMake(50, 50, 50, 50);
    [self.view addSubview:gifV];
    
    //gif 可以一次
    //sd_animatedGIFNamed
    SDAnimatedImageView *imageView = [SDAnimatedImageView new];
    SDAnimatedImage *animatedImage = [SDAnimatedImage imageNamed:@"追剧引导-白色-一次.gif"];
    imageView.image = animatedImage;
    imageView.frame = CGRectMake(50, 100, 50, 50);
    [self.view addSubview:imageView];
}


- (void)testRemoveBug {
    [self createImage];
//    [self removeImage];
//    [self changeImage];
    
    WS(weakSelf)
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf removeImage];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf changeImage];
    });
}

- (void)changeImage {
    NSLog(@"--==变化mas_updateConstraints==--"); 
    [self.removeImageView  mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@10);
        make.leading.equalTo(@10);
        make.width.mas_equalTo(45);
        make.height.mas_equalTo(45);
    }];
}
- (void)removeImage {
    [self.removeImageView removeFromSuperview];
    for (int i = 0; i< 20000; i++) {
        NSLog(@"--==第%d次==--",i);
    }
    self.removeImageView = nil;
}

- (void)createImage {
    UIImageView *imageV = [[UIImageView alloc]init];;
    imageV.image = [UIImage roomOwnimage];
    imageV.frame = CGRectMake(50, 50, 50, 50);
    [self.view addSubview:imageV];
    self.removeImageView = imageV;
    [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.leading.equalTo(@0);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
    }];
    
    //
    //        NSLog(@"%@",imageV.superview);
    //        if (!imageV.superview) {
    //            imageV = nil;
    //        }
    //    //    imageV = nil;
}


- (void)createFollowTipsTimerWithDuration:(CGFloat)duration {
    if (duration <= 0) {
        return;
    }
    CGFloat seconds = duration * 0.2;//20%
    //停止定时器
    [self stopFollowTipsTimer];
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:seconds target:self selector:@selector(showFollowTips) userInfo:nil repeats:NO];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    self.followTipsTimer = timer;
}

- (void)stopFollowTipsTimer  {
    if (self.followTipsTimer) {
        [self.followTipsTimer invalidate];
        self.followTipsTimer = nil;
    }
}

- (void)showFollowTips {
    
}


/**
 * 抖动效果
 *
 * @param view 要抖动的view
 */
- (void)shakeAnimationForView:(UIView *) view {
    CALayer *viewLayer = view.layer;
    CGPoint position = viewLayer.position;
    CGPoint x = CGPointMake(position.x + 2, position.y);
    CGPoint y = CGPointMake(position.x - 2, position.y);
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
    [animation setFromValue:[NSValue valueWithCGPoint:x]];
    [animation setToValue:[NSValue valueWithCGPoint:y]];
    [animation setAutoreverses:YES];
    [animation setDuration:.06];
    [animation setRepeatCount:5];
    [viewLayer addAnimation:animation forKey:nil];
    
    animation.delegate = self;
}

- (void)longPress:(UIView *) view {
    
    //创建动画对象
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    
    anim.keyPath = @"transform.rotation";
    anim.values = @[@(angle2Rad(-5)),@(angle2Rad(5))];
    //    anim.repeatCount = MAXFLOAT;
    //    anim.duration = 1;
    
    anim.repeatCount = 3;
    //    anim.duration = 0.5;
    
    anim.autoreverses = YES;
    [view.layer addAnimation:anim forKey:nil];
    
}

- (void)animationDidStart:(CAAnimation *)anim {
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)clickTagListBtn:(UIButton *)btn {
    
    TagListViewController *vc= [[TagListViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
    NSLog(@"self？？？？--------");
    
    @synchronized(self){
        NSLog(@"？？？？--------");
    }
}

-(void)clickPassword {
    /*
     //修改密码
     ChangePasswordVC *vc= [[ChangePasswordVC alloc]init];
     vc.title = @"修改密码";
     vc.hidesBottomBarWhenPushed = YES;
     [self.navigationController pushViewController:vc animated:YES];
     
     //设置密码 没有密码
     SetPasswordVC *vc3 = [[SetPasswordVC alloc]init];
     vc3.title = @"设置密码 没有密码";
     [self.navigationController pushViewController:vc3 animated:YES];
     
     //设置密码 注册时候（可跳过）
     RegisterSetPasswordVC *vc4 = [[RegisterSetPasswordVC alloc]init];
     vc4.title = @"设置密码 注册时候（可跳过）";
     [self.navigationController pushViewController:vc4 animated:YES];
     
     //重置密码 忘记密码 需要：手机号phone，验证码code
     ForgetPasswordResetPasswordVC *vc2 = [[ForgetPasswordResetPasswordVC alloc]init];
     vc2.phone = @"";
     vc2.code = @"";
     vc2.title = @"重置密码 忘记密码 手机号 验证码";
     [self.navigationController pushViewController:vc2 animated:YES];
     
     //重置密码 存量用户
     NeedResetPasswordVC *vc1 = [[NeedResetPasswordVC alloc]init];
     vc1.title = @"重置密码 存量用户";
     [self.navigationController pushViewController:vc1 animated:YES];
     
     */
}

-(void)clickTagList1 {
    
    LZTagListVC *vc= [[LZTagListVC alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
    //    WScrollViewController *vc= [[WScrollViewController alloc]init];
    //    vc.hidesBottomBarWhenPushed = YES;
    //    [self.navigationController pushViewController:vc animated:YES];
    
    
}

-(void)clickTagList2 {
    
    TagListViewController *vc= [[TagListViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)click3DTouch {
    
    ForceTouchListVC *vc= [[ForceTouchListVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)clickSystemAlter {
    
    AlterViewController *vc= [[AlterViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)clickTableView {
    WTableViewController *vc= [[WTableViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)clickVerticalCollectionView {
    
    VerticalCollectionViewController *vc= [[VerticalCollectionViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)clickHorizontalCollectionView {
    
    HorizontalCollectionViewController *vc= [[HorizontalCollectionViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


-(void)clickPassValue {
    
    PassValueViewController *vc= [[PassValueViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)clickLanguage {
    
    //    [[FGLanguageTool sharedInstance] setNewLanguage:@"en"];
    //    [[FGLanguageTool sharedInstance] setNewLanguage:@"zh-Hans"];
    //    中文简体@"zh-Hans"
    //    中文繁体@"zh-Hant"
    //    英文@"en"
    
    [[FGLanguageTool sharedInstance] changeNowLanguage];
}

-(void)clickFont {
    
    FontViewControlle *vc= [[FontViewControlle alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)clickTwoCollectionList{
    
    //    上下一对一联动的Collection
    GaoDengViewController *vc= [[GaoDengViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

-(void)clickCrash {
    
    NSArray *arry=[NSArray arrayWithObject:@"sss"];
    NSLog(@"%@",[arry objectAtIndex:1]);
}

-(void)clickChat {
    ChatViewController *vc= [[ChatViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

//-(void)clickFullChat {
//    
//    FullScreenChatController *vc= [[FullScreenChatController alloc]init];
//    [self.navigationController pushViewController:vc animated:YES];
//}

-(void)clickYYText {
    
    YYViewController *vc= [[YYViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)clickMask {
    
    MaskViewController *vc= [[MaskViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)clickAttributedText {
    
    AttributedTextViewController *vc= [[AttributedTextViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)clickIsEqual {
    
    IsEqualViewController *vc= [[IsEqualViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)clickDestroyAccount {
    
    RRDestroyAccountAgreenmentViewController *vc= [[RRDestroyAccountAgreenmentViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)clickReactiveObjC {
    
    OrderViewController *vc= [[OrderViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)clickReactiveObjCLogin {
    //    RACLoginViewController *vc= [[RACLoginViewController alloc]init];
    RACViewController *vc= [[RACViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)clickWebView {
    WebVC *vc= [[WebVC alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)clickScore {
    //评分
    ScoreViewController *vc= [[ScoreViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)clickListEdit {
    //列表编辑
    ListEditViewController *vc= [[ListEditViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)clickSearch {
    //列表编辑
    SearchViewController *vc= [[SearchViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)clickPageController {
    
    HomePageViewController *vc= [[HomePageViewController alloc]init];
    vc.selectIndex = 1;
    vc.automaticallyCalculatesItemWidths = YES;
      
    vc.titleSizeSelected = 16;
     
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
  
}

- (void)clickTest {
    //横向滚动的collectionView
    TestViewController *vc= [[TestViewController alloc]init];
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

- (void)setupViews {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.frame = self.view.bounds;;
    self.tableView.frame = CGRectMake(0, 0, self.view.bounds.size.width , 480);
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    //codecell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    [self.tableView registerClass:[ListModelCell class] forCellReuseIdentifier:NSStringFromClass([ListModelCell class])];
    [self.view addSubview:self.tableView];
    //    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.edges.equalTo(self.view);
    //    }];
    
}

#pragma mark -- UITableViewDataSource
//返回分组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}
//返回每组行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

//row高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

//返回每行cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ListModelCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ListModelCell class]) forIndexPath:indexPath];
    
    ListModel *model = self.data[indexPath.row];
    
    [cell fillWithData:model];
    
    //cell的右边有一个小箭头，距离右边有十几像素；
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //设置cell分割线的edge可以设置去除指定cell的分割线
    cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    //tableviewCell点击取消选中变灰效果
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}
#pragma mark -- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    点击效果
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ListModel *model = self.data[indexPath.row];
    ListModelType type = model.type;
    switch (type) {
        case ListModelTypeNone:
        {
        }
            break;
        case ListModelTypeTagList1:
        {
            [self clickTagList1];
            
        }
            break;
        case ListModelTypeTagList2:
        {
            [self clickTagList2];
            
        }
            break;
        case ListModelType3DTouch:
        {
            [self click3DTouch];
        }
            break;
        case ListModelTypeSystemAlter:
        {
            [self clickSystemAlter];
        }
            break;
        case ListModelTypeTableView:
        {
            [self clickTableView];
        }
            break;
        case ListModelTypeVerticalCollectionView:
        {
            [self clickVerticalCollectionView];
        }
            break;
        case ListModelTypeHorizontalCollectionView:
        {
            [self clickHorizontalCollectionView];
        }
            break;
        case ListModelTypePassValue:
        {
            [self clickPassValue];
        }
            break;
        case ListModelTypeLanguage:
        {
            [self clickLanguage];
        }
            break;
        case ListModelTypeFont:
        {
            [self clickFont];
        }
            break;
        case ListModelTypeTwoCollectionList:
        {
            [self clickTwoCollectionList];
        }
            break;
        case ListModelTypeCrash:
        {
            [self clickCrash];
        }
            break;
        case ListModelTypeChat:
        {
            [self clickChat];
        }
            break;
        case ListModelTypeYYText:
        {
            [self clickYYText];
        }
            break;
        case ListModelTypeMask:
        {
            [self clickMask];
        }
            break;
        case ListModelTypeAttributedText:
        {
            [self clickAttributedText];
        }
            break;
        case ListModelTypeIsEqual:
        {
            [self clickIsEqual];
        }
            break;
        case ListModelTypeDestroyAccount:
        {
            [self clickDestroyAccount];
        }
            break;
        case ListModelTypeReactiveObjC:
        {
            [self clickReactiveObjC];
        }
            break;
        case ListModelTypeReactiveObjCLogin:
        {
            [self clickReactiveObjCLogin];
        }
            break;
        case ListModelTypeWebView:
        {
            [self clickWebView];
        }
            break;
        case ListModelTypeScore:
        {
            [self clickScore];
        }
            break;
        case ListModelTypeListEdit:
        {
            [self clickListEdit];
        }
            break;
        case ListModelTypeSearch:
        {
            [self clickSearch];
        }
            break;
        case ListModelTypePageController:
        {
            [self clickPageController];
        }
            break;
        case ListModelTypeTest:
        {
            [self clickTest];
        }
            break;
        default:
        {
            NSAssert(NO, @"PLUPersonalItemType 类型错误");
        }
            break;
    }
}

- (void)xxTest {
    
    //    富文本
    //    iOS富文本设置混合字符串（中英文）奇葩换行问题
    //    https://www.jianshu.com/p/84e1a0784edc
    //
    //    解决方法：
    //    //UILabel
    //    设置label.lineBreakMode ＝ NSLineBreakByCharWrapping;
    //
    //    如果此时你是即进行了富文本设定又对换行进行设定的话，记住先把换行操作的代码放到label.attributedText ＝ .......代码之后，不然label.lineBreakMode ＝ NSLineBreakByCharWrapping会失效。
    //    设置之后显示正常了，但是计算这个文本高度的时候，计算的高度不准确了。
    //
    //    切记：计算高度的时候，段落样式加上这个属性，就可以计算高度
    //    //NSMutableParagraphStyle
    //    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    
    //    富文本AttributedString的总结（一）
    //    https://www.jianshu.com/p/bbfe7bd282f1
    //    富文本AttributedString总结（二）之简单实现图文混排
    //    https://www.jianshu.com/p/c2de7824328d
    //    富文本AttributedString总结（三）之链接属性的设置
    //    https://www.jianshu.com/p/aecb9e426459
    
}

//json动画
- (void)LOTAnimation {
    LOTAnimationView *lottieView = [LOTAnimationView animationNamed:@"data"];
    lottieView.frame = CGRectMake(50, 150, 50, 50);
    //    lottieView.frame = self.view.bounds;
    lottieView.loopAnimation = YES;
    //    lottieView.contentMode = UIViewContentModeScaleAspectFit;
    //    lottieView.animationSpeed = 0.5
    
    [self.view addSubview:lottieView];
    //    [lottieView mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.center.equalTo(@60);
    //        make.width.height.offset(60);
    //    }];
    [lottieView play];
    
    //    [lottieView playWithCompletion:^(BOOL animationFinished) {
    //
    //    }];
}
@end

