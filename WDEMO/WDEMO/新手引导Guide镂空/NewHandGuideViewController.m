//
//  NewHandGuideViewController.m
//  WDEMO
//
//  Created by rrtv on 2021/4/2.
//  Copyright © 2021 wwc. All rights reserved.
//

#import "NewHandGuideViewController.h"
#import <Masonry/Masonry.h>
#import "ACMacros.h"
#import "UIColor+color.h"
@interface NewHandGuideViewController ()
@property (nonatomic, strong) UIView *openMaskView;
@property (nonatomic, strong) UIImageView *openImageView;
@property (nonatomic, strong) UIView *enterMaskView;
@property (nonatomic, strong) UIImageView *enterImageView;

@property (nonatomic, strong) UIButton *openBtn;
@property (nonatomic, strong) UIButton *enterBtn;
@property (nonatomic, assign) CGRect btnGuideRect;

@end

@implementation NewHandGuideViewController

- (instancetype)initWithBtnGuideRect:(CGRect)btnGuideRect {
    self = [super init];
    if (self) {
        _btnGuideRect = btnGuideRect;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //    self.view.backgroundColor = [UIColor clearColor];
    //    [self creatSeasonDetailMaskView];
//    [self.navigationController setNavigationBarHidden:YES animated:NO];
//    self.navigationController.navigationBar.hidden = YES;
    
    //如果有
    if (_btnGuideRect.origin.x > 0 && _btnGuideRect.origin.y > 0 && _btnGuideRect.size.width > 0 && _btnGuideRect.size.height > 0) {
        [self createOpenGuideView];
        
    } else {
        //    //2个按钮
        [self createOpenButton];
        [self createEnterButton];
        [self createOpenGuideViewTwoBtn];
        //                [self createEnterView];
    }
    
}

//隐藏导航栏
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
- (void)createOpenGuideView {
    //创建一个View
    UIView *maskView = [[UIView alloc] initWithFrame:self.view.bounds];
    maskView.backgroundColor = kCOLOR_000000;
    maskView.alpha = 0.6;
    [self.view addSubview:maskView];
    
    CGRect rect = _btnGuideRect;
    
    //贝塞尔曲线 画一个矩形
    UIBezierPath *bpath = [UIBezierPath bezierPathWithRoundedRect:self.view.bounds cornerRadius:0];
    //矩形
    UIBezierPath *squarePath = [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:rect.size.height / 2.0] bezierPathByReversingPath];
    [bpath appendPath:squarePath];
    //创建一个CAShapeLayer 图层
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = bpath.CGPath;
    //添加图层蒙板
    maskView.layer.mask = shapeLayer;
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.userInteractionEnabled = YES;
    imageView.frame = CGRectMake(_btnGuideRect.origin.x - 15, _btnGuideRect.origin.y - 30, 267, 307);
    //    imageView.backgroundColor = [UIColor grayColor];
    //    imageView.hidden = YES;
    imageView.layer.cornerRadius = 30;
    imageView.layer.masksToBounds = YES;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:imageView];
    
    imageView.image = [UIImage imageNamed:@"comment_guide-1-2_06 2"];
//    imageView.center = self.view.center;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickOpenImageView:)];
    tapGesture.numberOfTapsRequired = 1;
    [imageView addGestureRecognizer:tapGesture];
    
    _openMaskView = maskView;
    _openImageView  = imageView;
    
}

- (void)createOpenGuideViewTwoBtn {
    //- (void)creatSeasonDetailMaskView:(CGRect)circleFrame {
    
    //创建一个View
    UIView *maskView = [[UIView alloc] initWithFrame:self.view.bounds];
    maskView.backgroundColor = kCOLOR_000000;
    maskView.alpha = 0.6;
    [self.view addSubview:maskView];
    
    CGRect rect1 = [self.view convertRect:_openBtn.frame toView:self.view];
    CGRect rect2 = [self.view convertRect:_enterBtn.frame toView:self.view];
    //    CGRect rect1 = _openBtn.frame;
    //    CGRect rect2 = _enterBtn.frame;
    //    CGRect rect = _openBtn.frame;
    
    //贝塞尔曲线 画一个矩形
    UIBezierPath *bpath = [UIBezierPath bezierPathWithRoundedRect:self.view.bounds cornerRadius:0];
    //椭圆镂空的部分
    CGRect ovalRect = rect1;
    UIBezierPath *ovalPath = [[UIBezierPath bezierPathWithOvalInRect:ovalRect] bezierPathByReversingPath];
    [bpath appendPath:ovalPath];
    
    //矩形
    UIBezierPath *squarePath = [[UIBezierPath bezierPathWithRoundedRect:rect2 cornerRadius:2.0] bezierPathByReversingPath];
    [bpath appendPath:squarePath];
    //创建一个CAShapeLayer 图层
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = bpath.CGPath;
    //添加图层蒙板
    maskView.layer.mask = shapeLayer;
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.userInteractionEnabled = YES;
    imageView.frame = CGRectMake(0, 0, 267, 307);
    //    imageView.backgroundColor = [UIColor grayColor];
    //    imageView.hidden = YES;
//    imageView.layer.cornerRadius = 30;
//    imageView.layer.masksToBounds = YES;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:imageView];
    
    imageView.image = [UIImage imageNamed:@"comment_guide-1-2_06 2"];
    imageView.center = self.view.center;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickOpenImageView:)];
    tapGesture.numberOfTapsRequired = 1;
    [imageView addGestureRecognizer:tapGesture];
    
    _openMaskView = maskView;
    _openImageView  = imageView;
}

- (void)createEnterGuideView {
    //- (void)creatSeasonDetailMaskView:(CGRect)circleFrame {
    
    //创建一个View
    UIView *maskView = [[UIView alloc] initWithFrame:self.view.bounds];
    maskView.backgroundColor = kCOLOR_000000;
    maskView.alpha = 0.6;
    [self.view addSubview:maskView];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.userInteractionEnabled = YES;
    imageView.frame = CGRectMake(0, 0, 283, 409);
    //    imageView.backgroundColor = [UIColor grayColor];
    //    imageView.hidden = YES;
//    imageView.layer.cornerRadius = 30;
//    imageView.layer.masksToBounds = YES;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:imageView];
    
    imageView.image = [UIImage imageNamed:@"comment_guide-1-2_03"];
    imageView.center = self.view.center;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickEnterImageView:)];
    tapGesture.numberOfTapsRequired = 1;
    [imageView addGestureRecognizer:tapGesture];
    
    _enterMaskView = maskView;
    _enterImageView  = imageView;
}

- (void)clickOpenImageView:(UITapGestureRecognizer *)sender {
    [self createEnterGuideView];
    [_openMaskView  removeFromSuperview];
    [_openImageView  removeFromSuperview];
}

- (void)clickEnterImageView:(UITapGestureRecognizer *)sender {
    [_enterMaskView  removeFromSuperview];
    [_enterImageView  removeFromSuperview];
}

- (void)createOpenButton {
    UIButton *btn = [[UIButton alloc] init];
    //    btn.layer.cornerRadius = 5.0;
    //    btn.layer.borderWidth = 1.0;
    //    btn.layer.borderColor = [UIColor blackColor].CGColor;
    btn.frame = CGRectMake(100, 200, 60, 40);
    [btn setTitle:@"开启" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //    [closeBtn setImage:IMAGENAME(@"ic_search_results_bar_close_28") forState:UIControlStateNormal];
    //    [btn addTarget:self action:@selector(clickCloseBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    _openBtn = btn;
}

- (void)createEnterButton {
    UIButton *btn = [[UIButton alloc] init];
    //    btn.layer.cornerRadius = 5.0;
    //    btn.layer.borderWidth = 1.0;
    //    btn.layer.borderColor = [UIColor blackColor].CGColor;
    btn.frame = CGRectMake(KWidth - 60, 100, 60, 40);
    [btn setTitle:@"进入" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //    [closeBtn setImage:IMAGENAME(@"ic_search_results_bar_close_28") forState:UIControlStateNormal];
    //    [btn addTarget:self action:@selector(clickCloseBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    _enterBtn = btn;
    
}

@end
//ic_comment_guide
