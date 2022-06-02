//
//  MWSSendOutGoodsVC.m
//  MoWanShang
//
//  Created by rrtv on 2022/5/16.
//

#import "MWSSendOutGoodsVC.h"
#import "MWSSendOutGoodsBottomBar.h"
//#import "MWSRewardDetailLevelModel.h"
//#import "MWSRewardDetailModel.h"
//#import "MWSPackListDetailOpenCell.h"
//#import "MWSPackListDetailCloseCell.h"

//#import "MWSMyAddressVC.h"
//#import "MWSSendOutGoodsApi.h"
//#import "MWSAccountBalanceApi.h"
//#import "MWSPayPostageVC.h"

@interface MWSSendOutGoodsVC ()<UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate>
//MWSPayPostageVCDelegate>

@property (nonatomic, strong) MWSSendOutGoodsBottomBar *bottomBar;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *container;

//选择地址
@property (nonatomic, strong) UIView *selectAddressView;
@property (nonatomic, strong) UIButton *selectAddressBtn;
@property (nonatomic, strong) UIImageView *selectAddressIcon;
@property (nonatomic, strong) UIImageView *selectAddressNextIcon;
@property (nonatomic, strong) UILabel *selectAddressLab;
@property (nonatomic, strong) UIView *selectAddressLine;

////地址
@property (nonatomic, strong) UIView *addressView;
@property (nonatomic, strong) UIButton *addressBtn;
@property (nonatomic, strong) UIImageView *addressIcon;
@property (nonatomic, strong) UIImageView *addressNextIcon;
//姓名
@property (nonatomic, strong) UILabel *addressViewNameLab;
//手机号
@property (nonatomic, strong) UILabel *addressViewPhoneLab;
//地址
@property (nonatomic, strong) UILabel *addressViewAddressLab;
@property (nonatomic, strong) UIView *addressLine;
 
//已经选择货物列表
//@property (nonatomic, strong) UIView *selectedGoodsView;
@property (nonatomic, strong) UILabel *selectedGoodsTitleLab;
@property (nonatomic, strong) UICollectionView *collectionView ;

//配送方式
//@property (nonatomic, strong) UIView *sendOutGoodsModeView;
//配送方式
@property (nonatomic, strong) UILabel *sendOutGoodsModeTitleLab;
//配送方式 选择按钮
@property (nonatomic, strong) UIButton *sendOutGoodsModeSelectBtn;
//配送方式 文字 顺丰/中通/圆通，需支付18元运费
//配送方式 文字 顺丰/中通/圆通（满5件赏品包邮）
@property (nonatomic, strong) UILabel *sendOutGoodsModeSelectLab;
//仓库名
@property(nonatomic, strong) UILabel *storeNameLab;

//备注 您可以在此备注您的其他需求或者您想要的款式
@property (nonatomic, strong) UILabel *remarksView;
@property (nonatomic, strong) UILabel *remarksLab;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIView *textFieldBackgroundView;

@property (nonatomic, copy) NSArray *goodsArr;

@property(nonatomic, copy) NSArray *closeArr;

//@property (nonatomic, strong) MWSAddressModel *addressModel;
//
//@property (nonatomic, strong) MWSPayPostageVC *payPostageVC;

@end

@implementation MWSSendOutGoodsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.navigationBarView.titleLabel.text = @"发货";
//    self.navigationBarView.leftButton.hidden = NO;
//    self.view.backgroundColor = kCOLOR_0F0F0F;
//    [self createOpenData];
    [self setupViews];
}

- (void)viewWillAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.view endEditing:YES];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)keyboardWillHide:(NSNotification *)notification {
    
}

- (void)keyboardWillShow:(NSNotification *)notification{
    
}

- (void)keyboardWillChangeFrame:(NSNotification *)notification {
    //键盘
    CGRect rect = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    double duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    /**
     *这个距离是有相对偏移位置 - 屏幕上方空余高度的偏移量
     */
    //90状态栏 + 导航栏
    NSLog(@"height = %f",(self.textField.origin.y + self.textField.size.height - self.scrollView.contentOffset.y));
    NSLog(@"key height = %f",([UIScreen mainScreen].bounds.size.height - rect.size.height));
//    CGFloat h  = statusMarginToTop() + navMarginToTop();
    CGFloat h = 100;

    if ((self.textField.origin.y + self.textField.size.height - self.scrollView.contentOffset.y + h) > ([UIScreen mainScreen].bounds.size.height - rect.size.height)) {
        [UIView animateWithDuration:duration animations:^{
            self.scrollView.contentOffset = CGPointMake(0, self.scrollView.contentOffset.y + (self.textField.origin.y + self.textField.size.height - self.scrollView.contentOffset.y + h) - ([UIScreen mainScreen].bounds.size.height - rect.size.height));
        }];
    }
}
  
//- (void)createOpenData {
//    NSArray *array = [NSArray arrayWithArray:self.mArr];
//
//    //同一个箱子下的物品
//    //排序
//    //Bounds Last ABCDEF
//    NSArray *arr = [array valueForKeyPath:@"trade_goods_level"];
//    //去重复
//    NSSet *set = [NSSet setWithArray:arr];
//    //NSLog(@"%@", set);
//
//    //新数组
//    NSMutableArray *mArr= [NSMutableArray arrayWithArray:set.allObjects];
//    NSLog(@"%@", mArr);
//
//
//    //拼接新的字典
//    //展开
//    NSMutableDictionary *openMDict = [NSMutableDictionary dictionary];
//    //关闭
//    NSMutableDictionary *closeMDict = [NSMutableDictionary dictionary];
//
//    {
//        for (NSInteger i = 0; i < mArr.count; i++) {
//            NSString *typeStr = mArr[i];
//            NSMutableArray *typeArr = [NSMutableArray array];
//            for (MWSRewardDetailModel *object in array) {
//                if ([object.trade_goods_level isEqualToString:typeStr]) {
//                    [typeArr addObject:object];
//                }
//            }
//
//            if (typeArr.count > 0) {
//                //升序
//                NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"active_id" ascending:YES];
//                //排序
//                NSArray *sortedArray = [typeArr sortedArrayUsingDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
//                NSLog(@"sortedArray:%@",sortedArray);
//                openMDict[typeStr] = sortedArray;
//
//                NSArray *tempArr = [self createCloseData:sortedArray];
//                closeMDict[typeStr] = tempArr;
//            }
//        }
//    }
//    NSLog(@"%@", openMDict);
//    NSLog(@"%@", closeMDict);
//
//    //文字长度 降序
//    NSSortDescriptor *sortDescriptor1 = [NSSortDescriptor sortDescriptorWithKey:@"length" ascending:NO];
//    //ABCDEF升序
//    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:nil ascending:YES];
//    //排序
//    NSArray *sortedArray = [mArr sortedArrayUsingDescriptors:[NSArray arrayWithObjects:sortDescriptor1, sortDescriptor, nil]];
//    NSLog(@"sortedArray:%@",sortedArray);
//
//    NSMutableArray *goodsArr = [NSMutableArray array];
//    for (NSString *str in sortedArray) {
//
//        MWSRewardDetailLevelModel *levelModel = [[MWSRewardDetailLevelModel alloc] init];
//        levelModel.level = str;
//        levelModel.tradeDetail = openMDict[str];
//        levelModel.count = levelModel.tradeDetail.count;
//        [goodsArr addObject:levelModel];
//    }
//    self.goodsArr = [NSArray arrayWithArray:goodsArr];
//
//    NSMutableArray *closeArr = [NSMutableArray array];
//    //    NSInteger n = closeMDict.allValues.count;
//    for (NSString *str in sortedArray) {
//        NSArray *temp = closeMDict[str];
//        if (temp) {
//            [closeArr addObjectsFromArray:temp];
//        }
//    }
//    //折叠
////    self.closeArr = [NSArray arrayWithArray:closeArr];
//
//    //全部展示
//    NSMutableArray *allArr = [NSMutableArray array];
//    for (NSArray *oneArr in closeArr) {
//        [allArr addObjectsFromArray:oneArr];
//    }
//    self.closeArr = [NSArray arrayWithArray:allArr];
//
//}
//
//- (NSArray *)createCloseData:(NSArray *)array {
//    //排序
//    NSArray *arr = [array valueForKeyPath:@"active_id"];
//    //去重复
//    NSSet *set = [NSSet setWithArray:arr];
//    //NSLog(@"%@", set);
//
//    //新数组
//    NSMutableArray *mArr= [NSMutableArray arrayWithArray:set.allObjects];
//    NSLog(@"%@", mArr);
//
//    NSMutableArray *newArr = [NSMutableArray array];
//
//    for (NSInteger i = 0; i < mArr.count; i++) {
//        NSString *typeStr = mArr[i];
//        NSMutableArray *typeArr = [NSMutableArray array];
//        for (MWSRewardDetailModel *object in array) {
//            if ([object.active_id isEqualToString:typeStr]) {
//                [typeArr addObject:object];
//            }
//        }
//
//        if (typeArr.count > 0) {
//            [newArr addObject:typeArr];
//        }
//    }
//    return  newArr;
//}

- (void)setupViews {
 
    [self.view addSubview:self.bottomBar];
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.container];
 
    [self.container addSubview:self.selectAddressView];
    [self.selectAddressView addSubview:self.selectAddressBtn];
    [self.selectAddressView addSubview:self.selectAddressIcon];
    [self.selectAddressView addSubview:self.selectAddressNextIcon];
    [self.selectAddressView addSubview:self.selectAddressLab];
    [self.selectAddressView addSubview:self.selectAddressLine];
    
    [self.container addSubview:self.addressView];
    [self.addressView addSubview:self.addressBtn];
    [self.addressView addSubview:self.addressIcon];
    [self.addressView addSubview:self.addressNextIcon];
    [self.addressView addSubview:self.addressLine];
    [self.addressView addSubview:self.addressViewNameLab];
    [self.addressView addSubview:self.addressViewPhoneLab];
    [self.addressView addSubview:self.addressViewAddressLab];
  
    [self.selectAddressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.leading.equalTo(@0);
        make.trailing.equalTo(@0);
        make.height.equalTo(@(50));
    }];
    
    [self.selectAddressBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.leading.equalTo(@0);
        make.trailing.equalTo(@0);
        make.height.equalTo(@(50));
    }];
    
    [self.selectAddressIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.selectAddressView);
        make.leading.equalTo(@12);
        make.width.equalTo(@(12));
        make.height.equalTo(@(15));
    }];
    
    [self.selectAddressNextIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.selectAddressIcon);
        make.trailing.equalTo(@-12);
        make.width.equalTo(@(15));
        make.height.equalTo(@(15));
    }];
    
    [self.selectAddressLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.selectAddressIcon);
        make.leading.equalTo(@36);
        make.trailing.lessThanOrEqualTo(@-36);
    }];
    
    [self.selectAddressLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@0);
        make.leading.equalTo(@12);
        make.trailing.equalTo(@-12);
        make.height.equalTo(@(0.5));
    }];
     
    [self.addressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.leading.equalTo(@0);
        make.trailing.equalTo(@0);
        make.height.equalTo(@(76));
    }];

    [self.addressBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.leading.equalTo(@0);
        make.trailing.equalTo(@0);
        make.height.equalTo(@(76));
    }];
    
    [self.addressIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@16);
        make.leading.equalTo(@12);
        make.width.equalTo(@(12));
        make.height.equalTo(@(15));
    }];
    
    [self.addressNextIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@16);
        make.trailing.equalTo(@-12);
        make.width.equalTo(@(12));
        make.height.equalTo(@(15));
    }];
    
    [self.addressViewNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@12);
        make.leading.equalTo(@36);
//        make.trailing.equalTo(@0);
        make.height.equalTo(@23);
         
    }];

    [self.addressViewPhoneLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.addressViewNameLab);
        make.leading.equalTo(self.addressViewNameLab.mas_trailing).offset(5);
        make.trailing.lessThanOrEqualTo(@-36);
//        make.height.equalTo(@20);
    }];
    
    [self.addressViewAddressLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.addressViewNameLab.mas_bottom).offset(8);
        make.leading.equalTo(@36);
        make.trailing.equalTo(@-36);
//        make.bottom.equalTo(@-15);
//        make.height.equalTo(@40);
    }];
    
    [self.addressLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@0);
        make.leading.equalTo(@12);
        make.trailing.equalTo(@-12);
        make.height.equalTo(@(0.5));
    }];
      
    self.addressViewNameLab.text = @"汤姆克鲁斯";
    self.addressViewPhoneLab.text = @"13912341234";
    self.addressViewAddressLab.text = @"某某某省 某某某市 某某某区 某某某街道 xx路9999弄999号99室";

    [self.bottomBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@(appMargin().bottom));
        make.leading.equalTo(@0);
        make.trailing.equalTo(@0);
        make.height.equalTo(@(50 + 30 + 6));
    }];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.selectAddressView.mas_bottom).offset(0);
//        make.top.equalTo(self.navigationBarView.mas_bottom).offset(0);
        
        make.top.equalTo(@(0));

        make.bottom.equalTo(self.bottomBar.mas_top).offset(30 + 6);
        make.leading.equalTo(@0);
        make.trailing.equalTo(@0);
    }];
    
    [self.container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.leading.trailing.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView);
    }];
    
    [self.container addSubview:self.selectedGoodsTitleLab];
    [self createCollectionView];
    
    [self.container addSubview:self.sendOutGoodsModeTitleLab];
    [self.container addSubview:self.sendOutGoodsModeSelectBtn];
    [self.container addSubview:self.sendOutGoodsModeSelectLab];
    [self.container addSubview:self.storeNameLab];

    [self.container addSubview:self.remarksLab];
    [self.container addSubview:self.textFieldBackgroundView];
    [self.container addSubview:self.textField];
     
    [self.selectedGoodsTitleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.selectAddressView.mas_bottom).offset(30);
//        make.top.equalTo(@0);
        make.leading.equalTo(@12);
        make.trailing.lessThanOrEqualTo(@-12);
        make.height.equalTo(@25);
        
    }];
    
    [self.sendOutGoodsModeTitleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.collectionView.mas_bottom).offset(30);
        make.leading.equalTo(@12);
        make.trailing.lessThanOrEqualTo(@-12);
        make.height.equalTo(@25);
    }];
    
    [self.sendOutGoodsModeSelectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sendOutGoodsModeTitleLab.mas_bottom).offset(12.5);
        make.leading.equalTo(@12);
        make.width.equalTo(@18);
        make.height.equalTo(@18);
    }];
    
    [self.sendOutGoodsModeSelectLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sendOutGoodsModeTitleLab.mas_bottom).offset(12.5);
        make.leading.equalTo(@39);
        make.trailing.lessThanOrEqualTo(@-12);
        make.height.equalTo(@18);
    }];

    [self.storeNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.sendOutGoodsModeTitleLab);
        make.trailing.equalTo(@-12);
    }];
    
    [self.remarksLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sendOutGoodsModeSelectLab.mas_bottom).offset(30);
        make.leading.equalTo(@12);
        make.trailing.lessThanOrEqualTo(@-12);
        make.height.equalTo(@25);
    }];
    
    [self.textFieldBackgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.remarksLab.mas_bottom).offset(8);
        make.leading.equalTo(@12);
        make.trailing.equalTo(@-12);
        make.height.equalTo(@40);
    }];
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.remarksLab.mas_bottom).offset(8);
        make.leading.equalTo(@24);
        make.trailing.equalTo(@-24);
        make.height.equalTo(@40);
    }];

    
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
    
//    CGFloat h = KHeight - (statusMarginToTop() + navMarginToTop()) -  (appMargin().bottom + 50 + 30 + 6);
    CGFloat h = KHeight - 120;

    if (self.textField.frame.origin.y + self.textField.frame.size.height > h) {
        [self.container mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.textField.mas_bottom).offset(0);
         
        }];
    } else {
        [self.container mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.textField.mas_bottom).offset(h - (self.textField.origin.y + self.textField.size.height) - 30);
        }];
    }
    
    [self.view bringSubviewToFront:self.bottomBar];
    
    if (self.mArr.count >= 5) {
        //无需运费
        self.sendOutGoodsModeSelectLab.text = @"顺丰/中通/圆通（满5件赏品包邮）";
    } else {
        
        //需要付18元运费
        //支付页
        self.sendOutGoodsModeSelectLab.text = @"顺丰/中通/圆通，需支付18元运费";
    }
    
    
//    self.selectAddressView.hidden = YES;
    self.addressView.hidden = YES;
}

- (void)createCollectionView {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    //水平
    //    flowLayout.scrollDirection= UICollectionViewScrollDirectionHorizontal;
    //垂直
    flowLayout.scrollDirection= UICollectionViewScrollDirectionVertical;
    //    flowLayout.sectionInset = UIEdgeInsetsMake(14, 12, 14, 12);
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 12, 0, 12);
    
    CGFloat spacing = 6;
    CGFloat width = ceil((KWidth - 12 * 2 - 10 * 3) / 4.0);//12两边间距 10中间间距
//    CGFloat height = width + spacing + 17;
    CGFloat height = width + spacing + 30;
    
    //    Math中的round/ceil/floorf方法总结
    flowLayout.itemSize = CGSizeMake(width, height);
    //    设置同一列中间隔的cell最小间距
    flowLayout.minimumInteritemSpacing = 0.0;
    //     设置最小行间距
    flowLayout.minimumLineSpacing = 12.0;
    
    //初始化collectionView
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;

    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
//    self.collectionView.backgroundColor = kCOLOR_0F0F0F;
//    self.collectionView.backgroundColor = [UIColor blueColor];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
//    [self.collectionView registerClass:[MWSPackListDetailOpenCell class] forCellWithReuseIdentifier:NSStringFromClass([MWSPackListDetailOpenCell class])];
//    [self.collectionView registerClass:[MWSPackListDetailCloseCell class] forCellWithReuseIdentifier:NSStringFromClass([MWSPackListDetailCloseCell class])];
    ////    [self.collectionView registerClass:[MWSPackListCell class] forCellWithReuseIdentifier:NSStringFromClass([MWSPackListCell class])];
    //
    //    [self.collectionView registerClass:[MWSRewardBagListDetailOpenHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header"];
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"Footer"];
    
    [self.container addSubview:self.collectionView];
    
    if (self.closeArr.count > 4) {
        [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.selectedGoodsTitleLab.mas_bottom).offset(8);
            make.leading.equalTo(@0);
            make.trailing.equalTo(@0);
            make.height.equalTo(@(height * 2 + 12 + 12 + 10));

        }];
    } else {
        [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.selectedGoodsTitleLab.mas_bottom).offset(8);
            make.leading.equalTo(@0);
            make.trailing.equalTo(@0);
            make.height.equalTo(@(height));

        }];
    }
  
    if (!self.storeModel) {
        //可以选
        self.storeNameLab.text = @"";
    } else {
        self.storeNameLab.text = self.storeModel.storeName;
    }
    
}

#pragma mark -- TapAction
- (void)tapAction:(UIGestureRecognizer*)tapGesture {
    [self.view endEditing:YES];
}

#pragma mark -- UIScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
}

#pragma mark -- UICollectionViewDataSource
//有多少组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
    
}

///每一组有多少个cell
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.closeArr.count;
}

//定义并返回每个cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
        UICollectionViewCell *cell = (UICollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class]) forIndexPath:indexPath];
        cell.contentView.backgroundColor = [UIColor grayColor];
        return cell;
    
//    MWSPackListDetailCloseCell *cell = (MWSPackListDetailCloseCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([MWSPackListDetailCloseCell class]) forIndexPath:indexPath];
//    NSInteger item = indexPath.item;
//    NSArray *array = [self.closeArr objectOrNilAtIndex:item];
//    MWSRewardDetailModel *model = array.firstObject;
//    cell.model = model;
//    cell.count = array.count;
 

//    MWSPackListDetailOpenCell *cell = (MWSPackListDetailOpenCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([MWSPackListDetailOpenCell class]) forIndexPath:indexPath];
//    NSInteger item = indexPath.item;
//    MWSRewardDetailModel *model = [self.closeArr objectOrNilAtIndex:item];
//    cell.model = model;
//
//    return cell;
}


#pragma mark -- UICollectionViewDelegate
//UICollectionView被选中时调用的方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)clickConfirmBtn:(UIButton *)btn {
//    //确认
//    [self.view endEditing:YES];
//
//    if (self.mArr.count <= 0) {
//        TOAST(@"数量选择错误");
//        return;
//    }
//
//    if (self.addressModel && self.addressModel.name.length > 0 && self.addressModel.phone.length > 0 && self.addressModel.area.length > 0 && self.addressModel.address.length > 0) {
//
//    } else {
//        TOAST(@"请选择地址");
//        return;
//    }
//
//    NSArray *tradeIdsArr = [self.mArr valueForKeyPath:@"trade_id"];
//    NSString *userName = self.addressModel.name;
//    NSString *phone = self.addressModel.phone;
//    NSString *address = [NSString stringWithFormat:@"%@ %@", self.addressModel.area, self.addressModel.address];
//    NSString *mark = self.textField.text;
//    NSInteger expressFee = 1800;
//
//
//    if (self.mArr.count >= 5) {
//        //无需运费
//        expressFee = 0;
//        MWSPayMethodType payMethodType = MWSPayMethodTypeBalance;
//        [IanAlert showloadingAllowUserInteraction:NO];
//        @weakify(self)
//        [MWSSendOutGoodsApi requestTradeExpressChargeWithTradeIds:tradeIdsArr
//                                                         userName:userName
//                                                            phone:phone
//                                                          address:address
//                                                             mark:mark
//                                                       expressFee:expressFee
//                                                        payMethodType:payMethodType
//                                                            block:^(MWSPayModel * _Nonnull model, NSError * _Nonnull error) {
//            [IanAlert hideLoading];
//            @strongify(self)
//
//            if (error) {
//                //            TOAST(@"订单接口请求失败")
//                TOAST(error.userInfo[NSLocalizedDescriptionKey]);
//                return;
//            }
//
//            NSString *order_id = model.order_id;
//            if (order_id.length > 0) {
//                TOAST(@"发货成功");
//                [self.navigationController popToRootViewControllerAnimated:YES];
//            } else {
//                TOAST(@"发货失败");
//            }
//
//        }];
//
//     } else {
//         //需要付18元运费
//         //支付页
//         expressFee = 1800;
//
//         [IanAlert showloadingAllowUserInteraction:NO];
//         @weakify(self);
//         [MWSAccountBalanceApi requestAccountBalanceBlock:^(MWSAccountBalanceModel * _Nonnull model, NSError * _Nonnull error) {
//             [IanAlert hideLoading];
//             @strongify(self);
//             if (error) {
//                 TOAST(@"余额请求失败");
//                 return;
//             }
//
////             NSLog(@"bag_no = %zi",self.bagModel.bag_no);
////             NSLog(@"bag_id = %@",self.bagModel.bag_id);
////             成功
////             打开支付页面
////             //    MWSLotteryPayVC *payVC = [[MWSLotteryPayVC alloc] init];
////             MWSLotteryPayVC *payVC = [[MWSLotteryPayVC alloc] initWithActiveModel:self.activeModel
////                                                                          bagModel:self.bagModel
////                                                               accountBalanceModel:model
////                                                                             count:count
////                                                                    purchaseRecord:purchaseRecord
////                                                                          isBuyAll:isBuyAll];
////             payVC.delegate = self;
////             [self.view addSubview:payVC.view];
////             self.payVC = payVC;
////             //    [self.navigationController pushViewController:payVC animated:YES];
////
//
//             MWSPayPostageVC *payPostageVC = [[MWSPayPostageVC alloc] initWithAccountBalanceModel:model tradeIds:tradeIdsArr userName:userName phone:phone address:address mark:mark expressFee:expressFee];
//             payPostageVC.delegate = self;
//             [self.view addSubview:payPostageVC.view];
//             self.payPostageVC = payPostageVC;
//
//         }];
//    }
}
#pragma mark -- MWSPayPostageVCDelegate
- (void)payPostageSuccessWithOrderId:(NSString *)orderId {
//    TOAST(@"发货成功");
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)hiddenPayPostageVC {
//    //移除支付
//    self.payPostageVC = nil;
}


- (void)clickCancelBtn:(UIButton *)btn {
    //取消
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)clickSelectAddressBtn:(UIButton *)btn {
//    //选择地址
//    [self.view endEditing:YES];
//    MWSMyAddressVC *vc = [[MWSMyAddressVC alloc] init];
//
//    @weakify(self);
//    vc.selectAddressBlock = ^(MWSAddressModel * _Nonnull addressModel) {        @strongify(self);
//        self.addressModel = addressModel;
//
//        if (self.addressModel) {
//            self.selectAddressView.hidden = YES;
//            self.addressView.hidden = NO;
//            self.addressViewNameLab.text = self.addressModel.name;
//            self.addressViewPhoneLab.text = self.addressModel.phone;
//            self.addressViewAddressLab.text = [NSString stringWithFormat:@"%@ %@", self.addressModel.area, self.addressModel.address];
//
//            [self.selectedGoodsTitleLab mas_remakeConstraints:^(MASConstraintMaker *make) {
//                make.top.equalTo(self.addressView.mas_bottom).offset(30);
//        //        make.top.equalTo(@0);
//                make.leading.equalTo(@12);
//                make.trailing.lessThanOrEqualTo(@-12);
//                make.height.equalTo(@25);
//
//            }];
//
//        } else {
//
//            self.selectAddressView.hidden = NO;
//            self.addressView.hidden = YES;
//            [self.selectedGoodsTitleLab mas_remakeConstraints:^(MASConstraintMaker *make) {
//                make.top.equalTo(self.selectAddressView.mas_bottom).offset(30);
//        //        make.top.equalTo(@0);
//                make.leading.equalTo(@12);
//                make.trailing.lessThanOrEqualTo(@-12);
//                make.height.equalTo(@25);
//
//            }];
//        }
//
//    };
//    [[MWSLinkManager sharedManager] pushViewController:vc animated:YES];

}

//lazy
- (MWSSendOutGoodsBottomBar *)bottomBar {
    if (!_bottomBar) {
        _bottomBar = [[MWSSendOutGoodsBottomBar alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
        [_bottomBar.confirmBtn addTarget:self action:@selector(clickConfirmBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_bottomBar.cancelBtn addTarget:self action:@selector(clickCancelBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bottomBar;
}

 
- (UIView *)selectAddressView {
    if (!_selectAddressView) {
        _selectAddressView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
    }
    return _selectAddressView;
}
 
- (UIButton *)selectAddressBtn {
    if (!_selectAddressBtn) {
        _selectAddressBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
        [_selectAddressBtn addTarget:self action:@selector(clickSelectAddressBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _selectAddressBtn;
}

- (UIView *)selectAddressLine {
    if (!_selectAddressLine) {
        _selectAddressLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 1)];
        _selectAddressLine.backgroundColor = kCOLOR_FFFFFFAlpha03;
    }
    return _selectAddressLine;
}

- (UIImageView *)selectAddressIcon {
    if (!_selectAddressIcon) {
        _selectAddressIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 15, 15)];
        _selectAddressIcon.image = [UIImage imageNamed:@"pic_adress"];
    }
    return _selectAddressIcon;
}
 
- (UIImageView *)selectAddressNextIcon {
    if (!_selectAddressNextIcon) {
        _selectAddressNextIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 12, 15)];
        _selectAddressNextIcon.image = [UIImage imageNamed:@"ic_into"];
    }
    return _selectAddressNextIcon;
}

- (UILabel *)selectAddressLab {
    if (!_selectAddressLab) {
        _selectAddressLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 15)];
        _selectAddressLab.text = @"请选择收获地址";
        _selectAddressLab.textColor = kCOLOR_FFFFFF;
        
    }
    return _selectAddressLab;
}
 

- (UILabel *)selectedGoodsTitleLab {
    if (!_selectedGoodsTitleLab) {
        _selectedGoodsTitleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 15)];
        _selectedGoodsTitleLab.text = @"已选赏品";
        _selectedGoodsTitleLab.textColor = kCOLOR_FFFFFF;
        
    }
    return _selectedGoodsTitleLab;
}

- (UILabel *)sendOutGoodsModeTitleLab {
    if (!_sendOutGoodsModeTitleLab) {
        _sendOutGoodsModeTitleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 15)];
        _sendOutGoodsModeTitleLab.text = @"配送方式";
        _sendOutGoodsModeTitleLab.textColor = kCOLOR_FFFFFF;
        
    }
    return _sendOutGoodsModeTitleLab;
}

- (UILabel *)sendOutGoodsModeSelectLab {
    if (!_sendOutGoodsModeSelectLab) {
        _sendOutGoodsModeSelectLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 15)];
        _sendOutGoodsModeSelectLab.text = @"顺丰/中通/圆通，需支付18元运费";
        _sendOutGoodsModeSelectLab.textColor = kCOLOR_FFFFFF;
        _sendOutGoodsModeSelectLab.font = [UIFont systemFontOfSize:14];
    }
    return _sendOutGoodsModeSelectLab;
}

- (UIButton *)sendOutGoodsModeSelectBtn {
    if (!_sendOutGoodsModeSelectBtn) {
        _sendOutGoodsModeSelectBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
        _sendOutGoodsModeSelectBtn.userInteractionEnabled = NO;
        [_sendOutGoodsModeSelectBtn setImage:[UIImage imageNamed:@"ic_change_h"] forState:UIControlStateNormal];
       
    }
    return _sendOutGoodsModeSelectBtn;
}

- (UILabel *)remarksLab {
    if (!_remarksLab) {
        _remarksLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 15)];
        _remarksLab.text = @"备注";
        _remarksLab.textColor = kCOLOR_FFFFFF;
    }
    return _remarksLab;
}

- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 320, 15)];
        //        _textField.text = @"备注";
        _textField.textColor = kCOLOR_FFFFFF;
        _textField.font = [UIFont systemFontOfSize:12];
//        _textField.placeholder = @"备注";
//
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"您可以在此备注您的其他需求或者您想要的款式"];
        one.lineSpacing = 2.5;
        one.font = [UIFont systemFontOfSize:12];
        one.color = kCOLOR_FFFFFF;
        _textField.attributedPlaceholder = one;
        
//        _textField.backgroundColor = [UIColor grayColor];
//        _textField.backgroundColor = kCOLOR_282828;
//        _textField.layer.cornerRadius = 2;
//        _textField.layer.masksToBounds = YES;
    }
    return _textField;
    
}

- (UIView *)textFieldBackgroundView {
    if (!_textFieldBackgroundView) {
        _textFieldBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
//        _textFieldBackgroundView.backgroundColor = kCOLOR_282828;
        _textFieldBackgroundView.layer.cornerRadius = 2;
        _textFieldBackgroundView.layer.masksToBounds = YES;
    }
    return _textFieldBackgroundView;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
//        _scrollView.backgroundColor = kCOLOR_FFFFFF;
        _scrollView.delegate = self;
//        _scrollView.delegate = self;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [_scrollView addGestureRecognizer:tap];
    }
    return _scrollView;
    
}

- (UIView *)container {
    if (!_container) {
        _container = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
//        _container.backgroundColor = kCOLOR_FFFFFF;
    }
    return _container;
}

- (UIView *)addressView {
    if (!_addressView) {
        _addressView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
    }
    return _addressView;
}

- (UIButton *)addressBtn {
    if (!_addressBtn) {
        _addressBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
        [_addressBtn addTarget:self action:@selector(clickSelectAddressBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addressBtn;
}

- (UIView *)addressLine {
    if (!_addressLine) {
        _addressLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 1)];
        _addressLine.backgroundColor = kCOLOR_FFFFFFAlpha03;
    }
    return _addressLine;
}

- (UIImageView *)addressIcon {
    if (!_addressIcon) {
        _addressIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 15, 15)];
        _addressIcon.image = [UIImage imageNamed:@"pic_adress"];
    }
    return _addressIcon;
}
 
- (UIImageView *)addressNextIcon {
    if (!_addressNextIcon) {
        _addressNextIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 12, 15)];
        _addressNextIcon.image = [UIImage imageNamed:@"ic_into"];
    }
    return _addressNextIcon;
}

- (UILabel *)addressViewNameLab {
    if (!_addressViewNameLab) {
        _addressViewNameLab = [[UILabel alloc] init];
        _addressViewNameLab.font = [UIFont systemFontOfSize:15];
//        _nameLab.textAlignment = NSTextAlignmentLeft;
//        _nameLab.numberOfLines = 1;
//        _nameLab.textColor = [UIColor redColor];
        _addressViewNameLab.textColor = [kCOLOR_FFFFFF colorWithAlphaComponent:0.9];

    }
    return _addressViewNameLab;
}

- (UILabel *)addressViewPhoneLab {
    if (!_addressViewPhoneLab) {
        _addressViewPhoneLab = [[UILabel alloc] init];
        _addressViewPhoneLab.font = [UIFont systemFontOfSize:15];
//        _phoneLab.textAlignment = NSTextAlignmentLeft;
//        _phoneLab.numberOfLines = 1;
//        _phoneLab.textColor = [UIColor redColor];
        _addressViewPhoneLab.textColor = [kCOLOR_FFFFFF colorWithAlphaComponent:0.9];

    }
    return _addressViewPhoneLab;
}

- (UILabel *)addressViewAddressLab {
    if (!_addressViewAddressLab) {
        _addressViewAddressLab = [[UILabel alloc] init];
        _addressViewAddressLab.font = [UIFont systemFontOfSize:12];
//        _addressLab.textAlignment = NSTextAlignmentLeft;
        _addressViewAddressLab.numberOfLines = 2;
//        _addressLab.textColor = [UIColor redColor];
        _addressViewAddressLab.textColor = [kCOLOR_FFFFFF colorWithAlphaComponent:0.9];

    }
    return _addressViewAddressLab;
}

- (UILabel *)storeNameLab {
    if (!_storeNameLab) {
        _storeNameLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
        _storeNameLab.text = @"仓库";
        _storeNameLab.font = [UIFont systemFontOfSize:12.0];
        _storeNameLab.textColor = [kCOLOR_FFFFFF colorWithAlphaComponent:0.6];
//        _countNameLab.textAlignment = NSTextAlignmentCenter;
    }
    return _storeNameLab;
}
@end
