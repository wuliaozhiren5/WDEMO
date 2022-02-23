//
//  RRVideoCommentsPopView.m
//  PPVideo
//
//  Created by rrtv on 2022/1/26.
//  Copyright © 2022 RRMJ. All rights reserved.
//

#import "RRVideoCommentsPopView.h"
#import "RRVideoCommentsVC.h"

@interface RRVideoCommentsPopView () <RRVideoCommentsVCDelegate>

@property (nonatomic, strong) UIControl *control;

@property (nonatomic, strong) UIView *container;

@property (nonatomic, copy) NSString *videoId;

@property (nonatomic, strong) RRVideoCommentsVC *videoCommentsVC;
@end

@implementation RRVideoCommentsPopView

- (instancetype)initWithFrame:(CGRect)frame
                      videoId:(NSString *)videoId {
    self = [super initWithFrame:frame];
    if (self) {
        self.videoId = videoId;
        [self setupViews];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setupViews {
    
    self.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];

    [self addSubview:self.control];
    self.control.frame = self.frame;
    [self addSubview:self.container];
    
    self.container.frame = CGRectMake(0, playerViewHeight(), KWidth, KHeight - playerViewHeight());

    NSString *videoId = self.videoId;
    RRVideoCommentsVC *vc = [[RRVideoCommentsVC alloc] initWithIsHalf:YES];
    vc.videoId = videoId;
    vc.delegate = self;
    vc.view.frame = CGRectMake(0, 0, self.container.frame.size.width, self.container.frame.size.height);
    [self.container addSubview:vc.view];
    self.videoCommentsVC = vc;
//    self.control.backgroundColor = [UIColor redColor];
    
}

- (void)showInView:(UIView *)view {
     
    if (!view) {
        return;
    }
    [view addSubview:self];
    
    self.container.frame = CGRectMake(0, KHeight, KWidth, KHeight - playerViewHeight());
    [UIView animateWithDuration:0.25
                     animations:^{
        self.container.frame = CGRectMake(0, playerViewHeight(), KWidth, KHeight - playerViewHeight());
    }];
}

#pragma mark - RRVideoCommentsVCDelegate
//关闭页面
- (void)closeVideoCommentsVC:(RRVideoCommentsVC *)vc {
    [self hidden];
}

- (void)hidden {
    //更新评论数
    NSInteger total = [self.videoCommentsVC getTotal];
//    if (self.delegate && self.delegate.amwayModel.commentCount != total && total > 0) {
//        self.delegate.amwayModel.commentCount = total;
//        [self.delegate.controlView refreshUI];
//    }
    
//    [self removeFromSuperview];
    [UIView animateWithDuration:0.25
                     animations:^{
        self.container.frame = CGRectMake(0, KHeight, KWidth, KHeight - playerViewHeight());
    }
                     completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mark - lazy
- (UIControl *)control {
    if (!_control) {
        _control = [[UIControl alloc] init];
        [_control addTarget:self action:@selector(hidden) forControlEvents:UIControlEventTouchUpInside];
    }
    return _control;
}

- (UIView *)container {
    if (!_container) {
        _container = [[UIControl alloc] init];
    }
    return _container;
}

@end
