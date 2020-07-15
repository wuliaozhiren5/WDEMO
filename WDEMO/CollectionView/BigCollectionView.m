//
//  BigCollectionView.m
//  WDEMO
//
//  Created by Sun on 2020/7/12.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "BigCollectionView.h"
#import "SmallBigCollectionViewCell.h"

@interface BigCollectionView () <UICollectionViewDelegate, UICollectionViewDataSource>

@end
@implementation BigCollectionView

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

-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    CGFloat offSet = targetContentOffset->y;
    CGFloat width = self.frame.size.height - 20;
    
    NSInteger pageWidth = width + 20;
    NSInteger pageNum = (offSet + pageWidth/2)/pageWidth;
    targetContentOffset->y = pageWidth*pageNum;
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:pageNum inSection:0];
    [self.smallsCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];

}
@end
 
