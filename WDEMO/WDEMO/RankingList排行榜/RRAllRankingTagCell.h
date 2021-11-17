//
//  RRAllRankingTagCell.h
//  WDEMO
//
//  Created by rrtv on 2021/10/21.
//  Copyright © 2021 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RRAllRankingListModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface RRAllRankingTagCell : UICollectionViewCell
@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) RRAllRankingTagModel *model;

@end

NS_ASSUME_NONNULL_END
