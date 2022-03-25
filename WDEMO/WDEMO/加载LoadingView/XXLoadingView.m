//
//  XXLoadingView.m
//  WDEMO
//
//  Created by WDEMO on 2021/6/30.
//  Copyright © 2021 wwc. All rights reserved.
//

#import "XXLoadingView.h"
@interface XXLoadingView ()
@end

@implementation XXLoadingView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    //隐藏
    self.hidden = YES;
    
//    self.userInteractionEnabled = YES;
//    UITapGestureRecognizer *tapGesturRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
//    [self addGestureRecognizer:tapGesturRecognizer];
    
    
    [self addSubview:self.containerView];
    [self.containerView addSubview:self.loadingView];
    [self.containerView addSubview:self.tipsLab];
    [self.containerView addSubview:self.retryBtn];
     
    CGFloat containerView_width = 320;
    
    CGFloat loadingView_width = 100;
    CGFloat loadingView_height = 100;
    
    CGFloat tipsLab_width = 320;
    CGFloat tipsLab_height = 20;
    
    CGFloat retryBtn_width = 150;
    CGFloat retryBtn_height = 44;
   
    CGFloat spacing = 10;
    CGFloat containerView_height = loadingView_height + tipsLab_height + retryBtn_height + spacing * 2;
 
    self.containerView.frame = CGRectMake(0, 0, containerView_width, containerView_height);
    self.loadingView.frame = CGRectMake((containerView_width - loadingView_width) / 2, 0, loadingView_width, loadingView_height);
    self.tipsLab.frame = CGRectMake((containerView_width - tipsLab_width) / 2, loadingView_height + spacing, tipsLab_width, tipsLab_height);
    self.retryBtn.frame = CGRectMake((containerView_width - retryBtn_width) / 2, loadingView_height + spacing + tipsLab_height + spacing, retryBtn_width, retryBtn_height);
    self.containerView.center = self.center;    
    
//    self.containerView.backgroundColor = [UIColor lightGrayColor];
//    self.loadingView.backgroundColor = [UIColor systemGrayColor];
}

- (void)tapAction:(UIGestureRecognizer *)tap {
  
    switch (self.state) {
        case MJLoadingViewStateFailure:
        case MJLoadingViewStateNoNetwork:
            
            break;
        default:
           
            break;
    }
}

- (void)clickRetryBtn:(UIButton *)btn {
    NSLog(@"clickRetryBtn");
}

//setter
- (void)setState:(LoadingViewState)state {
    _state = state;
    switch (state) {
        case MJLoadingViewStateLoading:
            //加载中
            self.hidden = NO;
//            self.loadingView.image = [UIImage imageNamed:@"ChatBackgroundImage"];
            [self startAnimating];
            self.tipsLab.text = @"加载中...";
            self.loadingView.hidden = NO;
            self.tipsLab.hidden = NO;
            self.retryBtn.hidden = YES;
            break;
        case MJLoadingViewStateSuccess:
            //加载成功
            self.hidden = YES;
            [self stopAnimating];
//            self.loadingView.image = [UIImage imageNamed:@"ChatBackgroundImage"];
            self.tipsLab.text = @"加载成功";
            
            self.loadingView.hidden = NO;
            self.tipsLab.hidden = NO;
            self.retryBtn.hidden = YES;
            break;
        case MJLoadingViewStateNoData:
            //暂无数据
            self.hidden = NO;
            [self stopAnimating];
            self.loadingView.image = [UIImage imageNamed:@"dropdown_loading_01"];
            self.tipsLab.text = @"暂无数据";
            
            self.loadingView.hidden = NO;
            self.tipsLab.hidden = NO;
            self.retryBtn.hidden = YES;
            break;
        case MJLoadingViewStateFailure:
            //失败
            self.hidden = NO;
            [self stopAnimating];
            self.loadingView.image = [UIImage imageNamed:@"dropdown_loading_01"];
            self.tipsLab.text = @"加载失败";
            
            self.loadingView.hidden = NO;
            self.tipsLab.hidden = NO;
            self.retryBtn.hidden = NO;
            break;
        case MJLoadingViewStateNoNetwork:
            //没有网络
            self.hidden = NO;
            [self stopAnimating];
            self.loadingView.image = [UIImage imageNamed:@"dropdown_loading_01"];
            self.tipsLab.text = @"无法连接网络";
            
            self.loadingView.hidden = NO;
            self.tipsLab.hidden = NO;
            self.retryBtn.hidden = NO;
            break;
        default:
            self.hidden = YES;
            [self stopAnimating];
            break;
    }
}

//lazy
- (UIView *)containerView {
    if (!_containerView) {
        _containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
//        _containerView.hidden = YES;
    }
    return _containerView;
}

- (UIImageView *)loadingView {
    if (!_loadingView) {
        _loadingView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        _loadingView.image = [UIImage imageNamed:@"ChatBackgroundImage"];
        _loadingView.contentMode = UIViewContentModeScaleAspectFill;
        _loadingView.clipsToBounds = YES;
//        // 1.设置最后一帧为imageView的图片
//          self.imageView.image = [UIImage imageNamed:@"0017"];
//          
//          // 2.获取 image 数组
//          NSMutableArray *imgArray = [NSMutableArray array];
//          for (int i=0; i<18; i++) {
//              NSString *str = [NSString stringWithFormat:@"%04d",i];
//              UIImage *image = [UIImage imageNamed:str];
//              [imgArray addObject:image];
//          }
//          
//          // 3.设置 animation 图片数组
//            _loadingView.animationImages = imgArray;
//          // 设置播放时长
//          self.imageView.animationDuration = 0.1 * imgArray.count;
//          // 设置播放次数
//          self.imageView.animationRepeatCount = 1;
//          // 开始播放动画
//          [self.imageView startAnimating];
        
  
//        _loadingView.image = [UIImage imageNamed:@"0017"];
//        NSMutableArray *imgArray = [NSMutableArray array];
//        for (int i = 0; i < 17; i++) {
//            NSString *str = [NSString stringWithFormat:@"tt/tt%02d",i];
//            // 1.将资源放到 bundle 中
//            NSString *path = [[[NSBundle mainBundle] pathForResource:@"ChatKitFace" ofType:@"bundle"] stringByAppendingPathComponent:str];
//            UIImage *image = [UIImage imageNamed:path];
//            if (image) {
//                [imgArray addObject:image];
//            }
//
            
//            for (NSUInteger i = 1; i<=60; i++) {
//                UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_anim__000%zd", i]];
//                [imgArray addObject:image];
//            }

//        }
//        _loadingView.animationImages = imgArray;
//        _loadingView.animationDuration = 0.2 * imgArray.count;
//        _loadingView.animationRepeatCount = 1;
//        [_loadingView startAnimating];
        
   
        NSMutableArray *imgArray = [NSMutableArray array];
        for (NSUInteger i = 1; i<=3; i++) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_loading_0%zd", i]];
            [imgArray addObject:image];
        }
        _loadingView.animationImages = imgArray;
        _loadingView.animationDuration = 0.1 * imgArray.count;
//        _loadingView.animationRepeatCount = 1;
//        [_loadingView startAnimating];
    }
    return _loadingView;
}

- (void)startAnimating {
    if (self.loadingView.isAnimating) {
        return;
    }
    [self.loadingView startAnimating];
}

- (void)stopAnimating {
    if (self.loadingView.isAnimating) {
        [self.loadingView stopAnimating];
    }
}

- (UILabel *)tipsLab {
    if (!_tipsLab) {
        _tipsLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
        _tipsLab.textAlignment = NSTextAlignmentCenter;
    }
    return _tipsLab;
}

- (UIButton *)retryBtn {
    if (!_retryBtn) {
        _retryBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 88, 44)];
        [_retryBtn setTitle:@"点击重试" forState:UIControlStateNormal];
//        [_retryBtn addTarget:self action:@selector(clickRetryBtn:) forControlEvents:UIControlEventTouchUpInside];
        _retryBtn.backgroundColor = [UIColor systemBlueColor];
        _retryBtn.layer.cornerRadius = 20;
        _retryBtn.layer.masksToBounds = YES;
        _retryBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
        [_retryBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    }
    return _retryBtn;
}
@end
