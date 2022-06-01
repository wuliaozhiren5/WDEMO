//
//  WScrollViewController.m
//  WDEMO
//
//  Created by WDEMO on 2020/8/17.
//  Copyright © 2020 wwc. All rights reserved.
//

//ScrollView使用Masonry布局
//https://www.jianshu.com/p/074a29ff96ef

//ScrollView使用Masonry自动布局
//https://www.jianshu.com/p/689bc02da6ea

#import "WScrollViewController.h"
#import <Masonry/Masonry.h>

@interface WScrollViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *topView;

@end

@implementation WScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupViews];
}

- (void)setupViews {
    
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configSubviews];
    
    //    // 先设置scrollview的布局，然后在scrollview里添加一个子视图（相当于内容视图），此视图就相当于scrollview的contentSize
    //    UIScrollView * scrollview = [[UIScrollView alloc] init];
    ////    scrollview.bounces = YES;
    //    [self.view addSubview:scrollview];
    //    [scrollview mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.left.right.bottom.top.equalTo(self.view);
    //    }];
    //
    //    //内容视图相当于scrollview的contentSize
    //    UIView * content_view = [[UIView alloc] init];
    //    content_view.backgroundColor = [UIColor redColor];
    //    [scrollview addSubview:content_view];
    //    [content_view mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.edges.equalTo(scrollview);
    //        //如果是上下滑动就得把内容视图的宽固定，高不固定。如果是左右滑动就得把内容视图的高固定，宽不固定
    //        //这里是上下滑动，所以将宽固定了（固定成了跟scrollview一样宽）
    //        make.width.equalTo(scrollview);
    //    }];
    //
    //    //scrollview上的内容就直接添加在内容视图（content_view）上就可以了，然后再设置内容视图的bottom的约束就可以了(相当于设置内容视图的高)
    //
    //    //例如我想在scrollview上添加一个view
    //    UIView * view1 = [[UIView alloc] init];
    //    view1.backgroundColor = [UIColor whiteColor];
    //    view1.clipsToBounds = YES;
    //    view1.layer.cornerRadius = 10;
    //    [content_view addSubview: view1];
    //    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
    //        //这个view的高很明显就超出了scrollview的高
    //        make.height.equalTo(@320);
    //        make.top.equalTo(content_view).offset(10);
    //        make.left.equalTo(content_view).offset(15);
    //        make.right.equalTo(content_view).offset(-15);
    //    }];
    //
    //    //代码到了这里虽然view1的高超出了scrollview的高，但是scrollview还不能上下滑动，因为scrollview的内容视图(content_view)宽固定了，但是高还没确定
    //    //这里必须再把scrollview的内容视图(content_view)的高确定
    //    //为什么一开始不确定内容视图(content_view)的高呢
    //    //因为一开始我们并不知道view1有多高，所以一开始不好确定
    //    //在这里我们只要设置内容视图的bottom的约束就可以了
    //    //这样内容视图(content_view)就能自动计算高了，而不用自己去计算了
    //    [content_view mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.bottom.equalTo(view1).offset(20);
    //    }];
    
    
}

- (void)configSubviews {
    
    self.scrollView = [[UIScrollView alloc] init];
    
    //    self.scrollView.contentSize = CGSizeMake(KWidth, KHeight - 88);
    
    [self.view addSubview:self.scrollView];
    self.topView = [[UIView alloc] init];
    [self.scrollView addSubview:self.topView];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
        make.bottom.equalTo(self.topView).offset(0);
    }];
    
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(self.view);
        make.top.equalTo(self.scrollView);
        CGFloat h = 820;
        make.height.equalTo(@(h));
    }];
    
    self.scrollView.backgroundColor = [UIColor grayColor];
    
    self.topView.backgroundColor = [UIColor redColor];
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
