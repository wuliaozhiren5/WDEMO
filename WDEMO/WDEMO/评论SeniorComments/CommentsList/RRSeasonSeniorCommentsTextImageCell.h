//
//  RRSeasonSeniorCommentsTextImageCell.h
//  NJVideo
//
//  Created by rrtv on 2021/8/11.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRSeasonSeniorCommentsTextCell.h"
#import "RRSeasonSeniorCommentsPhotoCollectionView.h"
NS_ASSUME_NONNULL_BEGIN

//一级评论cell，带文字，带图片
@interface RRSeasonSeniorCommentsTextImageCell : RRSeasonSeniorCommentsTextCell <RRSeasonSeniorCommentsPhotoCollectionViewDelegate>

//多图
@property (nonatomic, strong) RRSeasonSeniorCommentsPhotoCollectionView *photoCollectionView;//多图
//点击图片的currentIndex
@property (nonatomic, assign) NSInteger currentIndex;
 
+ (CGFloat)cellHeightWithModel:(RRSeniorCommentsModel *)model isShowAll:(BOOL)isShowAll;
@end

NS_ASSUME_NONNULL_END
