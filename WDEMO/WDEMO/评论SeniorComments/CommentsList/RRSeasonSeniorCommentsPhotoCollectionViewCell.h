//
//  RRSeasonSeniorCommentsMultiImageCollectionViewCell.h
//  NJVideo
//
//  Created by rrtv on 2021/7/27.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RRSeniorCommentsModel.h"

NS_ASSUME_NONNULL_BEGIN
@interface RRSeasonSeniorCommentsPhotoCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) RRSeniorCommentsImageModel *model;
@end

NS_ASSUME_NONNULL_END
