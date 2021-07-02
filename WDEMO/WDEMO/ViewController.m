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
//红点
#import "UIView+RedPoint.h"
//阴影
#import "UIView+Shadow.h"
//归档解档
#import "KeyedArchiverViewController.h"
//个人主页
#import "PersonalHomePageVC.h"
//个人主页
#import "RRActorVC.h"
#import "RRActorIntroVC.h"
//新手引导
#import "NewHandGuideViewController.h"
//评论
#import "RRSeasonSeniorCommentsSubVC.h"
//消息
#import "RRMessageSeasonCommentPositionListVC.h"
//
#import "XXLoadingView.h"

#define angle2Rad(angle) ((angle) / 180.0 *M_PI)

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, CAAnimationDelegate>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, copy) NSArray *data;
@property (nonatomic, strong) NSTimer *timer;
//追剧提示定时器
@property (nonatomic, strong) NSTimer *followTipsTimer;


@property (nonatomic, strong) UIImageView *removeImageView;
@property (nonatomic, strong) XXLoadingView *loadingView;
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
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
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
        
        [ListModel initWithTitle:@"评论" detail:@"bilibili，爱奇艺，优酷评论UI）" type:ListModelTypeComment],
        [ListModel initWithTitle:@"新手引导（某个页面的新手引导）" detail:@"新手引导（某个页面的新手引导）" type:ListModelTypeNewHandGuide],
        
        [ListModel initWithTitle:@"首页page样式" detail:@"PageController" type:ListModelTypePageController],
        [ListModel initWithTitle:@"Personal个人主页" detail:@"PersonalHomePage" type:ListModelTypePersonalHomePage],
        [ListModel initWithTitle:@"Actor个人主页" detail:@"ActorHomePage" type:ListModelTypeActorHomePage],
        
        
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
        [ListModel initWithTitle:@"ScoreView" detail:@"评分只是展示ScoreView" type:ListModelTypeScore],
        [ListModel initWithTitle:@"Archiver" detail:@"归档解档" type:ListModelTypeArchiver],
        //        [ListModel initWithTitle:@"首页page样式" detail:@"PageController" type:ListModelTypePageController],
        //        [ListModel initWithTitle:@"个人主页" detail:@"PersonalHomepage" type:ListModelTypePersonalHomepage],
        
        
        
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
    
    //        [UIView createRedViewWithRect:CGRectMake(20, 20, 10, 10) bySuperView:imageV];
    
    
    //    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    //    view.backgroundColor = [UIColor grayColor];
    //    [self.view addSubview:view];
    
    //小红点
    //    [UIView createRedViewWithPoint:CGPointMake(10, 10) bySuperView:view];
    //    [UIView createRedViewWithRect:CGRectMake(0, 0, 30, 30) bySuperView:view];
    
    //阴影
    //    [view setShadowWithOffsetX:0 offsetY:5 Blur:15 Spread:1];
    
    
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
    
    
    
    [self tryCatch];
    
    
    //    [self calculate];
    //圆角
    //      [self circularCorner];//圆角
    
    NSInteger count = 11001;
    NSString *countStr = @"";
    if (count <= 0) {
        countStr = @"";
    } else if (count > 0 && count < 10000) {
        countStr = @(count).stringValue;
    } else if (count == 10000) {
        countStr = @"1w";
    } else if (count > 10000 && count < 100000) {
        //万位
        NSInteger a = count / 10000;
        //千位
        NSInteger b = (count / 1000) % 10;
        if (b > 0) {
            countStr = [NSString stringWithFormat:@"%zi.%ziw", a, b];
        } else {
            countStr = [NSString stringWithFormat:@"%ziw", a];
        }
    } else if (count == 100000) {
        countStr = @"10w";
    } else if (count > 100000) {
        countStr = @"10w+";
    }
    NSLog(@"countStr: %@", countStr);
    
    [self test123456];
    [self testSring];
    
    [self showLoadingView];
}

- (void)showLoadingView {
//    XXLoadingView *loadingView = [[XXLoadingView alloc] init];
    XXLoadingView *loadingView = [[XXLoadingView alloc] initWithFrame:self.view.bounds];
    loadingView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:loadingView];
    [self.view bringSubviewToFront:loadingView];
    [loadingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
//    loadingView.state = MJLoadingViewStateNone;
    loadingView.state = MJLoadingViewStateLoading;
//    loadingView.state = MJLoadingViewStateSuccess;
//    loadingView.state = MJLoadingViewStateFailure;
//    loadingView.state = MJLoadingViewStateNoData;
//    loadingView.state = MJLoadingViewStateNoNetwork;
    [self performSelector:@selector(releaseMem) withObject:nil afterDelay:1.0];
    self.loadingView = loadingView;
}
 
- (void)releaseMem {
    self.loadingView.state = MJLoadingViewStateSuccess;
}

- (void)test123456 {
  
    NSString *str1 = @"<em>你</em><em>我</em><em>他</em>";
//    NSString *str = _highlights[@"alias1"];
//    @"<em>"
//    @"</em>"
    
//    if ([str rangeOfString:@"<em>"].location != NSNotFound || [str rangeOfString:@"</em>"].location != NSNotFound) {
//        //原文中出现标签，不做高亮处理
////        return [[NSAttributedString alloc] initWithString:originText];
//        return;
//    }
    NSMutableArray<NSString *> *subStrings = [[str1 componentsSeparatedByString:@"<em>"] mutableCopy];
    
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:@""];
    for (NSInteger i = 0; i < subStrings.count; i++) {
        
        NSMutableString *mString = [subStrings[i] mutableCopy];
//        NSString *string = subStrings[i];
        NSRange range = [mString rangeOfString:@"</em>"];
        if (range.location != NSNotFound) {
            NSLog(@"所查的字符坐标为：%ld",range.location);
            NSLog(@"所查的字符长度为：%ld",range.length);
        }
    }
}

- (void)testSring {
    //    substringFromIndex 和 substringToIndex用法，有需要的朋友可以参考下。
    //
    //    substringFromIndex：从Index开始截取到最后
    //    substringToIndex：从最前头一直截取到Index
    
//    substringFromIndex 范围：0 - lenght     0：的时候是全部  lenght：的时候是@""
//    substringToIndex   范围：0 - lenght     0：@“”         lenght：的时候是全部
    
    NSString *testsubstringToorFromIndex = @"test1234";
    
//    NSString *fromIndexstring = [testsubstringToorFromIndex substringFromIndex:8];
//
//    NSString *toIndexstring = [testsubstringToorFromIndex substringToIndex:8];
    
//    NSString *fromIndexstring = [testsubstringToorFromIndex substringFromIndex:8];
//
//    NSString *toIndexstring = [testsubstringToorFromIndex substringToIndex:8];
    
 
    NSString *fromIndexstring = [testsubstringToorFromIndex substringFromIndex:2];

    NSString *toIndexstring = [testsubstringToorFromIndex substringToIndex:2];
    
    NSLog(@"subtringfromindex is %@",fromIndexstring);
    
    NSLog(@"subtringToindex is %@",toIndexstring);
    
    //    输出结果
    //
    //    2014-11-29 06:23:59.634 sdktest[587:11024] subtringfromindex is st1234
    //
    //    2014-11-29 06:23:59.634 sdktest[587:11024] subtringToindex is te
    //
    
}
////圆角
- (void)circularCorner {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 200, 100)];
    imageView.image = [UIImage imageNamed:@"1"];
    
    imageView.backgroundColor = [UIColor grayColor];
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:imageView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(25, 5)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    maskLayer.frame = imageView.bounds;
    maskLayer.path = maskPath.CGPath;
    imageView.layer.mask = maskLayer;
    [self.view addSubview:imageView];
    
    
}

- (void)tryCatch {
    //    iOS - try~catch捕获异常防止崩溃简单实用
    //    https://www.cnblogs.com/adampei-bobo/p/7444040.html
    
    //创建可变数组
    NSMutableArray * arrM = @[].mutableCopy;
    //    NSMutableArray * arrM = @[].copy;
    
    // 创建nil对象
    NSString * str = @"";
    // 测试try cash
    @try {
        //此处写可能出现崩溃的代码
        //数组插入nil对象
        [arrM addObject:str];
    } @catch (NSException *exception) {
        //捕获到异常要执行的代码
        NSLog(@"exc == %@, 最后我弹了一个弹框说这样不合适",exception);
    } @finally {
        //不管能不能捕获到异常都会执行的方法
        NSLog(@"最后");
    }
    
}

- (void)calculate {
    //    iOS查找子字符串(含多个字符串)在父字符串中的所有位置
    //http://www.manongjc.com/article/94493.html
    //    iOS 查找字符串 相同 子字符串的位置 range
    //https://cloud.tencent.com/developer/article/1034363
    
    //    方法的调用
    NSArray *array = [self calculateSubStringCount:@"abcd1234556abcd" str:@"abcd"];
}
/**
 查找子字符串在父字符串中的所有位置
 @param content 父字符串
 @param tab 子字符串
 @return 返回位置数组
 */
- (NSMutableArray*)calculateSubStringCount:(NSString *)content str:(NSString *)tab {
    int location = 0;
    NSMutableArray *locationArr = [NSMutableArray new];
    NSRange range = [content rangeOfString:tab];
    if (range.location == NSNotFound){
        return locationArr;
    }
    //声明一个临时字符串,记录截取之后的字符串
    NSString * subStr = content;
    while (range.location != NSNotFound) {
        if (location == 0) {
            location += range.location;
        } else {
            location += range.location + tab.length;
        }
        //记录位置
        NSNumber *number = [NSNumber numberWithUnsignedInteger:location];
        [locationArr addObject:number];
        //每次记录之后,把找到的字串截取掉
        subStr = [subStr substringFromIndex:range.location + range.length];
        NSLog(@"subStr %@",subStr);
        range = [subStr rangeOfString:tab];
        NSLog(@"rang %@",NSStringFromRange(range));
    }
    return locationArr;
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
    
    //    OneViewTableTableViewController * oneVc  = [OneViewTableTableViewController new];
    //    oneVc.delegate = self;
    //    SecondViewTableViewController * twoVc  = [SecondViewTableViewController new];
    //    twoVc.delegate = self;
    //    ThirdViewCollectionViewController * thirdVc  = [ThirdViewCollectionViewController new];
    //    thirdVc.delegate = self;
    
    
    //    WMPageController *pageVC = [[WMPageController alloc] initWithViewControllerClasses:viewControllers andTheirTitles:titles];
    //    [pageVC setViewFrame:CGRectMake(0, 0, Screen_Width, Screen_Height)];
    //    pageVC.delegate = self;
    //    pageVC.menuItemWidth = 85;
    //    pageVC.menuHeight = 44;
    //    pageVC.postNotification = YES;
    //    pageVC.bounces = YES;
    //    return pageVC;
    
    UIViewController *vc0 = [UIViewController new];
    vc0.view.backgroundColor = [UIColor grayColor];
    UIViewController *vc1 = [UIViewController new];
    vc1.view.backgroundColor = [UIColor darkGrayColor];
    UIViewController *vc2 = [UIViewController new];
    vc2.view.backgroundColor = [UIColor systemGrayColor];
    
    NSArray *viewControllers = @[vc0, vc1, vc2];
    NSArray *titles = @[@"first",@"second",@"third"];
    HomePageViewController *vc= [[HomePageViewController alloc] initWithViewControllerClasses:viewControllers andTheirTitles:titles];
    vc.viewControllers = viewControllers;
    
    vc.selectIndex = 1;
    vc.title = @"首页样式";
    //带下划线
    vc.menuViewStyle = WMMenuViewStyleLine;
    ///** 是否自动通过字符串计算 MenuItem 的宽度，默认为 NO. */
    vc.automaticallyCalculatesItemWidths = YES;
    //菜单对齐方式
    vc.menuViewLayoutMode = WMMenuViewLayoutModeLeft;
    //间隙
    vc.itemMargin = 10;
    /** MenuView 内部视图与左右的间距 */
    vc.menuViewContentMargin = 10;
    //底部小横线样式，小红线长度
    vc.progressViewIsNaughty = YES;
    vc.progressWidth = 10;
    //        vc.selectIndex = 1;
    //        vc.automaticallyCalculatesItemWidths = YES;
    //        vc.titleSizeSelected = 16;
    
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)clickPersonalHomePage {
    //个人主页
    PersonalHomePageVC *vc= [[PersonalHomePageVC alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)clickActorHomePage {
    //个人主页
    RRActorVC *vc= [[RRActorVC alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)clickNewHandGuide {
    //新手引导
    //    NewHandGuideViewController *vc= [[NewHandGuideViewController alloc]init];
    
    CGRect rect = CGRectMake(100, 200, 54, 40);
    CGFloat width = 54;//rect.size.width + 20;
    CGFloat height = 40;//42
    CGFloat x = rect.origin.x - (54 - rect.size.width) / 2;
    CGFloat y = rect.origin.y - (height - rect.size.height) / 2;
    CGRect showRect = CGRectMake(x, y, width, height);
    NewHandGuideViewController *vc = [[NewHandGuideViewController alloc] initWithBtnGuideRect:showRect];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)clickComment {
    
//    RRSeasonSeniorCommentsSubVC *vc = [[RRSeasonSeniorCommentsSubVC alloc] init];
//    vc.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:vc animated:YES];
    
    RRMessageSeasonCommentPositionListVC *vc = [[RRMessageSeasonCommentPositionListVC alloc] init];
//    vc.commentId = commentId;
//    vc.replyId = replyId;
//    vc.targetType = targetType;
//    vc.targetTypeId = targetTypeId;
//    vc.isNew = NO;
    [self.navigationController pushViewController:vc animated:YES];

    
    
//    RRSeasonSeniorCommentsSubVC *vc = [[RRSeasonSeniorCommentsSubVC alloc] initWithIsHalf:YES];
////    vc.actorId = [NSString stringWithFormat:@"%lld", model.ID];
////    vc.name = model.chineseName;
////    vc.communityEnable = model.communityEnable;
////    UIViewController *topVC = [UIViewController topViewController];
//    UIViewController *topVC = self;
//    [topVC addChildViewController:vc];
//    [vc didMoveToParentViewController:topVC];
//    [topVC.view addSubview:vc.view];
//    [vc show];
}

- (void)clickArchiver {
    //归档解档
    KeyedArchiverViewController *vc= [[KeyedArchiverViewController alloc]init];
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
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
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
        case ListModelTypePersonalHomePage:
        {
            [self clickPersonalHomePage];
        }
            break;
        case ListModelTypeActorHomePage:
        {
            [self clickActorHomePage];
        }
            break;
        case ListModelTypeArchiver:
        {
            [self clickArchiver];
        }
            break;
        case ListModelTypeTest:
        {
            [self clickTest];
        }
            break;
        case ListModelTypeNewHandGuide:
        {
            [self clickNewHandGuide];
        }
            break;
        case ListModelTypeComment:
        {
            [self clickComment];
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

