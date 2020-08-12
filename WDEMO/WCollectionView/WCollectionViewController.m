//
//  WCollectionViewController.m
//  WDEMO
//
//  Created by rrtv on 2020/7/21.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "WCollectionViewController.h"
#import <Masonry/Masonry.h>
#import "WCollectionViewCell.h"

@interface WCollectionViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property(strong , nonatomic)UICollectionView *collectionView;

@end

@implementation WCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    //水平
    flowLayout.scrollDirection= UICollectionViewScrollDirectionHorizontal;
    //垂直
    //    flowLayout.scrollDirection= UICollectionViewScrollDirectionVertical;
    
    //设置senction的内边距
    flowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    //    Math中的round/ceil/floorf方法总结
    flowLayout.itemSize = CGSizeMake(100, 100);
    //    设置同一列中间隔的cell最小间距
    flowLayout.minimumInteritemSpacing = 10.0;
    //     设置最小行间距
    flowLayout.minimumLineSpacing = 10.0;
    
    //初始化collectionView
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator =NO;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
    [self.collectionView registerClass:[WCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([WCollectionViewCell class])];
    
    [self.view addSubview:self.collectionView];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.edges.equalTo(self.view);
        make.top.leading.trailing.equalTo(self.view);
        make.height.equalTo(@150);
    }];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark --UICollectionViewDataSource
//有多少组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    //    return 1;
    
    return 2;
}
///每一组有多少个cell
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //    return 100;
    
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 50;
            break;
        default:
            return 0;
            break;
    }
}
//
//定义并返回每个cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    //    UICollectionViewCell *cell = (UICollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class]) forIndexPath:indexPath];
    //    cell.contentView.backgroundColor = [UIColor grayColor];
    //    return cell;
    
    WCollectionViewCell *cell = (WCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([WCollectionViewCell class]) forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor grayColor];
    NSString *str = [NSString stringWithFormat:@"%zi:%zi", indexPath.section, indexPath.row];
    cell.titleLabel.text = str;
    return cell;
    
    
}
//
//
#pragma mark -- UICollectionViewDelegate
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView UICollectionViewDelegate:(NSIndexPath *)indexPath
{
    return YES;
}

//// 设置Header的尺寸
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
//
//    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
//
//    return CGSizeMake(screenWidth/2-5-50, 100);
//}
//
//// 设置Footer的尺寸
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
//
//    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
//
//    return CGSizeMake(screenWidth/2-5-50, 100);
//}
//
//
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
//
//
//    if ([kind isEqualToString:UICollectionElementKindSectionHeader]){
//
//        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"Header" forIndexPath:indexPath];
////        header.backgroundColor = [UIColor whiteColor];
//        return header;
//
//    } else if ([kind isEqualToString:UICollectionElementKindSectionFooter]){
//
//        UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"Footer" forIndexPath:indexPath];
////        footer.backgroundColor = [UIColor whiteColor];
//        return footer;
//
//    } else {
//        return nil;
//    }
//
//
//}



#pragma mark -- UICollectionViewDelegateFlowLayout
/*
//CGSize itemSize：它定义了每一个item的大小，通过itemSize可以快捷给每一个cell设置一样的大小，如果你想到不同的尺寸，-collectionView:layout:sizeForItemAtIndexPath:来给每一个item指定不同的尺寸。
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(100, 100);
}
 
 //UIEdgeInsets sectionInset：组内边距，设置UIcollectionView整体的组内边距，同上有特定方法-collectionView:insetForSectionAtIndex:设置具体的边距
 - (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section  {
     //设置senction的内边距
     return UIEdgeInsetsMake(5, 5, 5, 5);
 }
 
 //CGFloat minimumLineSpacing：最小行间隔，同样你也可以通过-* collectionView:minimumLineSpacingForSectionAtIndex:方法来个没一行设置不同的行间距
 - (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section  {
     //     设置最小行间距
     return 10.0;

 }
 
 //CGFloat minimumInteritemSpacing：最小cell之间的距离，同上都是可以通过-collectionView:minimumInteritemSpacingForSectionAtIndex:特定的方法，顶底到具体的行和item之间的间距的，非常的灵活。
 - (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
     //    设置同一列中间隔的cell最小间距
     return 10.0;

 }
 
 //CGSize headerReferenceSize：设置supplementary header View的大小-collectionView:referenceSizeForHeaderInSection:
 - (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section  {
     
 }

 //CGSize footerReferenceSize：设置supplementary header View的大小-collectionView:referenceSizeForFooterInSection:
 - (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
     
 }
*/

@end
