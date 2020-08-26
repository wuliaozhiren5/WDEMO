//
//  OrderCell.h
//  
//
//  Created by rrtv on 2020/8/26.
//

#import <UIKit/UIKit.h>
#import "OrderModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface OrderCell : UITableViewCell

@property (nonatomic, strong) OrderModel *model;

@property (strong, nonatomic) UIImageView *imgV;
@property (strong, nonatomic) UILabel *nameLab;
@property (strong, nonatomic) UILabel *typeLab;
@property (strong, nonatomic) UILabel *descLab;
@end

NS_ASSUME_NONNULL_END
