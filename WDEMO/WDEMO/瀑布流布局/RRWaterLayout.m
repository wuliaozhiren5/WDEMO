//
//  RRWaterLayout.m
//  WDEMO
//
//  Created by rrtv on 2021/1/13.
//  Copyright © 2021 wwc. All rights reserved.
//

#import "RRWaterLayout.h"
/** 默认的列数    */
static const NSInteger DefaultColumnCount = 3;

/** 每一列之间的间距    */
static const CGFloat DefaultInteritemSpacing = 10;

/** 每一行之间的间距    */
static const CGFloat DefaultLineSpacing = 10;

/** 内边距    */
static const UIEdgeInsets DefaultSectionInset = {10, 10, 10, 10};

@interface RRWaterLayout ()
//行间距
@property (nonatomic, assign) CGFloat lineSpacing;
//列间距
@property (nonatomic, assign) CGFloat interitemSpacing;
//列数
@property (nonatomic, assign) NSInteger columnCount;
//每个senction的内边距
@property (nonatomic, assign) UIEdgeInsets sectionInset;
//存放所有的布局属性
@property (nonatomic, strong) NSMutableArray *attrsArray;
//存放所有列的当前高度
@property (nonatomic, strong) NSMutableArray *columnHeights;
//内容的高度
@property (nonatomic, assign) CGFloat contentHeight;
//第一行元素的开始的位置：头的高度+内边距 header.size.height + sectionInset.top
@property (nonatomic, assign) CGFloat contentStartOffsetY;

@end
@implementation RRWaterLayout
#pragma mark - 数据处理

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

/**
 * 初始化
 * 每次布局都会调用
 */
- (void)prepareLayout
{
    [super prepareLayout];
    
    //清除之前计算的所有高度，因为刷新的时候回调用这个方法
    [self.columnHeights removeAllObjects];
    //把初始化的操作都放到这里
    [self.attrsArray removeAllObjects];
    
    self.contentHeight = 0;
    self.contentStartOffsetY = 0;
    
    self.lineSpacing = DefaultLineSpacing;
    self.interitemSpacing = DefaultInteritemSpacing;
    self.columnCount = DefaultColumnCount;
    self.sectionInset = DefaultSectionInset;
    
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
            self.sectionInset = [self.delegate collectionView:self.collectionView layout:self insetForSectionAtIndex:indexPath.section];
        }
        if ([self.delegate respondsToSelector:@selector(collectionView:layout:minimumLineSpacingForSectionAtIndex:)]) {
            self.lineSpacing = [self.delegate collectionView:self.collectionView layout:self minimumLineSpacingForSectionAtIndex:indexPath.section];
        }
        if ([self.delegate respondsToSelector:@selector(collectionView:layout:minimumInteritemSpacingForSectionAtIndex:)]) {
            self.interitemSpacing = [self.delegate collectionView:self.collectionView layout:self minimumInteritemSpacingForSectionAtIndex:indexPath.section];
        }
        
        //1 初始化 header
        //获取header的UICollectionViewLayoutAttributes
        UICollectionViewLayoutAttributes *headerAttrs = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:indexPath];
        [self.attrsArray addObject:headerAttrs];
        
        //清空
        [self.columnHeights removeAllObjects];
        self.contentStartOffsetY = self.contentHeight;
        
        //2 初始化区的 y 值
        for (NSInteger i = 0; i < self.columnCount; i++) {
            //            [self.columnHeights addObject:@(self.sectionInset.top)];
            [self.columnHeights addObject:@(self.contentHeight)];
        }
        
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

/**
 * 决定cell的布局属性
 */
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.attrsArray;
}

/**
 * 内容的高度
 */
- (CGSize)collectionViewContentSize
{
    return CGSizeMake(self.collectionView.frame.size.width, self.contentHeight);
}

/**
 * 返回indexPath位置cell对应的布局属性
 */
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //每个区的初始化高度
    if ([self.delegate respondsToSelector:@selector(collectionView:layout:columnNumberInSection:)]) {
        self.columnCount = [self.delegate collectionView:self.collectionView layout:self columnNumberInSection:indexPath.section];
    }
    if ([self.delegate respondsToSelector:@selector(collectionView:layout:insetForSectionAtIndex:)]) {
        self.sectionInset = [self.delegate collectionView:self.collectionView layout:self insetForSectionAtIndex:indexPath.section];
    }
    if ([self.delegate respondsToSelector:@selector(collectionView:layout:minimumLineSpacingForSectionAtIndex:)]) {
        self.lineSpacing = [self.delegate collectionView:self.collectionView layout:self minimumLineSpacingForSectionAtIndex:indexPath.section];
    }
    if ([self.delegate respondsToSelector:@selector(collectionView:layout:minimumInteritemSpacingForSectionAtIndex:)]) {
        self.interitemSpacing = [self.delegate collectionView:self.collectionView layout:self minimumInteritemSpacingForSectionAtIndex:indexPath.section];
    }
    
    // 创建布局属性
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    //collectionView的宽度
    CGFloat collectionViewW = self.collectionView.frame.size.width;
    
    //设置布局属性的frame
    CGFloat w = (collectionViewW - self.sectionInset.left - self.sectionInset.right - (self.columnCount - 1) * self.interitemSpacing) / self.columnCount;
    
    CGFloat h =  [self.delegate collectionView:self.collectionView layout:self heightForRowAtIndexPath:indexPath itemWidth:w];
    
    //找出最短的那一列
    NSInteger destColumn = 0;
    
    CGFloat minColumnHeight = [self.columnHeights[0] doubleValue];
    
    for (NSInteger i = 0; i < self.columnCount; i++) {
        
        // 取得第i列的高度
        CGFloat columnHeight = [self.columnHeights[i] doubleValue];
        
        if (minColumnHeight > columnHeight) {
            minColumnHeight = columnHeight;
            destColumn = i;
        }
    }
    
    CGFloat x = self.sectionInset.left + destColumn * (w + self.interitemSpacing);
    CGFloat y = minColumnHeight;
    if (y != self.contentStartOffsetY) {
        y += self.lineSpacing;
    }
    
    attrs.frame = CGRectMake(x, y, w, h);
    
    // 更新最短那一列的高度
    self.columnHeights[destColumn] = @(CGRectGetMaxY(attrs.frame));
    
    // 记录内容的高度 - 即最长那一列的高度
    CGFloat columnHeight = [self.columnHeights[destColumn] doubleValue];
    if (self.contentHeight < columnHeight) {
        self.contentHeight = columnHeight;
    }
    return attrs;
    
}

/**
 * 返回indexPath位置header和footer对应的布局属性
 */
- (UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:elementKind withIndexPath:indexPath];
    
    if ([elementKind isEqualToString:UICollectionElementKindSectionHeader]) {
        CGSize headerReferenceSize;
        if ([_delegate respondsToSelector:@selector(collectionView:layout:referenceSizeForHeaderInSection:)]) {
            headerReferenceSize = [_delegate collectionView:self.collectionView layout:self referenceSizeForHeaderInSection:indexPath.section];
        }
                
        attributes.frame = CGRectMake(0, self.contentHeight, headerReferenceSize.width, headerReferenceSize.height);
        
        self.contentHeight += headerReferenceSize.height;
        self.contentHeight += self.sectionInset.top;
        
    } else if ([elementKind isEqualToString:UICollectionElementKindSectionFooter] ){
        CGSize footerReferenceSize;
        if ([_delegate respondsToSelector:@selector(collectionView:layout:referenceSizeForFooterInSection:)]) {
            footerReferenceSize = [_delegate collectionView:self.collectionView layout:self referenceSizeForFooterInSection:indexPath.section];
        }
        
        self.contentHeight += self.sectionInset.bottom;
        
        attributes.frame = CGRectMake(0, self.contentHeight, footerReferenceSize.width, footerReferenceSize.height);
        
        self.contentHeight += footerReferenceSize.height;
    }
    
    return attributes;
}

@end
