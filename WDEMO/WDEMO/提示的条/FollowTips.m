//
//  FollowTips.m
//  WDEMO
//
//  Created by rrtv on 2020/11/20.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "FollowTips.h"
#import "THeader.h"
#import "WMacros.h"


@interface FollowTips ()
@property (nonatomic, strong) UIControl *container;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *followBtn;
@property (nonatomic, strong) UIImageView *followBtnImageView;
@property (nonatomic, strong) UILabel *followBtnTitleLabel;

@property (nonatomic, assign) BOOL isAutoHidden;

@end

@implementation FollowTips

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}
 
- (void)setupViews {
//    self.userInteractionEnabled = YES;
    self.isAutoHidden = YES;
    UIControl *container = [[UIControl alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    container.backgroundColor = [UIColor blackColor];
    [container addTarget:self action:@selector(clickFollowBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:container];
 
    UILabel *titleLabel  = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.text = @"喜欢就点我吧";
    [container addSubview:titleLabel];
 
    UIButton *followBtn = [[UIButton alloc]initWithFrame:CGRectMake(240, 0, 80, 50)];
    followBtn.backgroundColor = [UIColor blueColor];
    [followBtn addTarget:self action:@selector(clickFollowBtn:) forControlEvents:UIControlEventTouchUpInside];
    [container addSubview:followBtn];
    
    UIImageView *followBtnImageView  = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 50)];
    followBtnImageView.backgroundColor = [UIColor redColor];
    [followBtn addSubview:followBtnImageView];
    
    UILabel *followBtnTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 0, 40, 50)];
    followBtnTitleLabel.text = @"追剧";
    [followBtn addSubview:followBtnTitleLabel];
    
    _container = container;
    _titleLabel = titleLabel;
    _followBtn = followBtn;
    _followBtnImageView = followBtnImageView;
    _followBtnTitleLabel = followBtnTitleLabel;

    WS(weakSelf)
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf autoHidden];
    });
    
}

//自动移除
- (void)autoHidden {
    if (self.isAutoHidden){
        [self hidden];
    }
}

- (void)clickFollowBtn:(id)sender {
    NSLog(@"喜欢就点我吧");
    
    self.isAutoHidden = NO;
    //点击请求接口
    //成功变化颜色 然后移除
    
    //点击之后 取消自动移除
    
    //请求成功变化颜色 然后移除 显示提示文案
    //请求失败 移除 提示错误
    
    WS(weakSelf) 
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf hidden];
    });
}

-(void)showInView:(UIView *)view {
//    self.frame = view.bounds;
    CGFloat x = view.bounds.size.width;
    CGFloat y = self.frame.origin.y;
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    self.frame = CGRectMake(x, y, width, height);
    [view addSubview:self];
    [self showAnimation];
}

-(void)show {
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    CGFloat x = window.bounds.size.width;
    CGFloat y = self.frame.origin.y;
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    self.frame = CGRectMake(x, y, width, height);
    [window addSubview:self];
    [self showAnimation];
}

-(void)hidden {
    [self hiddenAnimation];
}

- (void)showAnimation {
    CGFloat xStart = Screen_Width;
    CGFloat xEnd = 20;
    CGFloat y = self.frame.origin.y;
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    self.frame = CGRectMake(xStart, y, width, height);

    [UIView animateWithDuration:0.5
                          delay:0
         usingSpringWithDamping:0.5
          initialSpringVelocity:10
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
        self.frame = CGRectMake(xEnd, y, width, height);

    }
                     completion:nil];
}

- (void)hiddenAnimation {
    CGFloat xStart = - Screen_Width - self.frame.size.width ;
    CGFloat xEnd = 20;
    CGFloat y = self.frame.origin.y;
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    self.frame = CGRectMake(xEnd, y, width, height);

    [UIView animateWithDuration:0.5
                          delay:0
         usingSpringWithDamping:0.5
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
        self.frame = CGRectMake(xStart, y, width, height);

    }
                     completion:^(BOOL finished) {
        
        [self removeFromSuperview];
    }];
}

//向上
- (void)showUpAnimation {
    CGFloat x = self.frame.origin.x;
    CGFloat y = self.frame.origin.y - 50;
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    [UIView animateWithDuration:0.5
                          delay:0
         usingSpringWithDamping:0.5
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
        self.frame = CGRectMake(x, y, width, height);

    }
                     completion:^(BOOL finished) {
        
        [self removeFromSuperview];
    }];
 
}

//向下
- (void)showDownAnimation {
    CGFloat x = self.frame.origin.x;
    CGFloat y = self.frame.origin.y + 50;
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    [UIView animateWithDuration:0.5
                          delay:0
         usingSpringWithDamping:0.5
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
        self.frame = CGRectMake(x, y, width, height);

    }
                     completion:^(BOOL finished) {
        
        [self removeFromSuperview];
    }];
}

- (void)dealloc {
    
    
}
@end
