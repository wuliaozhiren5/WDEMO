//
//  PLUPersonalHomePageView.m
//  TGA
//
//  Created by plu on 16/9/23.
//  Copyright © 2016年 developer. All rights reserved.
//

#define LoggedFlag [PLUPersonalVM me].isLogined

#import "PLUPersonalHomePageView.h"
#import "PLUPersonalHomePageCell.h"
#import "PLURequest.h" 

#import "PLUPersonalHomePageSubscribeCell.h"
#import "PLUGlobalSettingManager.h"
@implementation PLUPersonalItemModel

+(instancetype)modelWithType:(PLUPersonalItemType)type
{
    PLUPersonalItemModel * model = [[PLUPersonalItemModel alloc] init];
    model.type = type;
    switch (type)
    {
        case PLUPersonalItemType_userSubscribe:
        {
            model.title = @"我的关注";
            model.imageNamed = @"ic_wode_dingyue";
        }
            break;
        case PLUPersonalItemType_userTask:
        {
            model.title = @"新手任务";
            model.imageNamed = @"ic_wode_renwu";
        }
            break;
        case PLUPersonalItemType_userReact:
        {
            model.title = @"直播商城";
            model.imageNamed = @"ic_store";
        }
            break;
        case PLUPersonalItemType_userWatchHistory:
        {
            model.title = @"观看记录";
            model.imageNamed = @"ic_wode_jilu";
        }
            break;
        case PLUPersonalItemType_userPlayRemind:
        {
            model.title = @"开播提醒";
            model.imageNamed = @"ic_wode_kaibotixing";
        }
            break;
        case PLUPersonalItemType_userPackage:
        {
            model.title = @"我的背包";
            model.imageNamed = @"ic_wode_baoguo";
        }
            break;
            
        case PLUPersonalItemType_userAccount:
        {
            model.title = @"我的账户";
            model.imageNamed = @"icon_myaccount";
        }
            break;
        case PLUPersonalItemType_userTickerExchange:
        {
            model.title = @"礼券兑换";
            model.imageNamed = @"img_personalcenter_gift";
        }
            break;
        case PLUPersonalItemType_userGuess:
        {
            model.title = @"我的竞猜";
            model.imageNamed = @"personalcenter_guess";
        }
            break;
        case PLUPersonalItemType_userActivityCenter: {
            model.title = @"活动中心";
            model.imageNamed = @"icon_activity";
        }
            break;
        case PLUPersonalItemType_userAuthentication:
        {
            model.title = @"主播认证";
            model.imageNamed = @"icon_renzheng_zhubo";
        }
            break;

        case PLUPersonalItemType_userGameCenter:
        {
            model.title = @"游戏中心";
            model.imageNamed = @"ic_wode_youxi";
        }
            break;
        case PLUPersonalItemType_userSetting:
        {
            model.title = @"设置";
            model.imageNamed = @"ic_wode_shezhi";
        }
            break;
        case PLUPersonalItemType_userMedal:
        {
            model.title = @"我的勋章";
            model.imageNamed = @"icon_personalcenter_fans";
        }
            break;
        case PLUPersonalItemType_userFlowcard:
        {
            model.title = @"免流量观看";
            model.imageNamed = @"icon_txwangka";
        }
            break;
        case PLUPersonalItemType_userGrade:
        {
            model.title = @"我的等级";
            model.imageNamed = @"btn_wode_dengji_normal";
        }
            break;
        case PLUPersonalItemType_userSNBook:
        {
            model.title = @"苏宁读书";
            model.imageNamed = @"icon_read_pic";
        }
            break;
        default:
        {
            NSAssert(NO, @"PLUPersonalItemType 类型错误");
        }
            break;
    }
    return model;
}

@end



@interface PLUPersonalHomePageView ()
{
    NSMutableArray<NSArray<PLUPersonalItemModel *> *> * _dataArr;
}


@end


@implementation PLUPersonalHomePageView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        _showUserTask = YES;
        [self setViews];
        [self setTableViews];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(logoutRefresh) name:PLUUserDidLogoutNotification object:nil];
    }
    return self;
}

- (void)setViews
{
    self.backgroundColor = [UIColor colorFromHexRGB:@"f0f0f0"];
    NSArray * arr = @[@[[PLUPersonalItemModel modelWithType:PLUPersonalItemType_userSubscribe]],
                     
                      @[[PLUPersonalItemModel modelWithType:PLUPersonalItemType_userTask],
                        [PLUPersonalItemModel modelWithType:PLUPersonalItemType_userReact],
                        [PLUPersonalItemModel modelWithType:PLUPersonalItemType_userMedal],
                        [PLUPersonalItemModel modelWithType:PLUPersonalItemType_userGrade],
                        [PLUPersonalItemModel modelWithType:PLUPersonalItemType_userAccount],
                        [PLUPersonalItemModel modelWithType:PLUPersonalItemType_userFlowcard],
                        [PLUPersonalItemModel modelWithType:PLUPersonalItemType_userGuess],
                        [PLUPersonalItemModel modelWithType:PLUPersonalItemType_userWatchHistory],
                        [PLUPersonalItemModel modelWithType:PLUPersonalItemType_userPackage],
                        [PLUPersonalItemModel modelWithType:PLUPersonalItemType_userSNBook],
                        [PLUPersonalItemModel modelWithType:PLUPersonalItemType_userGameCenter],
                        [PLUPersonalItemModel modelWithType:PLUPersonalItemType_userActivityCenter],
                        [PLUPersonalItemModel modelWithType:PLUPersonalItemType_userAuthentication],
                        [PLUPersonalItemModel modelWithType:PLUPersonalItemType_userTickerExchange]
                        ],
                     
                      @[[PLUPersonalItemModel modelWithType:PLUPersonalItemType_userSetting]]];
    _dataArr = [NSMutableArray arrayWithArray:arr];
 
    for (PLUPersonalItemModel *model in _dataArr[1]) {
        PLUPersonalItemType type = model.type;
        switch (type) {
            case PLUPersonalItemType_userFlowcard: {
                if (!kShowKingCardEntrance) {
                    model.hiddeCell = YES;
                }
            }
                break;
                
            case PLUPersonalItemType_userGuess: {
                if (!kKG_GAME_JC) {
                    model.hiddeCell = YES;
                }
            }
                break;
                
            case PLUPersonalItemType_userAuthentication: {
                if (!kShowRealNameAuthent) {
                    model.hiddeCell = YES;
                }
            }
                break;
                
            case PLUPersonalItemType_userTickerExchange: {
                if (!kKG_SC) {
                    model.hiddeCell = YES;
                }
            }
                break;
                
            case PLUPersonalItemType_userReact: {
                if (!kKG_SCRK) {
                    model.hiddeCell = YES;
                }
            }
                break;
                
            case PLUPersonalItemType_userTask: {
                model.hiddeCell = YES;
            }
                break;
                
            case PLUPersonalItemType_userActivityCenter: {
                if (!kKG_SCRK) {
                    model.hiddeCell = YES;
                }
            }
                break;
                
            case PLUPersonalItemType_userGameCenter: {
                if (!kKG_SCRK) {
                    model.hiddeCell = YES;
                }
            }
                break;
            case PLUPersonalItemType_userSNBook: {
                   model.hiddeCell = YES;
            }
                break;
                
            default:
                break;
        }
    }
}

- (void)setTableViews
{
    CGFloat height = 308;
    if (isiPhoneXSeries) {
         height = 308 + 24;
    } else {
         height = 308;
    }
    UIView *theView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, height)];
    _headerView = [[PLUPersonalHomePageHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, height)];
    _headerView.frame=CGRectMake(0, 0, SCREEN_WIDTH, height);
    [theView addSubview: _headerView];
    _headerView.delegate=self;
    _headerView.personalInfoModel = _personalInfoModel;
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];

    _tableView.estimatedRowHeight = 0;
    _tableView.estimatedSectionHeaderHeight = 0;
    _tableView.estimatedSectionFooterHeight = 0;
    
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    [_tableView registerClass:[PLUPersonalHomePageCell class] forCellReuseIdentifier:NSStringFromClass([PLUPersonalHomePageCell class])];
    [_tableView registerClass:[PLUPersonalHomePageSubscribeCell class] forCellReuseIdentifier:NSStringFromClass([PLUPersonalHomePageSubscribeCell class])];
    _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    _tableView.tableHeaderView =  theView;
    [self addSubview:_tableView];
    
    if (@available(iOS 11.0, *)) {
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        
    }
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        if (@available(iOS 11.0, *)) {
//            make.top.equalTo(self).offset(-STATUS_BAR_HEIGHT);
//            make.leading.trailing.bottom.equalTo(self);
//         } else {
//            make.top.equalTo(@(0));
//            make.leading.trailing.bottom.equalTo(self);
        make.edges.equalTo(self);

//        } 
    }];
    
  
    
}

- (void)logoutRefresh {
    _showUserTask = YES;
}

#pragma mark --UITableViewDelegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == _tableView)
    {
        [_headerView scrollViewDidScroll:_tableView];
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArr objectAtIndex:section].count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PLUPersonalItemModel * model = [[_dataArr objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    if (model.type == PLUPersonalItemType_userSubscribe) {
        if (_personalInfoModel && _subscribeDataSource.count>0) {
            return 120.0;
        }
    }
    if (model.hiddeCell) {
        return 0;
    }
    return 54.0;
}

//返回每行的单元格 每行cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *array = [_dataArr objectAtIndex:indexPath.section];
    PLUPersonalItemModel * model = nil;
    if (indexPath.row < array.count) {
        model = array[indexPath.row];
    }
    if (model.type == PLUPersonalItemType_userSubscribe) {
        if (_personalInfoModel && _subscribeDataSource.count>0) {
            PLUPersonalHomePageSubscribeCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([PLUPersonalHomePageSubscribeCell class]) forIndexPath:indexPath];
            cell.subscrCollectionView.delegate = self;
            cell.dataSource = _subscribeDataSource;
            cell.redDotView.hidden = kKG_FristRemind;
            return cell;
        } else {
            PLUPersonalHomePageCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([PLUPersonalHomePageCell class]) forIndexPath:indexPath];
            cell.titleLabel.text = model.title;
            cell.icon.image = [UIImage imageNamed:model.imageNamed];
            cell.getImageBtn.hidden = YES;
            cell.redDotView.hidden = kKG_FristRemind;
            cell.line.hidden = (indexPath.row == array.count - 1);
            cell.titleLabel.hidden = cell.icon.hidden = cell.arrowImageView.hidden = NO;
            if (_personalInfoModel) {
                cell.detailLabel.text = nil;
            } else {
                cell.detailLabel.text = @"登录后可以关注";
            }
            return cell;
        }
    } else {
        PLUPersonalHomePageCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([PLUPersonalHomePageCell class]) forIndexPath:indexPath];
        cell.titleLabel.text = model.title;
        cell.icon.image = [UIImage imageNamed:model.imageNamed];
        cell.detailLabel.text = nil;
        cell.line.hidden = (indexPath.row == array.count - 1);
  
        cell.redDotView.hidden = YES;
        cell.getImageBtn.hidden = YES;
        
        if (!model || model.hiddeCell) {
            cell.titleLabel.hidden = cell.icon.hidden = cell.arrowImageView.hidden = cell.line.hidden = YES;
            return cell;
        }
        cell.titleLabel.hidden = cell.icon.hidden = cell.arrowImageView.hidden = NO;
        
        if (model.type == PLUPersonalItemType_userTask) {
            [cell updateRedDotView:self.noviceTaskModel];
        } else {}
        
        if (model.type == PLUPersonalItemType_userFlowcard) {
            [cell updateImageBtnWithImgName:@"icon_activity_new" isHidden:YES]; 
            if (!_showFlowcardNewLogo) {
                [cell updateImageBtnWithImgName:@"icon_activity_new" isHidden:YES];
            }else {
                [cell updateImageBtnWithImgName:@"icon_activity_new" isHidden:NO];
            }
         } else {
             [cell updateImageBtnWithImgName:@"icon_activity_new" isHidden:YES];
         }
        
        if (model.type == PLUPersonalItemType_userGameCenter) {
            if (_personalGameRedDot) {
                [cell updateImageBtnWithTitle:@"新游戏" isHidden:NO];
            } else {}
        } else {}
        if (model.type == PLUPersonalItemType_userActivityCenter) {
            [cell updateImageBtnWithTitle:@"" isHidden:YES];
        } else {}
        WeakObj(cell)
        if (model.type == PLUPersonalItemType_userAuthentication) {
            [cell showAnchorGuide:!kDidShowedAnchorGuide];
            cell.anchorGuide.closeGuide = ^(BOOL success) {
                [cellWeak showAnchorGuide:NO];
                [PLUGlobalSettingManager shareManager].didShowedAnchorGuide = @(1);
            };
        }
        
        if (model.type == PLUPersonalItemType_userSNBook) {
            cell.bookLabel.hidden = NO;
            cell.bookImageView.hidden = NO;
        
            //产品要求 标题最多5个字，副标题最多q9个字
            if (self.bookModel.title.length > 5) {
                cell.titleLabel.text = [self.bookModel.title  substringToIndex:5];
            }else {
                cell.titleLabel.text = self.bookModel.title;
            }
            if (self.bookModel.sellPoint.length > 9) {
                cell.bookLabel.text = [self.bookModel.sellPoint  substringToIndex:9];
            }else {
                cell.bookLabel.text = self.bookModel.sellPoint;
            }
            [cell.bookImageView plu_setImageWithURL:[NSURL URLWithString:self.bookModel.imageUrl] placeholderImage:nil options:SDWebImageRetryFailed];
           
            UITapGestureRecognizer *tapBookLable = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapBookView:)];
            UITapGestureRecognizer *tapBookImageView = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapBookView:)];
            cell.bookLabel.userInteractionEnabled = YES;
            cell.bookImageView.userInteractionEnabled = YES;
            [cell.bookLabel addGestureRecognizer:tapBookLable];
            [cell.bookImageView addGestureRecognizer:tapBookImageView];
            tapBookLable.view.tag = indexPath.row;
            tapBookImageView.view.tag =indexPath.row;
        }else {
            cell.bookLabel.hidden = YES;
            cell.bookImageView.hidden = YES;
            
        }
        return cell;
    }
}

#pragma mark -- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    PLUPersonalHomePageCell *cell = (PLUPersonalHomePageCell *) [tableView cellForRowAtIndexPath:indexPath];
    PLUPersonalItemModel * model = [[_dataArr objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    switch (model.type) {
        case PLUPersonalItemType_userSubscribe: {
            //关注
            if ([_delegate respondsToSelector:@selector(userSubscribe)]) {
                [_delegate userSubscribe];
            }
        }
        break;
            
        case PLUPersonalItemType_userTask: {
            // 我的任务
            if ([_delegate respondsToSelector:@selector(userTask)]) {
                [_delegate userTask];
            }
        }
        break;
        case PLUPersonalItemType_userAccount: {
            // 我的账户
            if ([_delegate respondsToSelector:@selector(userAccount)]) {
                [_delegate userAccount];
            }
        }
            break;
        case PLUPersonalItemType_userTickerExchange: {
            // 礼券兑换
            if ([_delegate respondsToSelector:@selector(userTask)]) {
                [_delegate userTickerExchange];
            }
        }
            break;
        case PLUPersonalItemType_userGuess: {
                // 我的竞猜
            if ([_delegate respondsToSelector:@selector(userTask)]) {
                [_delegate userGuess];
            }
        }
            break;
            
        case PLUPersonalItemType_userReact: {
            // 直播商城
            if ([_delegate respondsToSelector:@selector(userReact)]) {
                [_delegate userReact];
            }
        }
        break;
            
        case PLUPersonalItemType_userWatchHistory: {
            //观看记录
            if ([_delegate respondsToSelector:@selector(userWatchHistory)]) {
                [_delegate userWatchHistory];
            }
        }
        break;
            
        case PLUPersonalItemType_userPlayRemind: {
            //开播提醒
            if ([_delegate respondsToSelector:@selector(userPlayRemind)]) {
                [_delegate userPlayRemind];
            }
        }
        break;
            
        case PLUPersonalItemType_userPackage: {
            //我的包裹
            if ([_delegate respondsToSelector:@selector(userPackage)]) {
                [_delegate userPackage];
            }

        }
        break;
            
        case PLUPersonalItemType_userAuthentication: {
            //主播认证
            if ([_delegate respondsToSelector:@selector(userAuthentication)]) {
                [_delegate userAuthentication];
                [cell showAnchorGuide:NO];
                [PLUGlobalSettingManager shareManager].didShowedAnchorGuide = @(1);
            }
        }
        break;
            
        case PLUPersonalItemType_userGameCenter: {
            // 游戏中心
            if ([_delegate respondsToSelector:@selector(userGameCenter)]) {
                [_delegate userGameCenter];
            }
        }
        break;
        
        case PLUPersonalItemType_userActivityCenter: {
            // 活动中心
            if ([_delegate respondsToSelector:@selector( activityCenter)]) {
                [_delegate activityCenter];
            } else {}
        }
            break;
            
        case PLUPersonalItemType_userSetting:
        {
            //设置
            if ([_delegate respondsToSelector:@selector(userSetting)])
            {
                [_delegate userSetting];
            }
        }
            break;
            
        case PLUPersonalItemType_userMedal:
        {
            //设置
            if ([_delegate respondsToSelector:@selector(userMedal)])
            {
                [_delegate userMedal];
            }
        }
            break;
        case PLUPersonalItemType_userGrade:
        {
            //我的等级
            if ([_delegate respondsToSelector:@selector(userMedal)])
            {
                [_delegate userGrade];
            }
        }
            break;
            
        case PLUPersonalItemType_userFlowcard:
        {
            //设置
            if ([_delegate respondsToSelector:@selector(userFlowcard)])
            {
                [_delegate userFlowcard];
            }
        }
            break;
        case PLUPersonalItemType_userSNBook:
        {
            //苏宁读书
            if ([_delegate respondsToSelector:@selector(userSNBookWithUrlString:)])
            {
                [_delegate userSNBookWithUrlString:self.bookModel.titleUrl];
            }
        }
            break;
        default:
            break;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == _dataArr.count-1)
    {
        return 10;
    }
    else
    {
        return 0.1;
    }
}

- (void)setMessagesBtnImage
{
    [_headerView setMessagesBtnImage];
}

- (void)setPersonalGameRedDot:(BOOL)personalGameRedDot
{
   
    dispatch_async(dispatch_get_main_queue(),^{
        _personalGameRedDot = personalGameRedDot; 
        [self.tableView reloadData];

    });
}

#pragma mark PLUPersonalSubscribeCollectionViewDelegate
-(void)personalSubscribeDidSelectRowAtIndexPath:(PLURelationshipUserModel*)subscriptionModel
{
 
    if ([_delegate respondsToSelector:@selector(userSubscribe:)]){
        [_delegate userSubscribe:subscriptionModel];
    }

}
#pragma mark -- PLUMySubcribleCellDelegate
-(void)subcribleUserCard:(PLUMySubscriptionModel *)model{
    
    if ([_delegate respondsToSelector:@selector(subcribleUserCard:)]) {
        [_delegate subcribleUserCard:model];
    }
}

#pragma mark PLUPersonalHomePageHeaderViewDelegate
-(void)personalHomePageViewUserLogin{
    if ([_delegate respondsToSelector:@selector(userLogin)]){
        [_delegate userLogin];
    }
}
-(void)personalHomePageViewUserRegister{
    if ([_delegate respondsToSelector:@selector(userRegister)]){
        [_delegate userRegister];
    }
}
-(void)personalHomePageViewTapUserIcon{
    if ([_delegate respondsToSelector:@selector(tapUserIcon)]){
        [_delegate tapUserIcon];
    }
}
-(void)personalHomePageViewPersonCenter{
    if ([_delegate respondsToSelector:@selector(userPersonHomePage)]){
        [_delegate userPersonHomePage];
    }
}
-(void)personalHomePageViewUserMessage{
    if ([_delegate respondsToSelector:@selector(userMessage)]){
        [_delegate userMessage];
    }
}
-(void)personalHomePageViewUserInfo{
    if ([_delegate respondsToSelector:@selector(userInfo)]){
        [_delegate userInfo];
    }
}
-(void)personalHomePageViewUserSign{
    if ([_delegate respondsToSelector:@selector(userSign)]){
        [_delegate userSign];
    }
}

-(void)personalHomePageViewUserNoble {
    if ([_delegate respondsToSelector:@selector(userNoble)]){
        [_delegate userNoble];
    }
}

-(void)personalHomePageVieweCologyGrade{
    if ([_delegate respondsToSelector:@selector(ecologyGrade)]){
        [_delegate ecologyGrade];
    }
}

-(void)personalHomePageViewUserRecharge{
    if ([_delegate respondsToSelector:@selector(userRecharge)]){
        [_delegate userRecharge];
    }
}

-(void)personalHomePageViewClickInvisibleSwitch{
    if ([_delegate respondsToSelector:@selector(userClickInvisibleSwitch)]){
        [_delegate userClickInvisibleSwitch];
    } 
}

-(void)setPersonalInfoModel:(PLUPersonalInfoModel *)personalInfoModel{
 
    dispatch_async(dispatch_get_main_queue(),^{
        _personalInfoModel=personalInfoModel;
        _headerView.personalInfoModel=personalInfoModel;
        [_tableView reloadData];
    });

}

-(void)setSubscribeDataSource:(NSArray *)subscribeDataSource
{
    dispatch_async(dispatch_get_main_queue(),^{
        _subscribeDataSource=[subscribeDataSource copy];
        [_tableView reloadData];
    });
}

- (void)setNoviceTaskModel:(PLURoomTaskTabModel *)noviceTaskModel {
    _noviceTaskModel = noviceTaskModel;
    
    for (PLUPersonalItemModel *model in _dataArr[1]) {
        PLUPersonalItemType type = model.type;
        if (type == PLUPersonalItemType_userTask) {
            if (!self.noviceTaskModel || (self.noviceTaskModel.missionList.count == 0)) {
                _showUserTask = NO;
                model.hiddeCell = YES;
            } else {
                _showUserTask = YES;
                model.hiddeCell = NO;
            }
        }
    }
    dispatch_async(dispatch_get_main_queue(),^{
        [_tableView reloadData];
    });
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)reloadData{
    dispatch_async(dispatch_get_main_queue(),^{
        [self.headerView reloadData];
        [self.tableView reloadData];
    });
   
}

-(void)setShowFlowcardNewLogo:(BOOL)showFlowcardNewLogo{
    _showFlowcardNewLogo = showFlowcardNewLogo;
    [self.tableView reloadData];
}

-(void)setBookModel:(LZSNBookModel *)bookModel {
    _bookModel= bookModel;
    
    for (PLUPersonalItemModel *model in _dataArr[1]) {
        PLUPersonalItemType type = model.type;
        switch (type) {
            case PLUPersonalItemType_userSNBook: {
                
                //苏宁读书接口，如果下发的title和titleUrl为""，不显示苏宁读书cell
                if (_bookModel && ![PLUUtils isBlankString:bookModel.title] && ![PLUUtils isBlankString:bookModel.titleUrl]) {
                    model.hiddeCell = NO;
                }else {
                    model.hiddeCell = YES;
                }
                
            }
                break;
            default:
                break;
        }
    }
 
    [self.tableView reloadData];
}

-(void)tapBookView:(UITapGestureRecognizer *)sender{
    
    //苏宁读书
    if ([_delegate respondsToSelector:@selector(userSNBookWithUrlString:)])
    {
        [_delegate userSNBookWithUrlString:self.bookModel.pageUrl];
    }
}
@end
