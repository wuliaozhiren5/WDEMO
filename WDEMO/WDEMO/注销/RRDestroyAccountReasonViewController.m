//
//  RRDestroyAccountReasonViewController.m
//  PUClient
//
//  Created by rrtv on 2020/8/12.
//  Copyright © 2020 RRMJ. All rights reserved.
//

#import "RRDestroyAccountReasonViewController.h"
#import "RRDestroyAccountReasonCell.h"
#import "RRDestroyAccountAlertView.h"
//#import "UIImage+GradientColor.h"//渐变色
#import "ACMacros.h"
#import <YYKit/YYKit.h>
#import <Masonry/Masonry.h>
@interface RRDestroyAccountReasonViewController ()<UITableViewDataSource,UITableViewDelegate,UITextViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *dataArray;
@property (nonatomic, assign) NSInteger selectIndex;
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, assign) CGRect currentTextViewRect;
@property (nonatomic, strong) UIView *footerView;
@property (nonatomic, strong) UIButton *submitbtn;
@property (nonatomic, strong) UILabel *placeholderLabel;
@property (nonatomic, strong) UILabel *numLabel;
@property (nonatomic, copy) NSString *placeholderStr;
@end

@implementation RRDestroyAccountReasonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createData];
    [self setupViews];
    
    
    //    UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 200, 320, 320)];
    //    textView.backgroundColor= [UIColor grayColor];
    //     [self.view addSubview:textView];
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
    [self.view endEditing:YES];
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

- (void)createData {
    self.selectIndex = -1;
    self.placeholderStr = @"请描述您的注销原因";
    self.dataArray = @[[RRDestroyAccountReasonModel initWithTitle:@"这是个多余的账号" reason:@"这是个多余的账号" type:RRDestroyAccountReasonTypeMoreAccount select:NO],
                       [RRDestroyAccountReasonModel initWithTitle:@"产品性能问题（卡顿、闪退、bug多等）" reason:@"产品性能问题（卡顿、闪退、bug多等）" type:RRDestroyAccountReasonTypeHaveBug select:NO],
                       [RRDestroyAccountReasonModel initWithTitle:@"没找到想看的剧、推荐的剧不喜欢" reason:@"没找到想看的剧、推荐的剧不喜欢" type:RRDestroyAccountReasonTypeNoLike select:NO],
                       [RRDestroyAccountReasonModel initWithTitle:@"其他" reason:@"" type:RRDestroyAccountReasonTypeOther select:NO]
    ];
    
}
- (void)setupViews {
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.bottom.offset(0);
        make.top.equalTo(self.view);
    }];
}

- (void)clickSelectBtn:(UIButton *)btn {
    [self updateWithSelectIndex:btn.tag];
}
 
- (void)clickTitleLab:(UITapGestureRecognizer *)sender {
    UIView *view = sender.view;
    [self updateWithSelectIndex:view.tag];
}

- (void)updateWithSelectIndex:(NSInteger)selectIndex {
     [self.view endEditing:YES];
     if (self.selectIndex == selectIndex) {
         return;
     }
     self.selectIndex = selectIndex;
     [self.tableView reloadData];
    
     [self setEnabledGradientColor];
}

- (void)submit:(UIButton *)btn {
    
    if (self.selectIndex < 0) {
        return;
    }
    [self.view endEditing:YES];
    RRDestroyAccountReasonModel *model = [self.dataArray objectOrNilAtIndex:self.selectIndex];
    
    //    switch (model.type) {
    //        case <#constant#>:
    //            <#statements#>
    //            break;
    //
    //        default:
    //            break;
    //    }
    //
    //去除空格
    NSString *sp = [self.textView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if (sp.length == 0) {
        //        TOAST(@"不能发送空白消息");
    } else if (sp.length > 50) {
        //大于100字
        //        TOAST(@"最多可输入100个字");
    } else {
        //发送消息
    }
    
    
    RRDestroyAccountAlertView *alterview = [[RRDestroyAccountAlertView alloc]initWithFrame:CGRectMake(0, 0, 320, 320)
                                                                                     titel:@"注销申请提交成功"
                                                                                   content: @"若符合注销要求，我们将在24小时后删除您所有数据。若您在24小时内重新登录，则会默认取消您的注销申请。"
                                                                                   confirm:@"完成并退出视频"
                                                                                     close:nil
                                                                            confirmHandler:^{
        
    }
                                                                              closeHandler:^{}];
    [alterview show];
    
    
}

- (void)showAlter1{
    __weak __typeof(self)weakself = self;
    RRDestroyAccountAlertView *alterview = [[RRDestroyAccountAlertView alloc]initWithFrame:CGRectMake(0, 0, 320, 320)
                                                                                     titel:@"您是否要撤回注销账号申请？"
                                                                                   content:@"该账号注销中，请在24小时内不要登录此账号。点击“是”将登录此账号，并撤回注销申请。"
                                                                                   confirm:@"是"
                                                                                     close:@"否"
                                                                            confirmHandler:^{}
                                                                              closeHandler:^{}];
    [alterview show];
}

- (void)showAlter{
    __weak __typeof(self)weakself = self;
    RRDestroyAccountAlertView *alterview = [[RRDestroyAccountAlertView alloc]initWithFrame:CGRectMake(0, 0, 320, 320)
                                                                                     titel:@"注销申请提交成功"
                                                                                   content: @"若符合注销要求，我们将在24小时后删除您所有数据。若您在24小时内重新登录，则会默认取消您的注销申请。"
                                                                                   confirm:@"完成并退出视频"
                                                                                     close:nil
                                                                            confirmHandler:^{
        //退出登录，并且关闭app
        
    }
                                                                              closeHandler:^{}];
    [alterview show];
}

////按钮渐变色
//- (void)setDisabledGradientBackColor {
//    UIColor *topColor = kCOLOR_CACBCC;
//    UIColor *bottomColor = kCOLOR_DADBDC;
//    CGSize size = _submitbtn.frame.size;
//    UIImage *bgImg = [UIImage gradientColorImageFromColors:@[topColor, bottomColor] gradientType:GradientTypeLeftToRight imgSize:size];
//    _submitbtn.backgroundColor = [UIColor colorWithPatternImage:bgImg];
//
//}
//
////按钮渐变色
//- (void)setEnabledGradientColor {
//    UIColor *topColor = kCOLOR_00D5FF;
//    UIColor *bottomColor = kCOLOR_00BBFF;
//    CGSize size = _submitbtn.frame.size;
//    UIImage *bgImg = [UIImage gradientColorImageFromColors:@[topColor, bottomColor] gradientType:GradientTypeLeftToRight imgSize:size];
//    _submitbtn.backgroundColor = [UIColor colorWithPatternImage:bgImg];
//

//}

//按钮渐变色
- (void)setDisabledGradientBackColor {
//    UIColor *topColor = kCOLOR_CACBCC;
//    UIColor *bottomColor = kCOLOR_DADBDC;

    _submitbtn.backgroundColor = kCOLOR_CACBCC;
}
//按钮渐变色
- (void)setEnabledGradientColor {
//    UIColor *topColor = kCOLOR_00D5FF;
//    UIColor *bottomColor = kCOLOR_00BBFF;
 
    _submitbtn.backgroundColor = kCOLOR_00D5FF;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == self.dataArray.count - 1 && indexPath.row == self.selectIndex) {
        return 46 + 12 + 85 ;
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
            cell.titleLab.tag = indexPath.row;
            [cell.selectBtn addTarget:self action:@selector(clickSelectBtn:) forControlEvents:UIControlEventTouchUpInside];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            self.textView = cell.textView;
            self.textView.delegate = self;
            self.numLabel = cell.numLabel;
            self.placeholderLabel = cell.placeholderLabel;
            [self textViewDidChange:self.textView];
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickTitleLab:)];
            tapGesture.numberOfTapsRequired = 1;
            [cell.titleLab addGestureRecognizer:tapGesture];
            return cell;
        }
            break;
        default:{
            RRDestroyAccountReasonCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RRDestroyAccountReasonCell class]) forIndexPath:indexPath];
            cell.model = model;
            [cell isSelected:(self.selectIndex == indexPath.row ? YES : NO)];
            cell.selectBtn.tag = indexPath.row;
            cell.titleLab.tag = indexPath.row;
            [cell.selectBtn addTarget:self action:@selector(clickSelectBtn:) forControlEvents:UIControlEventTouchUpInside];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickTitleLab:)];
            tapGesture.numberOfTapsRequired = 1;
            [cell.titleLab addGestureRecognizer:tapGesture];
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
        
        titleLabel.font = MEDIUMFONT(24);
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
#pragma mark - UITextViewDelegate
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    self.currentTextViewRect = [textView convertRect:textView.frame toView:self.tableView];
    return YES;
}

-(void)textViewDidChange:(UITextView *)textView {
    if (textView.text.length == 0) {
        self.placeholderLabel.text = _placeholderStr;
    }else{
        self.placeholderLabel.text = @"";
    }
    
    //    NSString  *nsTextContent = textView.text;
    //    NSInteger existTextNum = nsTextContent.length;
    //
    //    if (textView.markedTextRange == nil) {
    //        // 没有预输入文字
    //        if (existTextNum > 50){
    //            //截取到最大位置的字符
    //            NSString *s = [nsTextContent substringToIndex:50];
    //            [textView setText:s];
    //        }
    //    }
    NSString  *nsTextContent = textView.text;
    NSInteger existTextNum = nsTextContent.length;
    if (textView.markedTextRange == nil) {
        // 没有预输入文字
        NSInteger num = 50 - existTextNum;
        self.numLabel.text = [NSString stringWithFormat:@"%ld",(long)num];
        if (num >= 0) {
            self.numLabel.textColor = kCOLOR_CACBCC;
        } else {
            self.numLabel.textColor = kCOLOR_FF617B;
        }
    }
    
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
        UIButton *submitbtn =[[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width -21 * 2, 45)];
        submitbtn.titleLabel.font = SYSTEMFONT(15);
        //        submitbtn.backgroundColor = kCOLOR_dynamicProvider_F2F4F5_2E2E2E;
        submitbtn.backgroundColor = kCOLOR_CACBCC;
        [submitbtn setTitleColor:kCOLOR_FFFFFF forState:UIControlStateNormal];
        submitbtn.layer.cornerRadius = 22.5;
        [submitbtn setTitle:@"提交" forState:UIControlStateNormal];
        [submitbtn addTarget:self action:@selector(submit:) forControlEvents:UIControlEventTouchUpInside];
        [_footerView addSubview:submitbtn];
        [submitbtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.offset(21);
            make.trailing.offset(-21);
            make.top.offset(15);
            make.height.offset(45);
        }];
        _submitbtn = submitbtn;
        [self setDisabledGradientBackColor];
    }
    return _footerView;
}
@end
