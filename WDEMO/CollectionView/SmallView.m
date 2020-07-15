//
//  SmallView.m
//  WDEMO
//
//  Created by Sun on 2020/7/12.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "SmallView.h"
@interface SmallView () <UICollectionViewDelegate, UICollectionViewDataSource>

@property(strong , nonatomic)UICollectionView *collectionView;
@end
@implementation SmallView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addView];
    }
    return self;
}

- (void)addView {


    // 创建布局
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    
    //设置单元格大小
    layout.itemSize = CGSizeMake(100, 100);
    
    //最小行间距(默认为10)
    
    layout.minimumLineSpacing = 10;
    
    //最小item间距（默认为10）
    
    layout.minimumInteritemSpacing = 10;
    
    //设置senction的内边距
    
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
 
    
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    // 创建collectionView
    CGFloat collectionViewW = self.frame.size.width;
    CGFloat collectionViewH = 200;
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 100, collectionViewW, collectionViewH) collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor blackColor];
    self.collectionView.dataSource = self;
    [self addSubview:self.collectionView];
    
    
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
    
    self.collectionView.contentInset = UIEdgeInsetsMake(0, 300, 0, 0);
    
    
//    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC));
//
//    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
//
//
//       NSIndexPath *indexPath = [NSIndexPath indexPathForItem:49 inSection:0 ];
//       [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
//
//        }
//    );
}


#pragma mark - <UICollectionViewDataSource>
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 50;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class]) forIndexPath:indexPath];
    
    // 设置圆角
    cell.layer.cornerRadius = 5.0;
    cell.layer.masksToBounds = YES;
    cell.backgroundColor = [UIColor redColor];
    
    
    return cell;
}

@end

 
