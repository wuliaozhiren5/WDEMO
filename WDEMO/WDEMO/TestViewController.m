//
//  TestViewController.m
//  WDEMO
//
//  Created by rrtv on 2020/8/12.
//  Copyright © 2020 wwc. All rights reserved.
//

#define LivingSectionInset UIEdgeInsetsMake(0, 20, 0, 20)
//一个
#define LivingOneItemSize CGSizeMake(self.view.bounds.size.width - 20 * 2 , 73);
#define LivingOneItemSpacing 20
//多个
#define LivingMoreItemSize CGSizeMake(self.view.bounds.size.width - 20 - 57 , 73);
#define LivingMoreItemSpacing 12


#import "TestViewController.h"
#import <Masonry/Masonry.h>
#import "WCollectionViewCell.h"
#import "SeeLivingBaseCell.h"

@interface TestViewController ()<UICollectionViewDelegate, UICollectionViewDataSource,SeeLivingCellDelegate>

@property(strong , nonatomic)UICollectionView *collectionView;
@property(copy , nonatomic)NSArray *data;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
//    RRChannelControlHeadView
    
    
    //    self.data = @[@"1"];
    self.data = @[@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1"];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    
    //水平
    flowLayout.scrollDirection= UICollectionViewScrollDirectionHorizontal;
    //垂直
    //    flowLayout.scrollDirection= UICollectionViewScrollDirectionVertical;
    
    //设置senction的内边距
    //    flowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    //    Math中的round/ceil/floorf方法总结
    //    flowLayout.itemSize = CGSizeMake(100, 100);
    //    设置同一列中间隔的cell最小间距
    //    flowLayout.minimumInteritemSpacing = 20.0;
    //    //     设置最小行间距
    //    flowLayout.minimumLineSpacing = 20.0;
    
    //初始化collectionView
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator =NO;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    //    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
    [self.collectionView registerClass:[RRSubscribeSeeLivingCell class] forCellWithReuseIdentifier:NSStringFromClass([RRSubscribeSeeLivingCell class])];
    
    [self.collectionView registerClass:[RRSeeLivingCell class] forCellWithReuseIdentifier:NSStringFromClass([RRSeeLivingCell class])];
    
    
    [self.view addSubview:self.collectionView];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.edges.equalTo(self.view);
        make.top.leading.trailing.equalTo(self.view);
        make.height.equalTo(@173);
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
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
///每一组有多少个cell
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    //    return 100;
    
    switch (section) {
        case 0:
            return self.data.count;
        default:
            return 0;
            break;
    }
}
//
//定义并返回每个cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    //    RRSubscribeSeeLivingCell *cell = (RRSubscribeSeeLivingCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([RRSubscribeSeeLivingCell class]) forIndexPath:indexPath];
    //    cell.contentView.backgroundColor = [UIColor grayColor];
    ////    NSString *str = [NSString stringWithFormat:@"%zi:%zi", indexPath.section, indexPath.row];
    ////    cell.titleLabel.text = str;
    //    [cell fillWithData:nil];
    
    RRSeeLivingCell *cell = (RRSeeLivingCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([RRSeeLivingCell class]) forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor grayColor];
    cell.delegate = self;
    //    NSString *str = [NSString stringWithFormat:@"%zi:%zi", indexPath.section, indexPath.row];
    //    cell.titleLabel.text = str;
    [cell fillWithData:nil];
    
    
    return cell;
}
//
//
#pragma mark -- UICollectionViewDelegate
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.data.count > 1) {
        return LivingMoreItemSize;
    }else {
        return LivingOneItemSize;
    }
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return LivingSectionInset;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    if (self.data.count > 1) {
        return LivingMoreItemSpacing;
    }else {
        return LivingOneItemSpacing;
    }
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}


#pragma mark -- SeeLivingCellDelegate
- (void)seeLivingCell:(SeeLivingBaseCell *)cell subscribe:(SeeLivingModel *)data {
    
}

- (void)seeLivingCell:(SeeLivingBaseCell *)cell firstLook:(SeeLivingModel *)data {
    
}

- (void)seeLivingCell:(SeeLivingBaseCell *)cell seeLiving:(SeeLivingModel *)data {
    
}

@end
