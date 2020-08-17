//
//  RRDestroyAccountAgreenmentViewController.m
//  PUClient
//
//  Created by rrtv on 2020/8/12.
//  Copyright © 2020 RRMJ. All rights reserved.
//

#import "RRDestroyAccountAgreenmentViewController.h"
#import "RRDestroyAccountContentCell.h"
#import "RRDestroyAccountReasonViewController.h"
//#import "Activity_ViewController.h"
#import "ACMacros.h"
#import <YYKit/YYKit.h>
#import <Masonry/Masonry.h>
@interface RRDestroyAccountAgreenmentViewController ()<UITableViewDataSource,UITableViewDelegate,UITextViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *dataArray;
@property (nonatomic, assign) NSInteger selectIndex;
@property (nonatomic, assign) UITextView *textView;
@property (nonatomic, assign) CGRect currentTextViewRect;
@property (nonatomic, strong) UIView *footerView;
@property (nonatomic, strong) UIButton *submitbtn;

@end

@implementation RRDestroyAccountAgreenmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createData];
    [self setupViews];
}
- (void)createData {
    
//    //用户信息
//    RrmjUser *me = [UserInfoConfig sharedUserInfoConfig].userInfo;
//    NSString * time = me.createTime;
//    NSTimeInterval interval = [time doubleValue] / 1000.0;
//    NSDate *date  = [NSDate dateWithTimeIntervalSince1970:interval];
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateFormat:@"yyyy.MM.dd"];//更改自己想要的时间格式
//    NSString *dateString = [formatter stringFromDate: date];
//
//    NSString *endTimeString = @"无";
//    if (me.vipMedal){
//        endTimeString = [NSString stringWithFormat:@"%@到期",me.vipMedal.endTimeString];
//    }else{
//       endTimeString = @"无";
//    }
    
    NSString *name = @"12312";//me.nickName
    NSString *dateString = @"2020-20-20";//dateString
    NSString *level = [NSString stringWithFormat:@"LV%i",12];//me.level

    NSString *endTimeString = @"2020-20-20";
    NSString *count = [NSString stringWithFormat:@"%i",10];//me.medalList.count
    NSString *achievementCount = @"2";//me.achievementCount

    self.selectIndex = -1;
    self.dataArray = @[[RRDestroyAccountContentModel initWithTitle:@"1.账号信息" detail:@"账号相关信息将被清零，个人资料和历史信息 (包括头像、昵称、浏览记录) 将被清空。" name:name time:dateString level:level type:RRDestroyAccountContentTypeAccountInfo],
                       [RRDestroyAccountContentModel initWithTitle:@"2.账号内财产相关" detail:@"注销后账号内全部权益将被清除，已购买会员等产品将视为自动放弃，请您务必知晓并确认。" name:endTimeString time:count level:achievementCount type:RRDestroyAccountContentTypeMemberInfo],
                       
                       [RRDestroyAccountContentModel initWithTitle:@"3.账号注销后无法找回" detail:@"账号注销后，即使您使用相同的手机号码再次注册，依旧无法找回之前的账号信息，会以新的用户身份进行登录。" name:@"" time:@"" level:@"" type:RRDestroyAccountContentTypeTips],
                       
    ];
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
- (void)next:(UIButton *)btn {
    //注销原因 页面
    RRDestroyAccountReasonViewController *vc = [[RRDestroyAccountReasonViewController alloc]init];
//    [[RRAppLinkManager sharedManager] pushViewController:vc animated:YES];
    [self.navigationController pushViewController:vc animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 200;
    CGFloat height = 0;
    RRDestroyAccountContentModel *data = self.dataArray[indexPath.row];
    height = data.cellHeight;
    return height;
  
}

//返回每行cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    RRDestroyAccountContentModel *model = [self.dataArray objectOrNilAtIndex:indexPath.row];
    
    //    RRDestroyAccountContentCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RRDestroyAccountContentCell class]) forIndexPath:indexPath];
    //    [cell fillWithData:model];
    //    return cell;
    //
    RRDestroyAccountContentInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RRDestroyAccountContentInfoCell class]) forIndexPath:indexPath];
    [cell fillWithData:model];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    //    switch (model.type) {
    //        case RRDestroyAccountContentTypeTips:{
    //
    //            return cell;
    //
    //        }
    //            break;
    //        default:{
    //
    //            return cell;
    //        }
    //            break;
    //    }
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UITableViewHeaderFooterView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"UITableViewHeaderFooterView"];
    UILabel *titleLabel = [headView viewWithTag:111];
    UILabel *tipsLabel = [headView viewWithTag:222];
    
    if (!titleLabel) {
        titleLabel = [[UILabel alloc] init];
        titleLabel.tag = 111;
        [headView addSubview:titleLabel];
        
        titleLabel.font = MEDIUMFONT(24);
        titleLabel.text = @"账号注销";
//        titleLabel.textColor = kCOLOR_dynamicProvider_222222_DADBDC;
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.offset(21);
            make.bottom.offset(-12-14);
            
        }];
    }
    if (!tipsLabel) {
        tipsLabel = [[UILabel alloc] init];
        tipsLabel.tag = 222;
        [headView addSubview:tipsLabel];
        
        tipsLabel.font = MEDIUMFONT(15);
        tipsLabel.text = @"开始注销前请确认以下内容";
        tipsLabel.textColor = kCOLOR_FF617B;
        [tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.offset(21);
            make.top.equalTo(titleLabel.mas_bottom).offset(8);
        }];
    }
    return headView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[UIView alloc] init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 46.5 + 14;
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
        [_tableView registerClass:[RRDestroyAccountContentCell class] forCellReuseIdentifier:NSStringFromClass([RRDestroyAccountContentCell class])];
        [_tableView registerClass:[RRDestroyAccountContentInfoCell class] forCellReuseIdentifier:NSStringFromClass([RRDestroyAccountContentInfoCell class])];
        
        _tableView.tableFooterView = self.footerView;
        
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return _tableView;
}

- (UIView *)footerView {
    if (!_footerView) {
        _footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 200)];
//        _footerView.userInteractionEnabled = YES;
        UIButton *submitbtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        submitbtn.titleLabel.font = SYSTEMFONT(15);
//        submitbtn.backgroundColor = kCOLOR_dynamicProvider_F2F4F5_2E2E2E;
        submitbtn.backgroundColor = kCOLOR_CACBCC;
        [submitbtn setTitleColor:kCOLOR_333333 forState:UIControlStateNormal];
        [submitbtn setTitle:@"下一步" forState:UIControlStateNormal];
        [submitbtn addTarget:self action:@selector(next:) forControlEvents:UIControlEventTouchUpInside];
        [_footerView addSubview:submitbtn];
        [submitbtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.offset(21);
            make.trailing.offset(-21);
            make.top.offset(15);
            make.height.offset(45);
        }];
        submitbtn.layer.cornerRadius = 22.5;
        _submitbtn = submitbtn;
        
        //点击【下一步】即代表你已经同意《账号注销协议》
        CGFloat fontSize = 12.0;
        UIFont *textFont = [UIFont systemFontOfSize:fontSize];
        NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"点击【下一步】即代表你已经同意"];
        text.lineSpacing = 2.5;
        text.font = textFont;
        //设置字体颜色
        text.color = kCOLOR_333333;
        
        
        NSMutableAttributedString *agreenmemt = [[NSMutableAttributedString alloc] initWithString:@"《账号注销协议》"];
        agreenmemt.lineSpacing = 2.5;
        agreenmemt.font = textFont;
        agreenmemt.color = kCOLOR_00BBFF;
        [agreenmemt setTextHighlightRange:agreenmemt.rangeOfAll
                                    color:kCOLOR_00BBFF
                          backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.220]
                                tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
            //自定义代码，此处根据需要调整
            NSLog(@"《账号注销协议》");
//            [self agreement:DestroyAccountAgree];
        }];
        [text appendAttributedString:agreenmemt];
        
     
        CGSize size = CGSizeMake(self.view.frame.size.width - 21 * 2, CGFLOAT_MAX);
        YYTextLayout * layout = [YYTextLayout layoutWithContainerSize:size text:text];
        
        YYLabel *label = [YYLabel new];
        label.frame = CGRectMake(21, 0, 100, 100);
        label.attributedText = text;
        label.textAlignment = NSTextAlignmentCenter;
        label.numberOfLines = 0;
        label.lineBreakMode = NSLineBreakByCharWrapping;
        label.size = layout.textBoundingSize;
        label.textLayout = layout;
        [_footerView addSubview:label];
        label.center = CGPointMake(_submitbtn.center.x, _submitbtn.center.y + 48);
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_submitbtn.mas_bottom).offset(22.5);
            make.centerX.equalTo(_submitbtn.mas_centerX);
         }];
    
    }
    return _footerView;
}


- (void)agreement:(NSString *)urlStr {
//    NSString *url = urlStr;
//    Activity_ViewController *next = [[Activity_ViewController alloc] init];
//    next.targetUrl = url;
//    [[RRAppLinkManager sharedManager] pushViewController:next animated:YES];
}
@end
