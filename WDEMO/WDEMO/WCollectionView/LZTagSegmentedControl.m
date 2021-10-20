//
//  LZTagSegmentedControl.m
//  xxx
//
//  Created by xxx on 2017/10/31.
//  Copyright © 2017年 developer. All rights reserved.
//
#import "LZTagListCell.h"

#import "LZTagSegmentedControl.h"
@interface LZTagSegmentedControl ()<UICollectionViewDelegate, UICollectionViewDataSource>

//tag
@property(strong , nonatomic)UICollectionView *collectionView;

@property(strong , nonatomic)UIView *line;

@property(strong , nonatomic)UIView *moveline;

@property(strong , nonatomic)UIView *moveCircle;

@property(assign , nonatomic)BOOL isfirstAnimate;

@end

@implementation LZTagSegmentedControl

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
//        [self addView];
    }
    return self;
}

- (void)addView {
//    _tagArr = @[@"测试全部",
//                @"全部1",
//                @"全部2",
//                @"全部3",
//                @"全部4",
//                @"全部5",
//                @"全部6",
//                @"全部7",
//                @"全部8",
//                @"全部9",
//                @"全部10"];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    //水平
    flowLayout.scrollDirection= UICollectionViewScrollDirectionHorizontal;
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5);
    //    Math中的round/ceil/floorf方法总结
    flowLayout.itemSize = CGSizeMake(100, 40);
    //    设置同一列中间隔的cell最小间距
    flowLayout.minimumInteritemSpacing = 8.0;
    //     设置最小行间距
    flowLayout.minimumLineSpacing = 8.0;
    
    //初始化collectionView
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator =NO;
    self.collectionView.backgroundColor = [UIColor redColor];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
    [self.collectionView registerClass:[LZTagListCell class] forCellWithReuseIdentifier:NSStringFromClass([LZTagListCell class])];
    
    [self addSubview:self.collectionView];
    
    self.collectionView.frame = self.bounds;
    
    //    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.leading.trailing.top.equalTo(self);
    //        make.height.equalTo(@40);
    //    }];
    
    self.line = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height - 0.5, self.frame.size.width, 0.5)];
    //    self.line.backgroundColor = [UIColor colorFromHexRGB:@"E8E9ED"];
    self.line.backgroundColor = [UIColor grayColor];
    [self addSubview:self.line];
    //    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.leading.trailing.bottom.equalTo(self);
    //        make.height.equalTo(@0.5);
    //    }];
    
    self.moveline = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height - 10, 10, 5)];
    self.moveline.backgroundColor = [UIColor purpleColor];
    [self.collectionView addSubview:self.moveline];
    
    self.moveCircle = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, self.frame.size.height - 10)];
    self.moveCircle.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:0.5];
    self.moveCircle.layer.cornerRadius = (self.frame.size.height - 10) / 2;
    self.moveCircle.layer.masksToBounds = YES;
    [self.collectionView addSubview:self.moveCircle];
    
//    UIFont *font = [UIFont systemFontOfSize:15.0];
//    NSString *text = @"全部";
//    CGSize maxSize = CGSizeMake(0, MAXFLOAT);
//    CGSize textSize = CGSizeZero;
//
//    NSStringDrawingOptions opts = NSStringDrawingUsesLineFragmentOrigin |
//    NSStringDrawingUsesFontLeading;
//
//    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
//    [style setLineBreakMode:NSLineBreakByCharWrapping];
//
//    NSDictionary *attributes = @{ NSFontAttributeName : font, NSParagraphStyleAttributeName : style };
//
//    CGRect rect = [text boundingRectWithSize:maxSize
//                                     options:opts
//                                  attributes:attributes
//                                     context:nil];
//    textSize = rect.size;
//
//    _index = 0;
}

#pragma mark --UICollectionViewDataSource
//有多少组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

///每一组有多少个cell
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)sectio
{
    return _tagArr.count;
}

//定义并返回每个cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LZTagListCell *cell = (LZTagListCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([LZTagListCell class]) forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    
    BOOL isUserSelected = (indexPath.item == _index);
    cell.isUserSelected = isUserSelected;
    cell.tagStr = _tagArr[indexPath.item];
    cell.tagBtn.tag = indexPath.item;
    [cell.tagBtn addTarget:self action:@selector(clickCell:) forControlEvents:UIControlEventTouchUpInside];
    
    //动画
    //被选中
    if (isUserSelected) {
        //初始化时候（第一次），不需要动画
        if (!self.isfirstAnimate) {
            self.isfirstAnimate = YES;
            CGPoint center = cell.center;
            center.y = self.moveline.center.y;
            self.moveline.center = center;
            
            CGRect frame = cell.frame;
            self.moveCircle.frame = CGRectMake(frame.origin.x, frame.origin.y + 5, cell.frame.size.width, cell.frame.size.height - 10);
        } else {
            [UIView animateWithDuration:0.2
                                  delay:0.01
                                options:UIViewAnimationOptionCurveEaseInOut
                             animations:^{
                CGPoint center = cell.center;
                center.y = self.moveline.center.y;
                self.moveline.center = center;
                
                CGRect frame = cell.frame;
                self.moveCircle.frame = CGRectMake(frame.origin.x, frame.origin.y + 5, cell.frame.size.width, cell.frame.size.height - 10);
            } completion:nil];
        }
    }
    return cell;
}

- (void)clickCell:(UIButton *)btn {
    
    if (_index == btn.tag) {
        return;
    } else {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:btn.tag inSection:0];
        [self didSelectItemAtIndexPath:indexPath];
        if ([_delegate respondsToSelector:@selector(tagSegmentedControl:didSelectItemAtIndex:)]) {
            [_delegate tagSegmentedControl:self didSelectItemAtIndex:_index];
        }
    }
    
}
#pragma mark -- UICollectionViewDelegate
//UICollectionView被选中时调用的方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //    if (_index == indexPath.item ) {
    //        return;
    //    } else {
    //        [self didSelectItemAtIndexPath:indexPath];
    //        if ([_delegate respondsToSelector:@selector(tagSegmentedControl:didSelectItemAtIndex:)]) {
    //            [_delegate tagSegmentedControl:self didSelectItemAtIndex:_index];
    //        }
    //    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UIFont *font = [UIFont systemFontOfSize:12.0];
    
    BOOL isUserSelected = (indexPath.item == _index);
    //动画
    if (isUserSelected) {
        font = [UIFont systemFontOfSize:20.0];
    }
    
    NSString *text = _tagArr[indexPath.item];
    CGSize maxSize = CGSizeMake(0, MAXFLOAT);
    CGSize textSize = CGSizeZero;
    
    NSStringDrawingOptions opts = NSStringDrawingUsesLineFragmentOrigin |
    NSStringDrawingUsesFontLeading;
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineBreakMode:NSLineBreakByCharWrapping];
    
    NSDictionary *attributes = @{ NSFontAttributeName : font, NSParagraphStyleAttributeName : style };
    
    CGRect rect = [text boundingRectWithSize:maxSize
                                     options:opts
                                  attributes:attributes
                                     context:nil];
    textSize = rect.size;
    //    return CGSizeMake(60, 40);
    //    if (rect.size.width >= 40) {
    return CGSizeMake(rect.size.width + 16, 40);
    //    } else  {
    //        return CGSizeMake(40 + 16, 40);
    //    }
    //    return CGSizeMake(rect.size.width + 16, 40);
}


- (void)didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell * cell = (UICollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    if ( self.collectionView.contentSize.width < self.collectionView.frame.size.width) {
        
        [self.collectionView setContentOffset:CGPointMake(0, 0) animated:YES];
    } else {
        if (cell.frame.size.width/2 + cell.frame.origin.x - self.collectionView.frame.size.width/2 <=0) {
            [self.collectionView setContentOffset:CGPointMake(0, 0) animated:YES];
            
        } else if (cell.frame.size.width/2 + cell.frame.origin.x > self.collectionView.contentSize.width - self.collectionView.frame.size.width/2 ){
            
            [self.collectionView setContentOffset:CGPointMake(self.collectionView.contentSize.width - self.collectionView.frame.size.width, 0) animated:YES];
            
        }else {
            
            [self.collectionView setContentOffset:CGPointMake(cell.frame.size.width/2 + cell.frame.origin.x - self.collectionView.frame.size.width/2 , 0) animated:YES];
        }
    }
    _index = indexPath.item;
    [self.collectionView reloadData];
}

- (void)setIndex:(NSInteger)index {
    
    _index = index;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    [self didSelectItemAtIndexPath:indexPath];
    
}

////header高度
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section;{
//
//    return  CGSizeMake(200, 100);
//
//}
//
////Footer高度
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
//
//    return  CGSizeMake(200, 100);
//}
#pragma mark - UICollectionViewDelegateFlowLayout

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"进入A_View---hitTest withEvent ---");
    UIView * view = [super hitTest:point withEvent:event];
    NSLog(@"离开A_View--- hitTest withEvent ---hitTestView:%@",view);
    return view;
}

- (void)setTagArr:(NSArray *)tagArr{
    _tagArr = tagArr;
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self addView];
 }
@end

