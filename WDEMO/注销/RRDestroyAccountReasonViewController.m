//
//  RRDestroyAccountReasonViewController.m
//  PUClient
//
//  Created by rrtv on 2020/8/12.
//  Copyright © 2020 RRMJ. All rights reserved.
//

#import "RRDestroyAccountReasonViewController.h"
#import "RRDestroyAccountReasonCell.h"
#import "RRDestroyAccountAlterview.h"

@interface RRDestroyAccountReasonViewController ()<UITableViewDataSource,UITableViewDelegate,UITextViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *dataArray;
@property (nonatomic, assign) NSInteger selectIndex;
@property (nonatomic, assign) UITextView *textView;
@property (nonatomic, assign) CGRect currentTextViewRect;
@property (nonatomic, strong) UIView *footerView;
@property (nonatomic, strong) UIButton *submitbtn;
@end

@implementation RRDestroyAccountReasonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.selectIndex = -1;
    self.dataArray = @[[RRDestroyAccountReasonModel initWithTitle:@"这是个多余的账号" reason:@"这是个多余的账号" type:RRDestroyAccountReasonTypeMoreAccount select:NO],
                       [RRDestroyAccountReasonModel initWithTitle:@"产品性能问题（卡顿、闪退、bug多等）" reason:@"产品性能问题（卡顿、闪退、bug多等）" type:RRDestroyAccountReasonTypeHaveBug select:NO],
                       [RRDestroyAccountReasonModel initWithTitle:@"没找到想看的剧、推荐的剧不喜欢" reason:@"没找到想看的剧、推荐的剧不喜欢" type:RRDestroyAccountReasonTypeNoLike select:NO],
                       [RRDestroyAccountReasonModel initWithTitle:@"其他" reason:@"" type:RRDestroyAccountReasonTypeOther select:NO]
    ];
    
    [self setupViews];
}

- (void)viewWillAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.navigationController.interactivePopGestureRecognizer.delaysTouchesBegan = NO;
}

- (void)viewDidDisappear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)keyboardWillHide:(NSNotification *)notification {

}

- (void)keyboardWillShow:(NSNotification *)notification{
    
}

- (void)keyboardWillChangeFrame:(NSNotification *)notification {
    CGRect rect = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    double duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    /**
     *这个距离是有相对偏移位置 - 屏幕上方空余高度的偏移量
     */
    if ((self.currentTextViewRect.origin.y + self.currentTextViewRect.size.height) >  ([UIScreen mainScreen].bounds.size.height - rect.size.height)) {
        [UIView animateWithDuration:duration animations:^{
            self.tableView.contentOffset = CGPointMake(0, self.currentTextViewRect.origin.y + self.currentTextViewRect.size.height - ([UIScreen mainScreen].bounds.size.height - rect.size.height) + 88);
        }];
    }
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    self.currentTextViewRect = [textView convertRect:textView.frame toView:self.tableView];
    return YES;
}

- (void)setupViews {
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.bottom.offset(0);
        make.top.equalTo(self.view);
    }];
}

- (void)select:(UIButton *)btn {
    [self.view endEditing:YES];
    if (self.selectIndex == btn.tag) {
        return;
    }
    self.selectIndex = btn.tag;
    [self.tableView reloadData];
}

- (void)submit:(UIButton *)btn {
    [self.view endEditing:YES];
    
    
    RRDestroyAccountAlterview *alterview = [[RRDestroyAccountAlterview alloc]initWithFrame:CGRectMake(0, 0, 320, 320)
                                                                                     titel:@"您是否要撤回注销账号申请？"
                                                                                   content: @"该账号注销中，请在24小时内不要登录此账号。点击“是”将登录此账号，并撤回注销申请。"
                                                                                   confirm:@"是"
                                                                                     close:@"否"
                                                                            confirmHandler:^{

    }
                                                                              closeHandler:^{

    }];
    [alterview show];
    
    
    
//    RRDestroyAccountAlterview *alterview = [[RRDestroyAccountAlterview alloc]initWithFrame:CGRectMake(0, 0, 320, 320)
//                                                                                     titel:@"注销申请提交成功"
//                                                                                   content: @"若符合注销要求，我们将在24小时后删除您所有数据。若您在24小时内重新登录，则会默认取消您的注销申请。"
//                                                                                   confirm:@"完成并退出人人视频"
//                                                                                     close:nil
//                                                                            confirmHandler:^{
//
//    }
//                                                                              closeHandler:^{
//
//    }];
//    [alterview show];
    
//        RRDestroyAccountAlterview *alterview = [[RRDestroyAccountAlterview alloc]initWithFrame:CGRectMake(0, 0, 320, 320)
//                                                                                     titel:@"注销申请提交成功"
//                                                                                   content: @"若符合注销要求，我们将在24小时后删除您所有数据。若您在24小时内重新登录，则会默认取消您的注销申请。"
//                                                                                   confirm:nil
//                                                                                     close:@"完成并退出人人视频"
//                                                                            confirmHandler:^{
//
//    }
//                                                                              closeHandler:^{
//
//    }];
//    [alterview show];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == self.dataArray.count - 1) {
        return 46 + 85 ;
    }
    return 46;
}

//返回每行cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    RRDestroyAccountReasonModel *model = [self.dataArray objectOrNilAtIndex:indexPath.row];
    switch (model.type) {
        case RRDestroyAccountReasonTypeOther:{
            RRDestroyAccountReasonTextCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RRDestroyAccountReasonTextCell class]) forIndexPath:indexPath];
            cell.model = model;
            [cell isSelected:(self.selectIndex == indexPath.row ? YES : NO)];
            cell.selectBtn.tag = indexPath.row;
            [cell.selectBtn addTarget:self action:@selector(select:) forControlEvents:UIControlEventTouchUpInside];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            self.textView = cell.textView;
            self.textView.delegate = self;
            return cell;
            
        }
            break;
        default:{
            RRDestroyAccountReasonCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RRDestroyAccountReasonCell class]) forIndexPath:indexPath];
            cell.model = model;
            [cell isSelected:(self.selectIndex == indexPath.row ? YES : NO)];
            cell.selectBtn.tag = indexPath.row;
            [cell.selectBtn addTarget:self action:@selector(select:) forControlEvents:UIControlEventTouchUpInside];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
            break;
    }
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UITableViewHeaderFooterView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"UITableViewHeaderFooterView"];
    UILabel *titleLabel = [headView viewWithTag:111];
    if (!titleLabel) {
        titleLabel = [[UILabel alloc] init];
        titleLabel.tag = 111;
        [headView addSubview:titleLabel];
        
//        titleLabel.font = MEDIUMFONT(24);
        titleLabel.text = @"注销原因";
//        titleLabel.textColor = kCOLOR_dynamicProvider_222222_DADBDC;
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.offset(21);
            make.bottom.offset(-12);
            
        }];
    }
    return headView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[UIView alloc] init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 46.5;
    }
    return 74;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.00001;
}
#pragma mark -- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
}


- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        [_tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"UITableViewHeaderFooterView"];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
        [_tableView registerClass:[RRDestroyAccountReasonCell class] forCellReuseIdentifier:NSStringFromClass([RRDestroyAccountReasonCell class])];
        [_tableView registerClass:[RRDestroyAccountReasonTextCell class] forCellReuseIdentifier:NSStringFromClass([RRDestroyAccountReasonTextCell class])];
        _tableView.tableFooterView = self.footerView;
        
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return _tableView;
}

- (UIView *)footerView {
    if (!_footerView) {
        _footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 75)];
        UIButton *submitbtn =[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//        submitbtn.titleLabel.font = SYSTEMFONT(15);
//        submitbtn.backgroundColor = kCOLOR_dynamicProvider_F2F4F5_2E2E2E;
//        [submitbtn setTitleColor:kCOLOR_dynamicProvider_333333_DADBDC forState:UIControlStateNormal];
        [submitbtn setTitle:@"提交" forState:UIControlStateNormal];
        [submitbtn addTarget:self action:@selector(submit:) forControlEvents:UIControlEventTouchUpInside];
        [_footerView addSubview:submitbtn];
        [submitbtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.offset(21);
            make.trailing.offset(-21);
            make.top.offset(15);
            make.height.offset(45);
        }];
        submitbtn.layer.cornerRadius = 22.5;
        _submitbtn = submitbtn;
    }
    return _footerView;
}
@end
