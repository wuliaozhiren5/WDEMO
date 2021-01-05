//
//  LZTagListView.m
//  xxx
//
//  Created by xxx on 2017/10/30.
//  Copyright © 2017年 developer. All rights reserved.
//

#import "LZTagListView.h"
#import "LZTagListCell.h"
#import "LZTagSegmentedControl.h"
#import "WaterFlowLayout.h"
#import "CustomLayout.h"
//#import "ImageScrollView.h"
#import "WMacros.h"

@interface LZTagListView ()<LZTagSegmentedControlDelegate, UICollectionViewDelegate, UICollectionViewDataSource, WaterFlowLayoutDelegate>

////tag
@property(strong , nonatomic)UICollectionView *collectionView;
//
////列表
@property(copy , nonatomic)NSArray *tagArr;
//
//
@property(assign , nonatomic)NSInteger index;
////tag
//
@property(strong , nonatomic)LZTagSegmentedControl *segmentedControl;

//@property(strong , nonatomic)ImageScrollView *imageScrollView;

@property(strong , nonatomic)UIView *headerView;

@end

@implementation LZTagListView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addView];
    }
    return self;
}


-(void)addView{
    _tagArr = @[@"全部",
                @"全部1",
                @"全部2",
                @"全部3",
                @"全部4",
                @"全部5",
                @"全部6",
                @"全部7",
                @"全部8",
                @"全部9",];
 
//
//    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
//    //水平
//    flowLayout.scrollDirection= UICollectionViewScrollDirectionHorizontal;
//    flowLayout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5);
//    //    Math中的round/ceil/floorf方法总结
//    flowLayout.itemSize = CGSizeMake( 100, 40);
////    设置同一列中间隔的cell最小间距
//    flowLayout.minimumInteritemSpacing = 30.0;
////     设置最小行间距
//    flowLayout.minimumLineSpacing = 5.0;
//
//    //初始化collectionView
//    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
//    self.collectionView.delegate = self;
//    self.collectionView.dataSource = self;
//
//    self.collectionView.showsHorizontalScrollIndicator = NO;
//    self.collectionView.showsVerticalScrollIndicator =NO;
//    self.collectionView.backgroundColor = [UIColor whiteColor];
//
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
//    [self.collectionView registerClass:[LZTagListCell class] forCellWithReuseIdentifier:NSStringFromClass([LZTagListCell class])];
//
//    [self addSubview:self.collectionView];
//
//    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.leading.trailing.top.equalTo(self);
//        make.height.equalTo(@40);
//    }];
//
//
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
    
    
    WaterFlowLayout *layout = [[WaterFlowLayout alloc]init];
    layout.delegate = self;
   
//    //CS测试 CustomLayout
//    CustomLayout *layout = [[CustomLayout alloc]init];
//    layout.delegate = self;
    
    //初始化collectionView
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator =NO;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
    [self.collectionView registerClass:[LZTagListCell class] forCellWithReuseIdentifier:NSStringFromClass([LZTagListCell class])];
    [self.collectionView registerClass:[LZTagListCell class] forCellWithReuseIdentifier:@"0"];
    [self.collectionView registerClass:[LZTagListCell class] forCellWithReuseIdentifier:@"1"];
    [self.collectionView registerClass:[LZTagListCell class] forCellWithReuseIdentifier:@"2"];

    [self addSubview:self.collectionView];
    
    self.collectionView.frame = self.bounds;
//    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.leading.trailing.top.bottom.equalTo(self);
////        make.height.equalTo(@40);
//    }];
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ListHeader"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"Footer"];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH / IMAGEPLAYERVIEW_SCALE + 40)];
    _headerView = headerView;
    
//    ImageScrollView *imageScrollView = [[ImageScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    _imageScrollView = imageScrollView;
//    [_headerView addSubview:imageScrollView];
//    //    imagescrollView.imageScrollViewDelegate = self.delegate;
//    [imageScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(_headerView);
//        make.leading.trailing.equalTo(_headerView);
//        make.height.mas_equalTo(SCREEN_WIDTH / IMAGEPLAYERVIEW_SCALE);
//    }];
    
    LZTagSegmentedControl *segmentedControl = [[LZTagSegmentedControl alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    segmentedControl.backgroundColor = [UIColor yellowColor];
    segmentedControl.delegate = self;
    [_headerView addSubview:segmentedControl];
//    [segmentedControl mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.leading.trailing.bottom.equalTo(_headerView);
//        make.height.equalTo(@40);
//    }];
    _segmentedControl =segmentedControl;
    _index = 0;
}

#pragma mark - LZTagSegmentedControlDelegate
-(void)tagSegmentedControl:(LZTagSegmentedControl *)tagSegmentedControl
      didSelectItemAtIndex:(NSInteger)index{
    
}
#pragma mark --UICollectionViewDataSource
//有多少组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
} 
///每一组有多少个cell
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _tagArr.count;
}
//
//定义并返回每个cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
//    LZTagListCell *cell = (LZTagListCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([LZTagListCell class]) forIndexPath:indexPath];
//    cell.contentView.backgroundColor = [UIColor redColor];
////    cell.tagStr = _tagArr[indexPath.item];
//    cell.tagStr = @"全部";

//
//    if (indexPath.item == _index) {
//        cell.isHideLine = NO;
//    } else {
//        cell.isHideLine = YES;
//    }
//    //    if (indexPath.row >= 0 && indexPath.row < self.data.count) {
//    //        cell.myInventoryModel=self.data[indexPath.row];
//    //    }
    
//    return cell;

    switch (indexPath.section) {
        case 0:
        {
            LZTagListCell *cell = (LZTagListCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"0" forIndexPath:indexPath];
            cell.contentView.backgroundColor = [UIColor redColor];
            //    cell.tagStr = _tagArr[indexPath.item];
            cell.tagStr = @"全部0";
            return cell;
        }
            
            break;
        case 1:
            
        {
            LZTagListCell *cell = (LZTagListCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"1" forIndexPath:indexPath];
            cell.contentView.backgroundColor = [UIColor redColor];
            //    cell.tagStr = _tagArr[indexPath.item];
            cell.tagStr = @"全部1";
            return cell;
        }
            
            break;
      
        default:
        {
            LZTagListCell *cell = (LZTagListCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"2" forIndexPath:indexPath];
            cell.contentView.backgroundColor = [UIColor redColor];
            //    cell.tagStr = _tagArr[indexPath.item];
            cell.tagStr = @"全部2";
            return cell;
        }
            
            break;
    }
}
//
//
#pragma mark -- UICollectionViewDelegate
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
//
//    if (cell.frame.size.width/2 + cell.frame.origin.x - self.collectionView.frame.size.width/2 <=0) {
//        [self.collectionView setContentOffset:CGPointMake(0, 0) animated:YES];
//
//    } else if (cell.frame.size.width/2 + cell.frame.origin.x > self.collectionView.contentSize.width - self.collectionView.frame.size.width/2 ){
//
//        [self.collectionView setContentOffset:CGPointMake(self.collectionView.contentSize.width - self.collectionView.frame.size.width, 0) animated:YES];
//    }else {
//
//        [self.collectionView setContentOffset:CGPointMake(cell.frame.size.width/2 + cell.frame.origin.x - self.collectionView.frame.size.width/2 , 0) animated:YES];
//    }
//
//    _index = indexPath.item;
//
//    [self.collectionView reloadData];
    
////    _line.frame =cell.frame;
//    [UIView animateWithDuration:0.5
//                          delay:0.0
//                        options:UIViewAnimationOptionCurveEaseInOut
//                     animations:^{
//                         _line.frame =cell.frame;
//
//                     }
//                     completion:^(BOOL finished) {
//
//                     }];
}

//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView UICollectionViewDelegate:(NSIndexPath *)indexPath
{
    return YES;
}
//
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    
//    UIFont *font = [UIFont systemFontOfSize:15.0];
//    NSString *text = _tagArr[indexPath.item];
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
//    //    return CGSizeMake(60, 40);
//    return CGSizeMake(rect.size.width + 20, 40);
//}

#pragma mark - WaterFlowLayoutDelegate
// 每个cell高度
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForRowAtIndexPath:(NSIndexPath *)indexPath itemWidth:(CGFloat)itemWidth {
    switch (indexPath.section) {
        case 0:
            
            return 100;
            
            break;
        case 1:
            return 100;
//            return 100 + arc4random() % 100;
            break;
        case 2:
            
            return 100;
            
            break;
        default:
            
            return 0;
            
            break;
    }
}

// 每个区多少列
- (NSInteger)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout columnNumberInSection:(NSInteger )section {
   
    switch (section) {
        case 0:
            
            return 1;

            break;
        case 1:
            
            return 2;

            break;
        case 2:
            
            return 3;

            break;
        default:
            
            return 0;
            
            break;
    }
}

//CS测试 CustomLayout
// 每个区多少列
- (NSInteger)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout columnNumberAtSection:(NSInteger)section {
    
    switch (section) {
        case 0:
            
            return 1;
            
            break;
        case 1:
            
            return 2;
            
            break;
        case 2:
            
            return 3;
            
            break;
        default:
            
            return 0;
            
            break;
    }
}


//// header
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
  
    switch (section) {
        case 0:
            
            return CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH / IMAGEPLAYERVIEW_SCALE + 40);

            break;
        default:
            return CGSizeZero;
            break;
    }
}

//// footer
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
//   
//    return CGSizeZero;
//}

//定义并返回每个headerView或footerView
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.section) {
        case 0:
        {
            if ([kind isEqualToString:UICollectionElementKindSectionHeader]){
                
                UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"ListHeader" forIndexPath:indexPath];
                [header addSubview:_headerView];
                return header;
                
            } else if ([kind isEqualToString:UICollectionElementKindSectionFooter]){
                
                UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"Footer" forIndexPath:indexPath];
                 return footer;
                
            } else {
                return nil;
            }
        }
            break;
            
        default:
        {
            if ([kind isEqualToString:UICollectionElementKindSectionHeader]){
                
                UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"Header" forIndexPath:indexPath];
                 return header;
                
            } else if ([kind isEqualToString:UICollectionElementKindSectionFooter]){
                
                UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"Footer" forIndexPath:indexPath];
                return footer;
                
            } else {
                
                return nil;
            }
            
        }
            
            break;
    }
}
 
/*
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (scrollView.contentOffset.y > _headerView.size.height-40) {
        [self addSubview:_segmentedControl];
//        [_segmentedControl mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.leading.trailing.top.equalTo(_headerView);
//            make.height.equalTo(@40);
//        }];
    }else {
        [_headerView addSubview:_segmentedControl];
//        [_segmentedControl mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.leading.trailing.bottom.equalTo(_headerView);
//            make.height.equalTo(@40);
//        }];
    }
 

}
 */

@end
