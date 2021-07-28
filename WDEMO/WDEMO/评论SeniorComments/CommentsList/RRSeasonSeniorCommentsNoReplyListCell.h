//
//  RRSeasonSeniorCommentsNoReplyListCell.h
//  PUClient
//
//  Created by rrtv on 2021/4/29.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RRSeasonSeniorCommentsCell.h"

//一级评论cell，带图，多图，不带回复列表
NS_ASSUME_NONNULL_BEGIN

@interface RRSeasonSeniorCommentsNoReplyListCell : RRSeasonSeniorCommentsCell

////单图
//@property (nonatomic, strong) UIImageView *singleImageView;//单图
//多图
@property (nonatomic, strong) RRSeasonSeniorCommentsPhotoCollectionView *photoCollectionView;//多图

@property (nonatomic, assign) NSInteger currentIndex;
 
+ (CGFloat)cellHeightWithModel:(RRSeniorCommentsModel *)model isShowAll:(BOOL)isShowAll;

@end

NS_ASSUME_NONNULL_END
