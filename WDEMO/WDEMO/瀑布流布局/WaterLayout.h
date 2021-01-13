//
//  WaterLayout.h
//  DEMO
//
//  Created by rrtv on 2021/1/13.
//  Copyright © 2021 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WaterLayout;

@protocol RRWaterLayoutDelegate <NSObject, UICollectionViewDelegateFlowLayout>
@required
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(WaterLayout *)collectionViewLayout heightForRowAtIndexPath:(NSIndexPath *)indexPath itemWidth:(CGFloat)itemWidth;
@optional
// 每个区多少列
- (NSInteger)collectionView:(UICollectionView *)collectionView layout:(WaterLayout *)collectionViewLayout columnNumberInSection:(NSInteger )section;
// 每个区的边距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(WaterLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;
//每一行之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(WaterLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section;
//每一列之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(WaterLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section;
//header
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(WaterLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section;
//footer
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(WaterLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section;
@end

@interface WaterLayout : UICollectionViewLayout
@property (nonatomic ,weak) id<RRWaterLayoutDelegate> delegate;
@end


