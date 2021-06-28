//
//  ListEditViewController.m
//  WDEMO
//
//  Created by rrtv on 2021/1/9.
//  Copyright © 2021 wwc. All rights reserved.
//

#import "ListEditViewController.h"
#import <YYKit/YYKit.h> 
#import "ListModelCell.h"
#import "ListModel.h"
//编辑bar
#import "UserEditBar.h"
#import "ACMacros.h"
#import "ChatHeader.h"
#import <Masonry/Masonry.h>

@interface ListEditViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, assign) BOOL isUserEditState;//编辑状态
@property(nonatomic, copy) NSArray *data;
@property(nonatomic, strong) UserEditBar *userEditBar;
@property(nonatomic, strong) NSMutableSet *deleteArray;
@property(nonatomic, strong) UIButton *leftBtn;
@property(nonatomic, strong) UIButton *rightBtn;
@end

@implementation ListEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self createData];
    [self setupViews];
    
    //编辑按钮
    self.rightBtn.hidden = !(self.data.count > 0);
    
    //    UINavigationBar与UITabBar半透明：会被遮挡；不透明，不会被遮挡
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    //**************************************************************************
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    
    //xib cell
    //    [self.tableView registerNib:[UINib nibWithNibName:@"WTableViewCell" bundle:nil] forCellReuseIdentifier:@"WTableViewCell"];
    
    //codecell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    
    //codecell
    [self.tableView registerClass:[WTableViewCell class] forCellReuseIdentifier:NSStringFromClass([WTableViewCell class])];
    [self.tableView registerClass:[ListModelCell class] forCellReuseIdentifier:NSStringFromClass([ListModelCell class])];

    
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
    self.tableView.frame = self.view.bounds;
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.top.bottom.equalTo(self.view);
    }];
   
    
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
     
    CGFloat bottom = 0;
    if (@available(iOS 11.0, *)) {
        CGFloat a =  [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom;
        NSLog(@"%f",a);
        bottom = a;
    } else {
        bottom = 0;
    }
    
//    //deleteArray
//    self.deleteArray = [NSMutableSet set];
    //bar
    [self.view addSubview:self.userEditBar];
    [self.userEditBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.bottom.equalTo(self.view);
//        make.height.equalTo(@(40 + bottom));
        make.height.equalTo(@(53));
    }];
}

- (void)createData {
    NSArray *array = @[
        [ListModel initWithTitle:@"000000" detail:@"编辑简单的列表0" type:ListModelTypeNone ids:@"0"],
        [ListModel initWithTitle:@"111111" detail:@"编辑简单的列表1" type:ListModelTypeNone ids:@"1"],
        [ListModel initWithTitle:@"222222" detail:@"编辑简单的列表2" type:ListModelTypeNone ids:@"2"],
        [ListModel initWithTitle:@"333333" detail:@"编辑简单的列表3" type:ListModelTypeNone ids:@"3"],
        [ListModel initWithTitle:@"444444" detail:@"编辑简单的列表4" type:ListModelTypeNone ids:@"4"],
        [ListModel initWithTitle:@"555555" detail:@"编辑简单的列表5" type:ListModelTypeNone ids:@"5"],
        [ListModel initWithTitle:@"666666" detail:@"编辑简单的网格6" type:ListModelTypeNone ids:@"6"],
        [ListModel initWithTitle:@"777777" detail:@"编辑简单的网格7" type:ListModelTypeNone ids:@"7"],
        [ListModel initWithTitle:@"888888" detail:@"编辑简单的网格8" type:ListModelTypeNone ids:@"8"],
        [ListModel initWithTitle:@"999999" detail:@"编辑简单的网格9" type:ListModelTypeNone ids:@"9"],
        [ListModel initWithTitle:@"10" detail:@"编辑简单的网格10" type:ListModelTypeNone ids:@"10"],
        [ListModel initWithTitle:@"11" detail:@"编辑简单的网格11" type:ListModelTypeNone ids:@"11"],
        [ListModel initWithTitle:@"12" detail:@"编辑简单的网格12" type:ListModelTypeNone ids:@"12"],
        [ListModel initWithTitle:@"13" detail:@"编辑简单的网格13" type:ListModelTypeNone ids:@"13"],
        [ListModel initWithTitle:@"14" detail:@"编辑简单的网格14" type:ListModelTypeNone ids:@"14"],
        [ListModel initWithTitle:@"15" detail:@"编辑简单的网格15" type:ListModelTypeNone ids:@"15"],
        [ListModel initWithTitle:@"16" detail:@"编辑简单的网格16" type:ListModelTypeNone ids:@"16"],
        [ListModel initWithTitle:@"17" detail:@"编辑简单的网格17" type:ListModelTypeNone ids:@"17"],
        [ListModel initWithTitle:@"18" detail:@"编辑简单的网格18" type:ListModelTypeNone ids:@"18"],
        [ListModel initWithTitle:@"19" detail:@"编辑简单的网格19" type:ListModelTypeNone ids:@"19"],

    ];
    self.data = array;
//    NSSet
//    self.deleteArray = [NSMutableSet set];
//    [self.deleteArray addObject:@"1"];
//    [self.deleteArray addObject:@"2"];
//    [self.deleteArray addObject:@"3"];
//    [self.deleteArray addObject:@"===="];
//    [self.deleteArray addObject:@"1"];
//    [self.deleteArray removeObject:@"4"];
//    [self.deleteArray removeObject:@"2"];
//    NSLog(@"%@",self.deleteArray);
}

- (void)setupViews {
    [self createNavLeftBtn];
    [self createNavRightBtn];
}

- (void)goPlayerVC:(UIButton *)sender {

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
    //UITableViewCell
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    
    //WTableViewCell
//    WTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([WTableViewCell class]) forIndexPath:indexPath];
//    //    cell.firstLabel.text = [NSString stringWithFormat:@"section = %zi", indexPath.section];
//    //    cell.secondLabel.text = [NSString stringWithFormat:@"row = %zi", indexPath.row];
//    cell.xibLab.text = [NSString stringWithFormat:@"section = %zi ,row = %zi", indexPath.section, indexPath.row];
    
    //ListModelCell
    ListModelCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ListModelCell class]) forIndexPath:indexPath];
    //    ListModel *listModel = self.data[indexPath.row];
    ListModel *listModel = [self.data objectOrNilAtIndex:indexPath.row];
    cell.isUserEditState = self.isUserEditState;
    [cell fillWithData:listModel];

     
//    //cell的右边有一个小箭头，距离右边有十几像素；
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    //设置cell分割线的edge可以设置去除指定cell的分割线
//    cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
//    //tableviewCell点击取消选中变灰效果
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;

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
    //点击效果
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //iOS 中获取当前点击的cell
    //非自定义cell
    UITableViewCell *cell = (UITableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    //自定义cell
    //NewsTableViewCell * cell = (NewsTableViewCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"%@",cell);
    
    if (self.isUserEditState) {
        ListModel *listModel = [self.data objectOrNilAtIndex:indexPath.row];
        listModel.isSelected = !listModel.isSelected;
        NSString *modelId = listModel.ids;
        if (listModel.isSelected) {
            [self.deleteArray addObject:modelId];
        } else {
            [self.deleteArray removeObject:modelId];
        }
        //更新
//        [self.tableView reloadData];
        //更新一行
//        [tableView reloadRow:indexPath.row inSection:indexPath.section withRowAnimation:UITableViewRowAnimationNone];
        //更新某些行（可以是一行可以是指定的多行）
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        [self updateUserEditBar];

    } else {
        UIViewController *vc = [[UIViewController alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

////iOS8之后
 -  (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return !self.isUserEditState;

}
////滑动删除功能
- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewRowAction *AddAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"添加" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        // 实现相关的逻辑代码
        // ...
        // 在最后希望cell可以自动回到默认状态，所以需要退出编辑模式
        tableView.editing = NO;
    }];
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
//        // 首先改变model
//        [arrDate removeObjectAtIndex:indexPath.row];
//        // 接着刷新view
//        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//        // 不需要主动退出编辑模式，上面更新view的操作完成后就会自动退出编辑模式
    }];
    
    return @[deleteAction, AddAction,];
}
//————————————————
//版权声明：本文为CSDN博主「Arnly」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
//原文链接：https://blog.csdn.net/arnly/article/details/51459198

//iOS11新增了方法
- (UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath API_AVAILABLE(ios(11.0)){
    if (@available(iOS 11.0, *)) {
        
        NSString *title = @"置顶";
        if (indexPath.section == 0) {
            title = @"取消置顶";
        } else {
            title = @"置顶";
        }
        UIContextualAction *topAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleNormal title:title handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
            
//            ...
            
            // 这句很重要，退出编辑模式，隐藏左滑菜单
            [tableView setEditing:NO animated:YES];
            completionHandler(true);
        }];
        
        UIContextualAction *deleteAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleDestructive title:@"删除" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
            
            // 这句很重要，退出编辑模式，隐藏左滑菜单
            [tableView setEditing:NO animated:YES];
            completionHandler(true);
        }];
        
        UISwipeActionsConfiguration *actions = [UISwipeActionsConfiguration configurationWithActions:@[deleteAction,topAction]];
        // 禁止侧滑无线拉伸
        actions.performsFirstActionWithFullSwipe = NO;
        return actions;
    }else{
        return nil;
    }
}
//iOS11解决UITableView侧滑删除无限拉伸的方法
//原文链接：https://www.jb51.net/article/145243.htm

////---------------------------------------------------------
////iOS8之前
////滑动删除功能
////指定哪些行的 cell 可以进行编辑(UITableViewDataSource 协议方法)
//-  (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
//{
////    if (0 == indexPath.row)  {
////        return NO;  /*第一行不能进行编辑*/
////    } else {
////        return YES;
////    }
//
//    return !self.isUserEditState;
//
//}
//
////指定cell的编辑状态(删除还是插入)(UITableViewDelegate 协议方法)
//- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
//{
////    /** 不同的行, 可以设置不同的编辑样式, 编辑样式是一个枚举类型 */
////    if (indexPath.row == 0) {
////        return UITableViewCellEditingStyleInsert;
////    } else {
//        return UITableViewCellEditingStyleDelete;
////    }
//}
////选中删除(插入)状态之后操作 (数据源进行更新,cell删除或插入)(UITableViewDataSource的协议方法)
//- (void)tableView :(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    /**   点击 删除 按钮的操作 */
//    if (editingStyle == UITableViewCellEditingStyleDelete) { /**< 判断编辑状态是删除时. */
//
////        /** 1. 更新数据源(数组): 根据indexPaht.row作为数组下标, 从数组中删除数据. */
////        [self.data removeObjectAtIndex:indexPath.row];
////
////        /** 2. TableView中 删除一个cell. */
////        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
//
//
//        ListModel *listModel = [self.data objectOrNilAtIndex:indexPath.row];
//
//        NSMutableArray *temp = [NSMutableArray array];
//        NSLog(@"%@",temp);
//        for(int i = 0; i < self.data.count; i++) {
//            ListModel *obj = self.data[i];
//            NSString *modelId = obj.ids;
//            if (![listModel.ids isEqualToString:modelId]) {
//                [temp addObject:obj];
//            }
//        }
//        self.data = [NSArray arrayWithArray:temp];
//        [self.tableView reloadData];
//
//    }
//
////    /** 点击 +号 图标的操作. */
////    if (editingStyle == UITableViewCellEditingStyleInsert) { /**< 判断编辑状态是插入时. */
////        /** 1. 更新数据源:向数组中添加数据. */
////        [self.arr insertObject:@"abcd" atIndex:indexPath.row];
////
////        /** 2. TableView中插入一个cell. */
////        [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
////
////    }
//}
//// 修改编辑按钮文字
//- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return @"删除";
//}
////---------------------------------------------------------

//轮训
- (void)everyCell {
    [self.tableView.visibleCells enumerateObjectsUsingBlock:^(__kindof UITableViewCell * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //        if ([obj isKindOfClass:[RRSeasonTopTableViewCell class]]) {
        //            [(RRSeasonTopTableViewCell *)obj showLiveButtonGuideView:[self.view convertRect:obj.contentView.frame toView:self.fatherVC.view]];
        //        }
    }];
     
    for (UITableViewCell *cell in self.tableView.visibleCells) {
        
    }
}

- (void)createNavLeftBtn {
    UIButton *leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    //    leftBtn.backgroundColor = [UIColor cyanColor];
    //    [leftBtn setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [leftBtn setTitle:@"left" forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(clickLeftBtn:)forControlEvents:UIControlEventTouchUpInside];
    
    //    leftBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -20,0, 0);
    //    leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -15,0, 0);
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    UIBarButtonItem *itemSpace = [[UIBarButtonItem alloc]
                                  initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                  target:nil
                                  action:nil];
    itemSpace.width = -12.0;
    self.navigationItem.leftBarButtonItems =@[itemSpace, leftItem];
    
    self.leftBtn = leftBtn;
}

- (void)createNavRightBtn {
    UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    //    rightBtn.backgroundColor = [UIColor cyanColor];
    //    [rightBtn setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [rightBtn setTitle:@"编辑" forState:UIControlStateNormal];
    [rightBtn setTitle:@"取消" forState:UIControlStateSelected];

    [rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(clickRightBtn:)forControlEvents:UIControlEventTouchUpInside];
    
    //    rightBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -20,0, 0);
    //    rightBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -15,0, 0);
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    UIBarButtonItem *itemSpace = [[UIBarButtonItem alloc]
                                  initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                  target:nil
                                  action:nil];
    itemSpace.width = -12;
    self.navigationItem.rightBarButtonItems =@[itemSpace, rightItem];
    
    self.rightBtn = rightBtn;
}

- (void)clickLeftBtn:(UIButton *)btn {
    NSLog(@"left");
    [self.navigationController popViewControllerAnimated:YES];
}

///结束编辑
- (void)endEdit {
//    if ([self.delegate respondsToSelector:@selector(bingeWatchingViewControllerEndEdit)]) {
//        [self.delegate bingeWatchingViewControllerEndEdit];
//    } else {
//        self.isUserEditing = NO;
//    }
    self.isUserEditState = NO;
    self.rightBtn.selected = NO;
}

- (void)setIsUserEditState:(BOOL)isUserEditState {
    _isUserEditState = isUserEditState;
    
    //数据处理
    [self isSelectedAll:NO];
    [self.deleteArray removeAllObjects];
    [self.tableView reloadData];
   
    //bar
    self.userEditBar.hidden = !isUserEditState;
//    [self updateUserEditBar];
    [self.userEditBar reset];
    
    //编辑状态
    if (self.isUserEditState) {
        //头和脚要隐藏
//        [self removeHeaderAndFooter];
    } else {
        //头和脚要恢复
        //如果数据不满一页还需请求数据
//        [self addHeaderAndFooter];
    }
}

//点击编辑按钮
- (void)clickRightBtn:(UIButton *)btn {
    NSLog(@"right");
    BOOL isSelect = !btn.isSelected;
    btn.selected = isSelect;
    self.isUserEditState = isSelect;
}

//全选/取消全选
- (void)isSelectedAll:(BOOL)isSelected  {
    [self.data enumerateObjectsUsingBlock:^(ListModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.isSelected = isSelected;
        NSString *modelId = obj.ids ?: @"";
        if (isSelected) {
            [self.deleteArray addObject:modelId];
        } else {
            [self.deleteArray removeObject:modelId];
        }
    }];
}

//更新EditBar状态
- (void)updateUserEditBar {
    //全选
    BOOL isAllSelected = self.deleteArray.count > 0 && self.deleteArray.count == self.data.count;
//    BOOL isAllSelected = self.deleteArray.count == self.data.count;
    NSInteger count = self.deleteArray.count;
    [self.userEditBar isAllSelected:isAllSelected];
    [self.userEditBar deleteCount:count];

//    self.deleteView.allBtn.selected = isSelected;
//    if (self.deleteArray.count) {
//        self.deleteView.delBtn.enabled = YES;
//        [self.deleteView.delBtn setTitle:[NSString stringWithFormat:@"删除(%ld)",(long)self.deleteArray.count] forState:UIControlStateNormal];
//    } else {
//        self.deleteView.delBtn.enabled = NO;
//        [self.deleteView.delBtn setTitle:@"删除" forState:UIControlStateNormal];
//    }
}

- (UserEditBar *)userEditBar {
    if (!_userEditBar) {
        _userEditBar = [[UserEditBar alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 53)];
        _userEditBar.backgroundColor = [UIColor lightGrayColor];
        _userEditBar.hidden = YES;
//        [self.view addSubview:_userEditBar];
        WS(weakSelf)
        _userEditBar.selectClick = ^(BOOL isAll) {
            [weakSelf isSelectedAll:isAll];
            [weakSelf.tableView reloadData];
            [weakSelf updateUserEditBar];
        };
        _userEditBar.deleteClick = ^{
            //删除操作
            [weakSelf delete];
        };
    }
    return _userEditBar;
}

- (void)delete {
    if (self.deleteArray.count > 0) {
        //转成 NSString
        NSArray *tempArray = [self.deleteArray allObjects];
        NSString *tempString = [tempArray componentsJoinedByString:@","];//分隔符逗号
        NSLog(@"%@", tempString);
        //请求接口
        /*
         请求接口
         请求接口
         请求接口
         */
        NSMutableArray *temp = [NSMutableArray array];
        NSLog(@"%@",temp);
        for(int i = 0; i < self.data.count; i++) {
            ListModel *obj = self.data[i];
            NSString *modelId = obj.ids;
            if (![self.deleteArray containsObject:modelId]) {
                [temp addObject:obj];
            }
        }
        
        self.data = [NSArray arrayWithArray:temp];
        [self.tableView reloadData];
        //退出编辑模式
        [self endEdit];
        
        //小于一个 请求数据
        if (self.data.count < 1) {
//            [self refreshData];
        }
    }
}

- (NSMutableSet *)deleteArray {
    if (!_deleteArray) {
        _deleteArray = [NSMutableSet set];
    }
    return _deleteArray;
}

@end
