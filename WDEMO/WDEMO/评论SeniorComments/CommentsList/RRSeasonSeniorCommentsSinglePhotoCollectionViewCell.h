//
//  RRSeasonSeniorCommentsSinglePhotoCollectionViewCell.h
//  NJVideo
//
//  Created by WDEMO on 2021/11/8.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RRSeniorCommentsModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RRSeasonSeniorCommentsSinglePhotoCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) RRSeniorCommentsImageModel *model;
@end

NS_ASSUME_NONNULL_END
