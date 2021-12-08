//
//  RRAllRankingSwitchViewCell.h
//  NJVideo
//
//  Created by rrtv on 2021/12/3.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RRAllRankingSwitchViewCell : UICollectionViewCell

@property(nonatomic, copy)NSString *titleStr;
@property(nonatomic, strong)UILabel *titleLab;
@property(nonatomic, assign)BOOL isSelected;

@end

NS_ASSUME_NONNULL_END
