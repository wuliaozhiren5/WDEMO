//
//  WaterFlowLayout.m
//
//
//  Created by xxx on 16/6/30.
//  Copyright © 2016年 xxx. All rights reserved.
//

#import "WaterFlowLayout.h"
#import <AssetsLibrary/AssetsLibrary.h>
//默认的列数
static const NSInteger DefaultColumnCpunt = 3;

//每一列之间的间距
static const CGFloat DefaultColumnMargin = 10;

//每一行之间的间距
static const CGFloat DefaultRowMargin = 10;

//边缘间距
static const UIEdgeInsets DefaultEdgeInsets = {10,10,10,10};

@interface WaterFlowLayout ()

//c存放所有cell的布局属性
@property (nonatomic, strong) NSMutableArray *attrsArray;
//存放所有列的当前高度
@property (nonatomic, strong) NSMutableArray *columnHeights;
/** 内容的高度 */
@property (nonatomic, assign) CGFloat contentHeight;

//@property (nonatomic, assign) CGFloat lastContentHeight;

@end

@implementation WaterFlowLayout

//- (CGFloat)rowMargin
//{
//    if ([self.delegate respondsToSelector:@selector(rowMarginInWaterflowLayout:)]) {
//        return [self.delegate rowMarginInWaterflowLayout:self];
//    } else {
//        return DefaultRowMargin;
//    }
//}
//
//- (CGFloat)columnMargin
//{
//    if ([self.delegate respondsToSelector:@selector(columnMarginInWaterflowLayout:)]) {
//        return [self.delegate columnMarginInWaterflowLayout:self];
//    } else {
//        return DefaultColumnMargin;
//    }
//}
//
//- (NSInteger)columnCount
//{
//    if ([self.delegate respondsToSelector:@selector(columnCountInWaterflowLayout:)]) {
//        return [self.delegate columnCountInWaterflowLayout:self];
//    } else {
//        return DefaultColumnCpunt;
//    }
//}
//
//- (UIEdgeInsets)edgeInsets
//{
//    if ([self.delegate respondsToSelector:@selector(edgeInsetsInWaterflowLayout:)]) {
//        return [self.delegate edgeInsetsInWaterflowLayout:self];
//    } else {
//        return DefaultEdgeInsets;
//    }
//}

- (NSMutableArray *)attrsArray
{
    if (!_attrsArray) {
        _attrsArray = [NSMutableArray array];
    }
    return _attrsArray;
}

- (NSMutableArray *)columnHeights
{
    if (!_columnHeights) {
        _columnHeights = [NSMutableArray array];
    }
    return _columnHeights;
}

//每次布局都会调用
- (void)prepareLayout
{
    [super prepareLayout];
    
    //清除之前计算的所有高度，因为刷新的时候回调用这个方法
    [self.columnHeights removeAllObjects];
    //把初始化的操作都放到这里
    [self.attrsArray removeAllObjects];
    
    self.contentHeight = 0;
    self.rowMargin = DefaultRowMargin;
    self.columnMargin = DefaultColumnMargin;
    self.columnCount = DefaultColumnCpunt;
    self.edgeInsets = DefaultEdgeInsets;
    
//    for (NSInteger i = 0; i < DefaultColumnCpunt; i++) {
//        [self.columnHeights addObject:@(self.edgeInsets.top)];
//    }
    
//    //开始创建每一个cell对应的布局属性
//    NSInteger count = [self.collectionView numberOfItemsInSection:0];
//    for (NSInteger i = 0; i < count; i++) {
//        // 创建位置
//        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
//        // 获取indexPath位置cell对应的布局属性
//        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
//        [self.attrsArray addObject:attrs];
//    }
    
    // 一共有多少个区
    NSInteger section = [self.collectionView numberOfSections];

    for (NSInteger i = 0 ; i < section; i++) {
        
        //每个区
        NSIndexPath *indexPath = [NSIndexPath indexPathWithIndex:i];
        
        //每个区的初始化高度
        if ([self.delegate respondsToSelector:@selector(collectionView:layout:columnNumberInSection:)]) {
            self.columnCount = [self.delegate collectionView:self.collectionView layout:self columnNumberInSection:indexPath.section];
        }
        if ([self.delegate respondsToSelector:@selector(collectionView:layout:insetForSectionAtIndex:)]) {
            self.edgeInsets = [self.delegate collectionView:self.collectionView layout:self insetForSectionAtIndex:indexPath.section];
        }
        if ([self.delegate respondsToSelector:@selector(collectionView:layout:minimumLineSpacingForSectionAtIndex:)]) {
            self.rowMargin = [self.delegate collectionView:self.collectionView layout:self minimumLineSpacingForSectionAtIndex:indexPath.section];
        }
        if ([self.delegate respondsToSelector:@selector(collectionView:layout:minimumInteritemSpacingForSectionAtIndex:)]) {
            self.columnMargin = [self.delegate collectionView:self.collectionView layout:self minimumInteritemSpacingForSectionAtIndex:indexPath.section];
        }
      
        //1 初始化 header
        //获取header的UICollectionViewLayoutAttributes
        UICollectionViewLayoutAttributes *headerAttrs = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:indexPath];
        [self.attrsArray addObject:headerAttrs];
  
        [self.columnHeights removeAllObjects];
 
       //2 初始化区的 y 值
        for (NSInteger i = 0; i < DefaultColumnCpunt; i++) {
            //            [self.columnHeights addObject:@(self.edgeInsets.top)];
            [self.columnHeights addObject:@(self.contentHeight)]; 
        }
        
        //        self.lastContentHeight = self.contentHeight;

        //3 每个区中有多少 item
        //获取item的UICollectionViewLayoutAttributes
        NSInteger count = [self.collectionView numberOfItemsInSection:i];
        for (NSInteger j = 0; j < count; j++) {
            NSIndexPath *index = [NSIndexPath indexPathForRow:j inSection:i];
            UICollectionViewLayoutAttributes * attrs = [self layoutAttributesForItemAtIndexPath:index];
            [self.attrsArray addObject:attrs];
        }
        //4 初始化 footer
        //获取footer的UICollectionViewLayoutAttributes
        UICollectionViewLayoutAttributes *footerAttrs = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionFooter atIndexPath:indexPath];
        [self.attrsArray addObject:footerAttrs];
    }
}

//返回所有item属性
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.attrsArray;
}

//返回每个item的属性
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //每个区的初始化高度
    if ([self.delegate respondsToSelector:@selector(collectionView:layout:columnNumberInSection:)]) {
        self.columnCount = [self.delegate collectionView:self.collectionView layout:self columnNumberInSection:indexPath.section];
    }
    if ([self.delegate respondsToSelector:@selector(collectionView:layout:insetForSectionAtIndex:)]) {
        self.edgeInsets = [self.delegate collectionView:self.collectionView layout:self insetForSectionAtIndex:indexPath.section];
    }
    if ([self.delegate respondsToSelector:@selector(collectionView:layout:minimumLineSpacingForSectionAtIndex:)]) {
        self.rowMargin = [self.delegate collectionView:self.collectionView layout:self minimumLineSpacingForSectionAtIndex:indexPath.section];
    }
    if ([self.delegate respondsToSelector:@selector(collectionView:layout:minimumInteritemSpacingForSectionAtIndex:)]) {
        self.columnMargin = [self.delegate collectionView:self.collectionView layout:self minimumInteritemSpacingForSectionAtIndex:indexPath.section];
    }
    
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    CGFloat collectionViewW = self.collectionView.frame.size.width;
    
    CGFloat w = (collectionViewW - self.edgeInsets.left - self.edgeInsets.right -(self.columnCount - 1) * self.columnMargin) / self.columnCount;
    
//    CGFloat h = [self.delegate WaterFlowLayout:self heightForRowAtIndexPath:indexPath.item itemWidth:w];
    
    CGFloat h =  [self.delegate collectionView:self.collectionView layout:self heightForRowAtIndexPath:indexPath itemWidth:w];
    
    NSInteger destColumn = 0;
    
    CGFloat minColumnHeight = [self.columnHeights[0] doubleValue];
    for (NSInteger i = 0; i < self.columnCount; i++) {
        CGFloat columnHeight = [self.columnHeights[i] doubleValue];
        
        if (minColumnHeight > columnHeight) {
            minColumnHeight = columnHeight;
            destColumn = i;
        }
    }
    
    CGFloat x = self.edgeInsets.left + destColumn * (w + self.columnMargin);
    CGFloat y = minColumnHeight;
    if (y != self.edgeInsets.top) {
        y += self.rowMargin;
    }
    
    attrs.frame = CGRectMake(x, y, w, h);
    
    self.columnHeights[destColumn] = @(CGRectGetMaxY(attrs.frame));
    
    CGFloat columnHeight = [self.columnHeights[destColumn] doubleValue];
    if (self.contentHeight < columnHeight) {
        self.contentHeight = columnHeight;
    }
    return attrs;
    
}

//- (CGSize)collectionViewContentSize
//{
////    CGFloat maxColumnHeight = [self.columnHeights[0] doubleValue];
////
////    for (NSInteger i = 1; i < DefaultColumnCpunt; i++) {
////        // 取得第i列的高度
////        CGFloat columnHeight = [self.columnHeights[i] doubleValue];
////
////        if (maxColumnHeight < columnHeight) {
////            maxColumnHeight = columnHeight;
////        }
////    }
//    return CGSizeMake(0, self.contentHeight + self.edgeInsets.bottom);
//}

//布局完成后设置contentSize
- (CGSize)collectionViewContentSize {
    return CGSizeMake(self.collectionView.frame.size.width, self.contentHeight);
}
 
- (UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:elementKind withIndexPath:indexPath];
    
    if ([elementKind isEqualToString:UICollectionElementKindSectionHeader]) {
        CGSize headerReferenceSize;
        if ([_delegate respondsToSelector:@selector(collectionView:layout:referenceSizeForHeaderInSection:)]) {
             headerReferenceSize = [_delegate collectionView:self.collectionView layout:self referenceSizeForHeaderInSection:indexPath.section];
        }
        attributes.frame = CGRectMake(0,  self.contentHeight, headerReferenceSize.width, headerReferenceSize.height);
        
        self.contentHeight += headerReferenceSize.height;
        self.contentHeight += self.edgeInsets.top;
        
    } else if ([elementKind isEqualToString:UICollectionElementKindSectionFooter] ){
        CGSize footerReferenceSize;
        if ([_delegate respondsToSelector:@selector(collectionView:layout:referenceSizeForFooterInSection:)]) {
             footerReferenceSize = [_delegate collectionView:self.collectionView layout:self referenceSizeForFooterInSection:indexPath.section];
        }
        
        self.contentHeight += self.edgeInsets.bottom;
        attributes.frame = CGRectMake(0, self.contentHeight, footerReferenceSize.width, footerReferenceSize.height);
        
        self.contentHeight += footerReferenceSize.height;
    }
    
    return attributes;
}
 
@end
