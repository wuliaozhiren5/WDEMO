//
//  SmallCollectionView.m
//  WDEMO
//
//  Created by Sun on 2020/7/12.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "SmallCollectionView.h"
#import "SmallBigCollectionViewCell.h"

@interface SmallCollectionView () <UICollectionViewDelegate, UICollectionViewDataSource>

@end
@implementation SmallCollectionView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
        [self addView];
        
    }
    return self;
    
}
- (void)addView {
    
    
    //    // 创建布局
    //    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    //
    //    //设置单元格大小
    //    layout.itemSize = CGSizeMake(100, 100);
    //
    //    //最小行间距(默认为10)
    //
    //    layout.minimumLineSpacing = 10;
    //
    //    //最小item间距（默认为10）
    //
    //    layout.minimumInteritemSpacing = 10;
    //
    //    //设置senction的内边距
    //
    //    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    //
    //
    //    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    //    // 创建collectionView
    //    CGFloat collectionViewW = self.frame.size.width;
    //    CGFloat collectionViewH = 200;
    
    //    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 100, collectionViewW, collectionViewH) collectionViewLayout:layout];
    //    self.collectionView.backgroundColor = [UIColor blackColor];
    
    
    self.dataSource = self;
    self.delegate = self;
    
    
    [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
    
    [self registerClass:[SmallBigCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([SmallBigCollectionViewCell class])];

    
    [self registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header"];
    [self registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"Footer"];
     
}


#pragma mark - <UICollectionViewDataSource>
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    SmallBigCollectionViewCell * cell = (SmallBigCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([SmallBigCollectionViewCell class]) forIndexPath:indexPath];
    
    NSString *str = [NSString stringWithFormat:@"%zi",indexPath.row];
    cell.titleLabel.text = str;
    
    // 设置圆角
    cell.layer.cornerRadius = 5.0;
    cell.layer.masksToBounds = YES;
    cell.backgroundColor = [UIColor redColor]; 
    return cell;
}


// 设置Header的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    return CGSizeMake(screenWidth/2-5-50, 100);
}

// 设置Footer的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    return CGSizeMake(screenWidth/2-5-50, 100);
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
     
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]){
        
        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"Header" forIndexPath:indexPath];
//        header.backgroundColor = [UIColor whiteColor];
        return header;
        
    } else if ([kind isEqualToString:UICollectionElementKindSectionFooter]){
        
        UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"Footer" forIndexPath:indexPath];
//        footer.backgroundColor = [UIColor whiteColor];
        return footer;
        
    } else {
        return nil;
    }
    
    
}


-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    CGFloat offSetX = targetContentOffset->x;
    CGFloat itemWidth = 100;
    NSInteger pageWidth = itemWidth + 10;
    
    NSInteger pageNum = (offSetX + pageWidth/2)/pageWidth;
    
    targetContentOffset->x = pageWidth * pageNum;
    
    self.currentIndex = pageNum;
}

@end
