//
//  RRActorInfoCell.h
//  PUClient
//
//  Created by rrtv on 2021/3/10.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
//演员信息cell 大段文字介绍
@interface RRActorInfoCell : UICollectionViewCell
@property (nonatomic, strong) UIButton *moreBtn;
@property (nonatomic, assign) BOOL isShowMore;    //是否显示更多数据 默认NO
//@property (nonatomic, assign) BOOL isNoOtherData; //是否没有其他数据 默认NO

@property (nonatomic, strong) id model;

@end

NS_ASSUME_NONNULL_END
