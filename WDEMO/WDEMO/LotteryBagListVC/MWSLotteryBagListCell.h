//
//  MWSLotteryBagListCell.h
//  MoWanShang
//
//  Created by rrtv on 2022/3/29.
//

#import <UIKit/UIKit.h>
#import "MWSBagsModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MWSLotteryBagListCell : UITableViewCell

//容器
@property (nonatomic, strong) UIView *container;

@property (nonatomic, strong) UIImageView *iconImgV;
//箱子号
@property (nonatomic, strong) UILabel *bagNoLab;
//剩80张
@property (nonatomic, strong) UILabel *countLab;

@property (nonatomic, copy)NSString *level;

@property (nonatomic, strong)MWSBagsModel *model;

@end

NS_ASSUME_NONNULL_END
