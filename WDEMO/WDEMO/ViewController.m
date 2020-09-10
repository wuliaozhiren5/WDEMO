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

//chat
#import "ChatViewController.h"
#import "FullScreenChatController.h"

//HUB
#import <MBProgressHUD/MBProgressHUD.h>
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


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, copy) NSArray *data;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self clickChat];
    [self clickFullChat];
    
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
        [ListModel initWithTitle:@"TagList1" detail:@"瀑布流" type:ListModelTypeTagList1],
        [ListModel initWithTitle:@"TagList2" detail:@"瀑布流优化" type:ListModelTypeTagList2],
        [ListModel initWithTitle:@"3DTouch" detail:@"3DTouch" type:ListModelType3DTouch],
        [ListModel initWithTitle:@"SystemAlter" detail:@"系统提示框" type:ListModelTypeSystemAlter],
        [ListModel initWithTitle:@"TableView" detail:@"简单的列表" type:ListModelTypeTableView],
        [ListModel initWithTitle:@"CollectionView" detail:@"简单的网格" type:ListModelTypeCollectionView],
        [ListModel initWithTitle:@"PassValue" detail:@"传值" type:ListModelTypePassValue],
        [ListModel initWithTitle:@"Language" detail:@"语言切换" type:ListModelTypeLanguage],
        [ListModel initWithTitle:@"Font" detail:@"字体" type:ListModelTypeFont],
        [ListModel initWithTitle:@"TwoList" detail:@"上下一对一联动的Collection" type:ListModelTypeTwoCollectionList],
        [ListModel initWithTitle:@"Crash" detail:@"抓取崩溃信息" type:ListModelTypeCrash],
        [ListModel initWithTitle:@"Chat" detail:@"聊天UI" type:ListModelTypeChat],
        [ListModel initWithTitle:@"YYText" detail:@"YYText富文本" type:ListModelTypeYYText],
        [ListModel initWithTitle:@"Mask" detail:@"遮罩" type:ListModelTypeMask],
        [ListModel initWithTitle:@"AttributedText" detail:@"系统富文本" type:ListModelTypeAttributedText],
        [ListModel initWithTitle:@"IsEqua" detail:@"判断对象是否相等" type:ListModelTypeIsEqual],
        [ListModel initWithTitle:@"DestroyAccount" detail:@"用户注销" type:ListModelTypeDestroyAccount],
        [ListModel initWithTitle:@"ReactiveObjC" detail:@"RAC" type:ListModelTypeReactiveObjC],
        [ListModel initWithTitle:@"登录" detail:@"RAC login" type:ListModelTypeReactiveObjCLogin],
        [ListModel initWithTitle:@"Test" detail:@"测试" type:ListModelTypeTest],
        
        
        
    ];
    self.data = array;
    
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
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)clickTagListBtn:(UIButton *)btn {
    
}

-(void)clickTagList1 {
    
    //    LZTagListVC *vc= [[LZTagListVC alloc]init];
    //    vc.hidesBottomBarWhenPushed = YES;
    //    [self.navigationController pushViewController:vc animated:YES];
    
    //    WScrollViewController *vc= [[WScrollViewController alloc]init];
    //    vc.hidesBottomBarWhenPushed = YES;
    //    [self.navigationController pushViewController:vc animated:YES];
    
    
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
    
    AllScreenViewController *all = [[AllScreenViewController alloc]init];
    all.title = @"全屏";
    all.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:all animated:YES];
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
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)clickCollectionView {
    
    WCollectionViewController *vc= [[WCollectionViewController alloc]init];
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
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)clickFullChat {
    
    FullScreenChatController *vc= [[FullScreenChatController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

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

- (void)clickTest {
    
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
        case ListModelTypeCollectionView:
        {
            [self clickCollectionView];
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
@end

