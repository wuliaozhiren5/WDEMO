//
//  MJDIYLoadingView.m
//  MoWanShang
//
//  Created by rrtv on 2022/3/28.
//

#import "MJDIYLoadingView.h"

@implementation MJDIYLoadingView

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
    
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesturRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [self addGestureRecognizer:tapGesturRecognizer];
    
    
    [self addSubview:self.containerView];
    [self.containerView addSubview:self.loadingView];
    [self.containerView addSubview:self.tipsLab];
    [self.containerView addSubview:self.retryBtn];
     
    CGFloat containerView_width = self.frame.size.width;
    CGFloat containerView_height = self.frame.size.height;

    CGFloat loadingView_width = 100;
    CGFloat loadingView_height = 100;
    
    CGFloat tipsLab_width = self.frame.size.width;;
    CGFloat tipsLab_height = 20;
    
    CGFloat retryBtn_width = 100;
    CGFloat retryBtn_height = 44;
   
    CGFloat spacing = 10;
//    CGFloat containerView_height = loadingView_height + tipsLab_height + retryBtn_height + spacing * 2;
 
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
        case LoadingViewStateFailure:
        case LoadingViewStateNoNetwork:
        case LoadingViewStateNoData:
        {
            self.state = LoadingViewStateLoading;
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(clickDIYLoadingView:)]) {
                [self.delegate clickDIYLoadingView:self];
            }
        }
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
        case LoadingViewStateLoading:
            //加载中
            self.hidden = NO;
//            self.loadingView.image = [UIImage imageNamed:@"ChatBackgroundImage"];
            [self startAnimating];
            self.tipsLab.text = @"加载中...";
            self.loadingView.hidden = NO;
            self.tipsLab.hidden = NO;
            self.retryBtn.hidden = YES;
            break;
        case LoadingViewStateSuccess:
            //加载成功
            self.hidden = YES;
            [self stopAnimating];
//            self.loadingView.image = [UIImage imageNamed:@"dropdown_loading_01"];
            self.tipsLab.text = @"加载成功";
            
            self.loadingView.hidden = NO;
            self.tipsLab.hidden = NO;
            self.retryBtn.hidden = YES;
            break;
        case LoadingViewStateNoData:
            //暂无数据
            self.hidden = NO;
            [self stopAnimating];
            self.loadingView.image = [UIImage imageNamed:@"dropdown_loading_01"];
            self.tipsLab.text = @"暂无数据";
            
            self.loadingView.hidden = NO;
            self.tipsLab.hidden = NO;
            self.retryBtn.hidden = YES;
            break;
        case LoadingViewStateFailure:
            //失败
            self.hidden = NO;
            [self stopAnimating];
            self.loadingView.image = [UIImage imageNamed:@"dropdown_loading_01"];
            self.tipsLab.text = @"加载失败";
            
            self.loadingView.hidden = NO;
            self.tipsLab.hidden = NO;
            self.retryBtn.hidden = NO;
            break;
        case LoadingViewStateNoNetwork:
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
    
//    //按钮暂时隐藏
//    self.retryBtn.hidden = YES;

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
        _loadingView.image = [UIImage imageNamed:@"dropdown_loading_01"];
        _loadingView.contentMode = UIViewContentModeScaleAspectFill;
        _loadingView.clipsToBounds = YES;
   
        //设置正在刷新状态的动画图片
        NSMutableArray * refreshingImages = [NSMutableArray array];
        for (NSUInteger i = 1; i<=3; i++) {
            UIImage * image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_loading_0%zd",i]];
            [refreshingImages addObject:image];
        }
        _loadingView.animationImages = refreshingImages;
        _loadingView.animationDuration = 0.1 * refreshingImages.count;
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

