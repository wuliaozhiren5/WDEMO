//
//  GaoDengViewController.m
//  WDEMO
//
//  Created by Sun on 2020/7/12.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "GaoDengViewController.h"
#import "SmallCollectionView.h"
#import "BigCollectionView.h"

@interface GaoDengViewController ()

@property(strong , nonatomic)SmallCollectionView *smallCollectionView;

@property(strong , nonatomic)BigCollectionView *bigCollectionView;

@end

@implementation GaoDengViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    [self.navigationController.navigationBar setTranslucent:NO];
    
    
    CGFloat navigationBarHeight = self.navigationController.navigationBar.frame.size.height;
    CGFloat statusBarHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    
    // 创建布局
    UICollectionViewFlowLayout * smallLayout = [[UICollectionViewFlowLayout alloc]init];
    
    //设置单元格大小
    smallLayout.itemSize = CGSizeMake(100, 100);
    
    //最小行间距(默认为10)
    
    smallLayout.minimumLineSpacing = 10;
    
    //最小item间距（默认为10）
    
    smallLayout.minimumInteritemSpacing = 10;
    
    //设置senction的内边距
    
    smallLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    
    
    smallLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    
    self.smallCollectionView = [[SmallCollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 150) collectionViewLayout:smallLayout];
    self.smallCollectionView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.smallCollectionView];
    
     
    // 创建布局
    UICollectionViewFlowLayout * bigLayout = [[UICollectionViewFlowLayout alloc]init];
    
    
    CGFloat bottom = 0;
    if (@available(iOS 11.0, *)) {
        CGFloat a =  [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom;
        NSLog(@"%f",a);
        bottom = a;
    } else {
        bottom = 0;
    }
    
    CGFloat bigWidth = self.view.frame.size.width;
    CGFloat bigHeight = [UIScreen mainScreen].bounds.size.height - self.smallCollectionView.frame.size.height - navigationBarHeight - statusBarHeight - bottom;
    
    
    //设置单元格大小
    bigLayout.itemSize = CGSizeMake(300, bigHeight -20 );
    //最小行间距(默认为10)
    
    bigLayout.minimumLineSpacing = 20;
    
    //最小item间距（默认为10）
    
    bigLayout.minimumInteritemSpacing = 10;
    
    //设置senction的内边距
    
    //    bigLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    bigLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    
    bigLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.bigCollectionView = [[BigCollectionView alloc]initWithFrame:CGRectMake(0, 150, bigWidth, bigHeight) collectionViewLayout:bigLayout];
    self.bigCollectionView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.bigCollectionView];
    self.bigCollectionView.smallsCollectionView= self.smallCollectionView;
    
    
    
    [self.smallCollectionView addObserver:self
                               forKeyPath:@"currentIndex" //监听的属性
                                  options:NSKeyValueObservingOptionNew
                                  context:nil];
    
    
    ////测试代码
    //    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC));
    //
    //    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
    //        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:1 inSection:0 ];
    //        [self.smallCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    //        [self.bigCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredVertically animated:YES];
    //
    //    } );
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
    NSInteger index = [[change objectForKey:@"new"]integerValue];
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
    [self.bigCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredVertically animated:YES];
}


- (void)dealloc{
    
    //移除属性
    [self.smallCollectionView removeObserver:self forKeyPath:@"currentIndex"];
}

@end


