//
//  RRSeasonSeniorCommentsPhotoCollectionView.h
//  NJVideo
//
//  Created by rrtv on 2021/7/27.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RRSeniorCommentsModel.h"

NS_ASSUME_NONNULL_BEGIN
@protocol RRSeasonSeniorCommentsMultiImageCollectionViewDelegate <NSObject>
@optional
//点击cell
- (void)seasonSeniorCommentsMultiImageCollectionView:(UICollectionView *)collectionView
                            didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface RRSeasonSeniorCommentsPhotoCollectionView : UICollectionView
@property (nonatomic, copy) NSArray *data;
@property (nonatomic, weak) id<RRSeasonSeniorCommentsMultiImageCollectionViewDelegate> collectionViewDelegate;
//- (RRSeasonSeniorCommentsPhotoCollectionViewCell *)collectionViewCellWithIndex:(NSInteger)index;
@end
 

NS_ASSUME_NONNULL_END

