//
//  WaterFlowLayout.h
//  瀑布流
//
//  Created by xxx on 16/6/30.
//  Copyright © 2016年 xxx. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WaterFlowLayout;

@protocol WaterFlowLayoutDelegate <NSObject, UICollectionViewDelegateFlowLayout>

@required
//高
// - (CGFloat)WaterFlowLayout:(WaterFlowLayout *)WaterFlowLayout heightForRowAtIndexPath:(NSInteger)index itemWidth:(CGFloat)itemWidth;
// cell高
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForRowAtIndexPath:(NSIndexPath *)indexPath itemWidth:(CGFloat)itemWidth;
@optional
////每个区多少列
//- (CGFloat)columnCountInWaterflowLayout:(WaterFlowLayout *)waterflowLayout;
////每一列之间的间距
//- (CGFloat)columnMarginInWaterflowLayout:(WaterFlowLayout *)waterflowLayout;
////每一行之间的间距
//- (CGFloat)rowMarginInWaterflowLayout:(WaterFlowLayout *)waterflowLayout;
//// 每个区的边距
//- (UIEdgeInsets)edgeInsetsInWaterflowLayout:(WaterFlowLayout *)waterflowLayout;


// 每个区多少列
- (NSInteger)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout columnNumberInSection:(NSInteger )section;
// 每个区的边距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;
//每一行之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section;
//每一列之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section;
// header
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section;
// footer
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section;
//本区区头和上个区区尾的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumSectionSpacingInSection:(NSInteger)section;

@end

@interface WaterFlowLayout : UICollectionViewLayout
@property (nonatomic ,weak) id<WaterFlowLayoutDelegate> delegate;
@end
