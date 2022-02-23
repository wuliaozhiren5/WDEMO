//
//  SerachHistoryWordCollectionVC.m
//  WDEMO
//
//  Created by WDEMO on 2021/10/20.
//  Copyright © 2021 wwc. All rights reserved.
//

#import "SerachHistoryWordCollectionVC.h"
#import <Masonry/Masonry.h>
#import "WCollectionViewCell.h"
#import "UICollectionViewLeftAlignedLayout.h"

@interface SerachHistoryWordCollectionVC () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewLeftAlignedLayout *collectionLayout; 
@property (nonatomic, copy) NSArray *titleArr;

@end

@implementation SerachHistoryWordCollectionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    
    self.titleArr = @[
        @"测试",
        @"生活大爆炸",
        @"爱情",
        @"LOVE",
        @"港剧",
        @"巾帼枭雄之义海豪情",
        @"大时代",
        @"男亲女爱",
        @"美剧",
        @"老友记",
        @"风骚律师",
        @"绝命毒师",
        @"权力的游戏",
        @"123",
        @"喜剧",
        @"悲剧",
        @"很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长",
        @"短",
    ];
    
    [self setupViews];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (void)setupViews {
    self.collectionLayout = [[UICollectionViewLeftAlignedLayout alloc] init];
    self.collectionLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.collectionLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    self.collectionLayout.estimatedItemSize = CGSizeZero;                 //关闭模拟高度,8.0系统模拟高度会导致崩溃。mmp。
    self.collectionLayout.minimumLineSpacing = 10;                        //水平间距
    self.collectionLayout.minimumInteritemSpacing = 10;
//    self.collectionLayout.headerReferenceSize = CGSizeMake(KWidth, 18);   //组头视图高度
    
     
    //初始化collectionView
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:self.collectionLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator =NO;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
    [self.collectionView registerClass:[WCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([WCollectionViewCell class])];
    [self.collectionView registerNib:[UINib nibWithNibName:@"WCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"xib"];
 
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"Footer"];
    
    [self.view addSubview:self.collectionView];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view);
        make.top.equalTo(self.view);
        make.leading.equalTo(self.view);
        make.trailing.equalTo(self.view);
        make.height.equalTo(@300);
        
        //二行 10 + 20 + 10 + 20 + 10
//        make.height.equalTo(@70);
    }];
}

#pragma mark --UICollectionViewDataSource
//有多少组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
        return 1;
}
///每一组有多少个cell
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
        return self.titleArr.count;
}


//定义并返回每个cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    //    UICollectionViewCell *cell = (UICollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class]) forIndexPath:indexPath];
    //    cell.contentView.backgroundColor = [UIColor grayColor];
    //    return cell;
    
    
    //代码
//    WCollectionViewCell *cell = (WCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([WCollectionViewCell class]) forIndexPath:indexPath];
//    cell.contentView.backgroundColor = [UIColor grayColor];
//    NSString *str = [NSString stringWithFormat:@"%zi:%zi", indexPath.section, indexPath.item];
//    cell.titleLabel.text = str;
    
    //xib
    WCollectionViewCell *cell = (WCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"xib" forIndexPath:indexPath];
//    NSString *str = [NSString stringWithFormat:@"xib=%zi:%zi", indexPath.section, indexPath.item];
    NSString *str = self.titleArr[indexPath.item];
    cell.xibLabel.text = str;
    cell.contentView.backgroundColor = [UIColor grayColor];
    return cell;
}

#pragma mark -- UICollectionViewDelegate
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //iOS 中获取当前点击的cell
    //一般情况，cell不是自定义
    UICollectionViewCell *cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath]; //即为要得到的cell
    //自定义的cell
//    TitleViewCell * cell = (TitleViewCell *)[self collectionView:collectionView cellForItemAtIndexPath:indexPath];//即为要得到的cell
    
    cell.contentView.backgroundColor = [UIColor redColor];
    NSLog(@"%@",cell);

}

//CGSize itemSize：它定义了每一个item的大小，通过itemSize可以快捷给每一个cell设置一样的大小，如果你想到不同的尺寸，-collectionView:layout:sizeForItemAtIndexPath:来给每一个item指定不同的尺寸。
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *str = self.titleArr[indexPath.item];
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
    titleLab.text = str;
    CGSize size = [titleLab sizeThatFits:CGSizeMake(MAXFLOAT, 20)];
    CGFloat width = size.width;
    CGFloat maxWidth = KWidth - 10 * 2;
    if (width >= maxWidth) {
        width = maxWidth;
    }
    return CGSizeMake(width, 20);
}

//// 设置Header的尺寸
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
//
//    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
//    return CGSizeMake(screenWidth/2-5-50, 100);
//}
//
//// 设置Footer的尺寸
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
//
//    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
//    return CGSizeMake(screenWidth/2-5-50, 100);
//}


//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
//
//    if ([kind isEqualToString:UICollectionElementKindSectionHeader]){
//
//        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"Header" forIndexPath:indexPath];
//        header.backgroundColor = [UIColor systemBlueColor];
//        return header;
//
//    } else if ([kind isEqualToString:UICollectionElementKindSectionFooter]){
//
//        UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"Footer" forIndexPath:indexPath];
//        footer.backgroundColor = [UIColor systemBlueColor];
//        return footer;
//
//    } else {
//        return nil;
//    }
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
