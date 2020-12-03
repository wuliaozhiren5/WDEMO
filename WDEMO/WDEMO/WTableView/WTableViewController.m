//
//  WTableViewController.m
//  WDEMO
//
//  Created by longzhu on 2019/9/2.
//  Copyright © 2019年 wwc. All rights reserved.
//

#import "WTableViewController.h"
#import "WTableViewCell.h"

//static NSString *kCellIdentify = @"DetailCell";

@interface WTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;

@end

@implementation WTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //    UINavigationBar与UITabBar半透明：会被遮挡；不透明，不会被遮挡
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    //**************************************************************************
    self.tableView=[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    
    //xib cell
//    [self.tableView registerNib:[UINib nibWithNibName:@"WTableViewCell" bundle:nil] forCellReuseIdentifier:@"WTableViewCell"];
    
    //codecell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    
    //codecell
    [self.tableView registerClass:[WTableViewCell class] forCellReuseIdentifier:NSStringFromClass([WTableViewCell class])];
    
    
    //iOS11
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        //        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    //------
    
    [self.view addSubview:self.tableView];
    
    //    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.leading.trailing.top.bottom.equalTo(self.view);
    //    }];
    self.tableView.frame = self.view.bounds;
    
    //header
    self.tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectZero];
    //footer
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    
    /*
     // UITableView的两种样式
     UITableViewStylePlain / UITableViewStyleGrouped
     
     self.tableView.backgroundColor = [UIColor purpleColor];
     
     // 设置索引条内部文字颜色
     self.tableView.sectionIndexColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
     
     // 设置索引条背景颜色
     self.tableView.sectionIndexBackgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
     
     //1. 修改tableView的行高
     self.tableView.rowHeight = 100;
     
     // 2.组头组尾的高
     self.tableView.sectionHeaderHeight = 55;
     self.tableView.sectionFooterHeight = 22;
     
     // 3.设置整个tablView的头部/尾部视图
     self.tableView.tableHeaderView = [[UISwitch alloc] init];
     self.tableView.tableFooterView = [UIButton buttonWithType:UIButtonTypeInfoDark];
     
     // 4.设置我们分割线颜色(clearColor相当于取消系统分割线)
     self.tableView.separatorColor = [UIColor clearColor];
     
     // 5.设置分割线样式
     self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
     
     分割线长度
     self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
     分割线长度
     cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
     
     
     */
    
    
    UIView  *foot = [[UIView alloc]init];
    foot.frame = CGRectMake(0, 0, self.tableView.frame.size.width, 100);
    foot.backgroundColor = [UIColor clearColor];
    self.tableView.tableFooterView = foot;
    
    UIButton *btn = [[UIButton alloc]init];
    btn.frame = CGRectMake(0, 0, self.tableView.frame.size.width/2, 50);
    btn.center = CGPointMake(foot.frame.size.width/2, foot.frame.size.height/2);
    btn.backgroundColor = [[UIColor alloc]initWithRed:78/255.0 green:154/255.0 blue:248/255.0 alpha:1.0];
    [btn setTitle:@"进入" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    
    [btn addTarget:self action:@selector(goPlayerVC:) forControlEvents:UIControlEventTouchUpInside];
    
    btn.layer.cornerRadius = 25;
    btn.layer.masksToBounds = YES;
    [foot addSubview:btn];
}

- (void)goPlayerVC:(UIButton *)sender
{
    
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark -- UITableViewDataSource

//返回分组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}
//返回每组行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

//row高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

//返回每行cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    WTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([WTableViewCell class]) forIndexPath:indexPath];
//    cell.firstLabel.text = [NSString stringWithFormat:@"section = %zi", indexPath.section];
//    cell.secondLabel.text = [NSString stringWithFormat:@"row = %zi", indexPath.row];
    cell.xibLab.text = [NSString stringWithFormat:@"section = %zi ,row = %zi", indexPath.section, indexPath.row];
    //cell的右边有一个小箭头，距离右边有十几像素；
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //设置cell分割线的edge可以设置去除指定cell的分割线
    cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    //tableviewCell点击取消选中变灰效果
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

/*
 //header高度
 - (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
 {
 return 40;
 }
 
 //footer高度
 -(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
 return 40;
 }
 
 //返回每组头标题名称
 -(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
 {
 return @"头";
 }
 
 //返回每组尾部名称
 -(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
 {
 return @"脚";
 }
 
 //自定义头
 - (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
 
 }
 
 //自定义脚
 - (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
 
 }
 */

#pragma mark -- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    点击效果
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //iOS 中获取当前点击的cell
    //非自定义cell
    UITableViewCell *cell = (UITableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    //自定义cell
    //NewsTableViewCell * cell = (NewsTableViewCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"%@",cell);
}

////指定哪些行的 cell 可以进行编辑(UITableViewDataSource 协议方法)
//-  (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (0 == indexPath.row)  {
//        return NO;  /*第一行不能进行编辑*/
//    } else {
//        return YES;
//    }
//}
////指定cell的编辑状态(删除还是插入)(UITableViewDelegate 协议方法)
//- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    /** 不同的行, 可以设置不同的编辑样式, 编辑样式是一个枚举类型 */
//    if (indexPath.row == 0) {
//        return UITableViewCellEditingStyleInsert;
//    } else {
//        return UITableViewCellEditingStyleDelete;
//    }
//}
////选中删除(插入)状态之后操作 (数据源进行更新,cell删除或插入)(UITableViewDataSource的协议方法)
//- (void)tableView :(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    /**   点击 删除 按钮的操作 */
//    if (editingStyle == UITableViewCellEditingStyleDelete) { /**< 判断编辑状态是删除时. */
//
//        /** 1. 更新数据源(数组): 根据indexPaht.row作为数组下标, 从数组中删除数据. */
//        [self.arr removeObjectAtIndex:indexPath.row];
//
//        /** 2. TableView中 删除一个cell. */
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
//    }
//
//    /** 点击 +号 图标的操作. */
//    if (editingStyle == UITableViewCellEditingStyleInsert) { /**< 判断编辑状态是插入时. */
//        /** 1. 更新数据源:向数组中添加数据. */
//        [self.arr insertObject:@"abcd" atIndex:indexPath.row];
//
//        /** 2. TableView中插入一个cell. */
//        [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//
//    }
//}
//
//// 修改编辑按钮文字
//- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return @"删除";
//}


- (void)everyCell {
    [self.tableView.visibleCells enumerateObjectsUsingBlock:^(__kindof UITableViewCell * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        if ([obj isKindOfClass:[RRSeasonTopTableViewCell class]]) {
//            [(RRSeasonTopTableViewCell *)obj showLiveButtonGuideView:[self.view convertRect:obj.contentView.frame toView:self.fatherVC.view]];
//        }
    }];
    
    
    for (UITableViewCell *cell in self.tableView.visibleCells) {
        
    }
     
}
@end
