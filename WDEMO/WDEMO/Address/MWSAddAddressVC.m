//
//  MWSAddAddressVC.m
//  MoWanShang
//
//  Created by rrtv on 2022/5/18.
//

#import "MWSAddAddressVC.h"

#import "MWSContactsCell.h"
#import "MWSPhoneNumberCell.h"
#import "MWSSelectRegionCell.h"
#import "MWSDetailedAddressCell.h"
#import "MWSZipCodeCell.h"

#import "MWSProvinceVC.h"

#import "MWSAddAddressApi.h"

@interface MWSAddAddressVC ()<UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate> 
//, UITextViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
//联系人
@property (nonatomic, strong) UITextField *contactsTextField;
//手机号码
@property (nonatomic, strong) UITextField *phoneNumberTextField;
//选择地区
@property (nonatomic, strong) UITextField *selectRegionTextField;
//邮政编码
@property (nonatomic, strong) UITextField *zipCodeTextField;
//详细地址
@property (nonatomic, strong) UITextView  *detailedAddressTextView;
//保存按钮
@property (nonatomic, strong) UIButton  *saveBtn;
//省
@property (nonatomic, copy) NSString *provinceName;
//市
@property (nonatomic, copy) NSString *cityName;
//区
@property (nonatomic, copy) NSString *areaName;

@end

@implementation MWSAddAddressVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //    self.navigationBarView.titleLabel.text = @"选择地址";
//    self.navigationBarView.titleLabel.text = @"添加地址";
//    self.navigationBarView.leftButton.hidden = NO;
    //    [self createOpenData];
    [self setupViews];
    
    //键盘将要显示时候的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(boardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    //键盘将要结束时候的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(boardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    
//    self.contactsTextField.text = @"xxx";
//    self.phoneNumberTextField.text = @"190 9090 9009";
//    self.selectRegionTextField.text = @"买买买 买买买 买买买";
//    self.zipCodeTextField.text = @"600000";
//    self.detailedAddressTextView.text = @"xx街道 xx路 xx弄 xx号 xxx室";
 
}

-(void)boardWillShow:(NSNotification *)sender{
    //获得键盘的尺寸
    CGRect keyBoardRect=[sender.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    //当键盘将要显示时，将tableView的下边距增跟改为键盘的高度
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, keyBoardRect.size.height, 0);
}

-(void)boardDidHide:(NSNotification *)sender{
    //当键盘将要消失时，边距还原初始状态 1
    self.tableView.contentInset = UIEdgeInsetsZero;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    //取消当前输入框的第一响应者
    [textField resignFirstResponder];
    [self updateSaveBtnStatus];
    return YES;
}
 
- (void)setupViews {
    
//    [self addRightBtn];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.saveBtn];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.navigationBarView.mas_bottom).offset(0);
        make.top.equalTo(@0);

        make.bottom.equalTo(@0);
        make.leading.equalTo(@0);
        make.trailing.equalTo(@0);
    }];
    
    [self.saveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@(appMargin().bottom - 25));
        make.leading.equalTo(@16);
        make.trailing.equalTo(@-16);
        make.height.equalTo(@45);

    }];
}

//- (void)addRightBtn {
//    UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
//    [rightBtn addTarget:self action:@selector(clickRightBtn:) forControlEvents:UIControlEventTouchUpInside];
//    [rightBtn setTitle:@"添加" forState:UIControlStateNormal];
//    rightBtn.titleLabel.font = [UIFont systemFontOfSize:14];
////    rightBtn.backgroundColor = [UIColor clearColor];
////    [rightBtn setImage:[UIImage imageNamed:@"ic_back"] forState:UIControlStateNormal];
////    [rightBtn setImage:[UIImage imageNamed:@"ic_back"] forState:UIControlStateSelected];
////    [rightBtn setImage:[UIImage imageNamed:@"ic_back"] forState:UIControlStateHighlighted];
//    [self.navigationBarView addSubview:rightBtn];
////    _leftButton = leftButton;
//    [rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.trailing.equalTo(@-12);
//        make.top.equalTo(@(statusMarginToTop()));
//        make.width.mas_equalTo(41);
//        make.height.mas_equalTo(41);
//    }];
//}
//
//- (void)clickRightBtn:(UIButton *)btn {
////    [self backButtonClick];
//    //添加
//    NSLog(@"添加");
//}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger row = indexPath.row;
    switch (row) {
        case 3:
            return 80;
            break;
        default:
            return 60;
            break;
    }
    
}
////header高度
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return 0.0;
//}
//
////footer高度
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    return 0.0;
//}
//
////自定义头
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    return [[UIView alloc] init];
//}
//
////自定义脚
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//    return [[UIView alloc] init];
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //        UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    //        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //        cell.textLabel.text = @"选择地址";
    //        return cell;
    NSInteger row = indexPath.row;
    switch (row) {
        case 0:
        {
            MWSContactsCell *cell = (MWSContactsCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MWSContactsCell class]) forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.textField.delegate = self;
            self.contactsTextField = cell.textField;
            return cell;
        }
            break;
        case 1:
        {
            MWSPhoneNumberCell *cell = (MWSPhoneNumberCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MWSPhoneNumberCell class]) forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.textField.delegate = self;
            self.phoneNumberTextField = cell.textField;
            return cell;
        }
            break;
        case 2:
        {
            MWSSelectRegionCell *cell = (MWSSelectRegionCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MWSSelectRegionCell class]) forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.textField.delegate = self;
            self.selectRegionTextField = cell.textField;
            return cell;
        }
            break;
        case 3:
        {
            MWSDetailedAddressCell *cell = (MWSDetailedAddressCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MWSDetailedAddressCell class]) forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
//            cell.textView.delegate = self;
            self.detailedAddressTextView = cell.textView;
            return cell;
        }
            break;
        case 4:
        {
            MWSZipCodeCell *cell = (MWSZipCodeCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MWSZipCodeCell class]) forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.textField.delegate = self;
            self.zipCodeTextField = cell.textField;
            return cell;
        }
            break;
        default:
        {
            UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.textLabel.text = @"选择地址";
            return cell;
             
        }
            break;
    }
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.view endEditing:YES];
    [self updateSaveBtnStatus];
    
    NSInteger row = indexPath.row;
    switch (row) {
        case 2:
        {
            @weakify(self)
            MWSProvinceVC *vc = [[MWSProvinceVC alloc] init];
            vc.ctiyBlock = ^(NSString * _Nonnull provinceName, NSString * _Nonnull cityName, NSString * _Nonnull areaName) {
                @strongify(self);
                
                self.provinceName = provinceName;
                self.cityName = cityName;
                self.areaName = areaName;

                NSString *cityStr = [NSString stringWithFormat:@"%@ %@ %@", provinceName, cityName, areaName];
                self.selectRegionTextField.text = cityStr;
            };
            
//            [[MWSLinkManager sharedManager] pushViewController:vc animated:YES];
         [self.navigationController pushViewController:vc animated:YES];

            
//            MWSCityVC *vc1 = [[MWSCityVC alloc] init];
//            [[MWSLinkManager sharedManager] pushViewController:vc1 animated:YES];
//            MWSAreaVC *vc2 = [[MWSAreaVC alloc] init];
//            [[MWSLinkManager sharedManager] pushViewController:vc2 animated:YES];
        }
            break;
        default:
            break;
    }
}

#pragma mark -- UIScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
    [self updateSaveBtnStatus];
}

- (void)updateSaveBtnStatus {
    NSString *name = self.contactsTextField.text;
    NSString *phone = self.phoneNumberTextField.text;
    NSString *area = self.selectRegionTextField.text;
    NSString *address = self.detailedAddressTextView.text;
    NSString *zipCode = self.zipCodeTextField.text;
    if ((name.length > 0) && (phone.length > 0)  && (area.length > 0) && (address.length > 0) && (zipCode.length > 0)) {
        self.saveBtn.enabled = YES;
    }  else {
        self.saveBtn.enabled = NO;
    }
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KWidth, KHeight) style:UITableViewStylePlain];
       _tableView.backgroundColor = kCOLOR_0F0F0F;

        //iOS11
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            //        self.automaticallyAdjustsScrollViewInsets = NO;
        }
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
        [_tableView registerClass:[MWSContactsCell class] forCellReuseIdentifier:NSStringFromClass([MWSContactsCell class])];
        [_tableView registerClass:[MWSPhoneNumberCell class] forCellReuseIdentifier:NSStringFromClass([MWSPhoneNumberCell class])];
        [_tableView registerClass:[MWSSelectRegionCell class] forCellReuseIdentifier:NSStringFromClass([MWSSelectRegionCell class])];
        [_tableView registerClass:[MWSDetailedAddressCell class] forCellReuseIdentifier:NSStringFromClass([MWSDetailedAddressCell class])];
        [_tableView registerClass:[MWSZipCodeCell class] forCellReuseIdentifier:NSStringFromClass([MWSZipCodeCell class])];
        
    }
    return _tableView;
}
 
- (UIButton *)saveBtn {
    if (!_saveBtn) {
        _saveBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];

//        _saveBtn.backgroundColor = [UIColor grayColor];
        [_saveBtn setTitle:@"保存地址" forState:UIControlStateNormal];
        [_saveBtn addTarget:self action:@selector(clickSaveBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        [_saveBtn setBackgroundImage:IMAGENAME(@"btn_Universal_gray") forState:UIControlStateDisabled];
        [_saveBtn setBackgroundImage:IMAGENAME(@"btn_Universal_red") forState:UIControlStateNormal];
        _saveBtn.enabled = NO;
    }
    return _saveBtn;
}

- (void)clickSaveBtn:(UIButton *)btn {
//    [self backButtonClick];
    //添加
    NSLog(@"保存地址");
    
    NSString *name = self.contactsTextField.text;
    NSString *phone = self.phoneNumberTextField.text;
    NSString *area = self.selectRegionTextField.text;
    NSString *address = self.detailedAddressTextView.text;
    NSString *zipCode = self.zipCodeTextField.text;
    
    name = @"某某某";
    phone = @"13912341234";
    area = @"上海 上海市 某某区";
    address = @"某某街道 某某路 9999弄 100号 101室";
    zipCode = @"200022";
//    
//    if (name.length <= 0) {
//        TOAST(@"请输入联系人姓名");
//        return;
//    }
//    if (phone.length <= 0) {
//        TOAST(@"请输入手机号");
//    }
//    if (area.length <= 0) {
//        TOAST(@"请选择地区");
//        return;
//    }
//    if (address.length <= 0) {
//        TOAST(@"请输入详细地址");
//        return;
//    }
//    if (zipCode.length <= 0) {
//        TOAST(@"请输入邮政编码");
//        return;
//
//    }
    
//
//    [IanAlert showloadingAllowUserInteraction:NO];
//    @weakify(self)
//    [MWSAddAddressApi requestAddAddressWithName:name
//                                          phone:phone
//                                           area:area
//                                        address:address
//                                        zipCode:zipCode
//                                          block:^(BOOL success, NSError * _Nonnull error) {
//        [IanAlert hideLoading];
//        @strongify(self);
//        if (success) {
//            TOAST(@"添加成功");
//            if (self.addAddressBlock) {
//                self.addAddressBlock(YES);
//            }
//            [self.navigationController popViewControllerAnimated:YES];
//
//        } else {
//            TOAST(@"添加失败");
//        }
//    }];
}
@end
