//
//  CustomLayout.h
//  collectionView
//
//  Created by JiWuChao on 2017/6/29.
//  Copyright © 2017年 姬武超. All rights reserved.
//

#import <UIKit/UIKit.h>


@class PLUCustomLayout;

@protocol PLUCustomLayoutDelegate <NSObject>

@required
// cell 高
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(PLUCustomLayout *)collectionViewLayout heightForRowAtIndexPath:(NSIndexPath *)indexPath itemWidth:(CGFloat)itemWidth ;

@optional
// headersize
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(PLUCustomLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section;

// footer 的 size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(PLUCustomLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section;

// 每个区的边距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(PLUCustomLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;

// 每个区多少列
- (NSInteger)collectionView:(UICollectionView *)collectionView layout:(PLUCustomLayout *)collectionViewLayout columnNumberAtSection:(NSInteger )section;


// 每个区多少中行距
- (NSInteger)collectionView:(UICollectionView *)collectionView layout:(PLUCustomLayout *)collectionViewLayout lineSpacingForSectionAtIndex:(NSInteger)section;

// 每个 item 之间的左右间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(PLUCustomLayout*)collectionViewLayout interitemSpacingForSectionAtIndex:(NSInteger)section;

// 本区区头和上个区区尾的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(PLUCustomLayout*)collectionViewLayout spacingWithLastSectionForSectionAtIndex:(NSInteger)section;

@end


@interface PLUCustomLayout : UICollectionViewLayout


@property (nonatomic, weak) id<PLUCustomLayoutDelegate> delegate;

@property (nonatomic,assign) UIEdgeInsets sectionInsets;

@property (nonatomic,assign) NSInteger columnCount;

@property (nonatomic,assign) CGFloat lineSpacing;

@property (nonatomic,assign) CGFloat interitemSpacing;

@property (nonatomic,assign) CGSize headerReferenceSize;

@property (nonatomic,assign) CGSize footerReferenceSize;



@end
