//
//  MWSMyAddressCell.h
//  MoWanShang
//
//  Created by rrtv on 2022/5/18.
//

#import <UIKit/UIKit.h>
#import "MWSAddressModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MWSMyAddressCell : UITableViewCell

@property(nonatomic, strong) UIView *container;

@property(nonatomic, strong) UILabel *nameLab;

@property(nonatomic, strong) UILabel *phoneLab;

@property(nonatomic, strong) UILabel *addressLab;
 
@property(nonatomic, strong) MWSAddressModel *model;
@end

NS_ASSUME_NONNULL_END
