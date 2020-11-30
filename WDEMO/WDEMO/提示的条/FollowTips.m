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
#import "ACMacros.h"

@interface FollowTips ()
@property (nonatomic, strong) UIControl *container;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *followBtn;
@property (nonatomic, strong) UIImageView *followBtnImageView;
@property (nonatomic, strong) UILabel *followBtnTitleLabel;
@property (nonatomic, assign) BOOL isAutoHidden;
@property (nonatomic, assign) BOOL isRequesting;
@property (nonatomic, assign) BOOL isShowAnimationing;
@property (nonatomic, assign) BOOL isHiddenAnimationing;
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
    self.isRequesting = NO;
    
    UIControl *container = [[UIControl alloc]initWithFrame:self.bounds];
    container.layer.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.7].CGColor;
    container.layer.cornerRadius = 8;
    [container addTarget:self action:@selector(clickFollowBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:container];
    
    UILabel *titleLabel  = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, 140, 45)];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.textColor = kCOLOR_FFFFFF;
    titleLabel.font = SYSTEMFONT(15);
    titleLabel.text = @"点击获取更新提醒";
    [container addSubview:titleLabel];
    
    UIButton *followBtn = [[UIButton alloc]initWithFrame:CGRectMake(135, 0, 78, 45)];
    //    followBtn.backgroundColor = [UIColor blueColor];
    [followBtn addTarget:self action:@selector(clickFollowBtn:) forControlEvents:UIControlEventTouchUpInside];
    [container addSubview:followBtn];
    
    UIImageView *followBtnImageView  = [[UIImageView alloc]initWithFrame:CGRectMake(15.5, (45 - 15) / 2.0, 15, 15)];
    //    followBtnImageView.backgroundColor = [UIColor redColor];
    followBtnImageView.image = [UIImage imageNamed:@"ic_common_collect_white_nomal"];
    [followBtn addSubview:followBtnImageView];
    
    UILabel *followBtnTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(33, 0, 40, 45)];
    followBtnTitleLabel.textAlignment = NSTextAlignmentLeft;
    followBtnTitleLabel.text = @"追剧";
    followBtnTitleLabel.textColor = kCOLOR_00BBFF; //kCOLOR_FFFFFF
    followBtnTitleLabel.font = SYSTEMFONT(15);
    [followBtn addSubview:followBtnTitleLabel];
    
    _container = container;
    _titleLabel = titleLabel;
    _followBtn = followBtn;
    _followBtnImageView = followBtnImageView;
    _followBtnTitleLabel = followBtnTitleLabel;
    
    WS(weakSelf)
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
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
    if (self.isRequesting) {
        return;
    }
    NSLog(@"喜欢就点我吧");
    self.isAutoHidden = NO;
    self.isRequesting = YES;
    
    //点击请求接口
    //成功变化颜色 然后移除
    
    //点击之后 取消自动移除
    
    //请求成功变化颜色 然后移除 显示提示文案
    //请求失败 移除 提示错误
    
//    WS(weakSelf)
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        weakSelf.isRequesting = NO;
//        [weakSelf hidden];
//    });
    
 
//    WS(weakSelf)
//    CHECK_LOGIN;
//    [ColletionTool getSeasonID:self.playerModel.seasonId IsFocus:NO WithBlock:^(BOOL isFavo, NSError *error) {
//        weakSelf.playerModel.isFollow = isFavo;
//        if (isFavo) {
//            weakSelf.followBtnImageView.image = [UIImage imageNamed:@"ic_common_collect_small_press"];
//        } else {
//            weakSelf.followBtnImageView.image = [UIImage imageNamed:@"ic_common_collect_small_nomal"];
//        }
//        if (!weakSelf.playerModel.seasonPlayContext) {
//            RRUmengSeasonPlayContext *seasonPlayContext = [[RRUmengSeasonPlayContext alloc] init];
//            seasonPlayContext.videoName = weakSelf.playerModel.videoTitle;
//            seasonPlayContext.seasonId = weakSelf.playerModel.seasonId;
//            seasonPlayContext.area = weakSelf.playerModel.area;
//            seasonPlayContext.publisherID = weakSelf.playerModel.publisherID;
//            weakSelf.playerModel.seasonPlayContext = seasonPlayContext;
//        }
//        if (isFavo) {
//            [weakSelf.playerModel.seasonPlayContext seasonBingeWatchingLog];
//        }
//        weakSelf.isRequesting = NO;
//        [weakSelf hidden];
//        [[NSNotificationCenter defaultCenter] postNotificationName:kRRNotificationKeyFollowStatesDidChange object:weakSelf.playerModel];
//    }];
}

- (void)followSuccess {
    WS(weakSelf)
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf hidden];
    });
}

- (void)showInView:(UIView *)view {
    CGFloat topOffset = -80;
    CGFloat x = 15;
    CGFloat y = view.frame.size.height + topOffset - self.frame.size.height;
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    self.frame = CGRectMake(x, y, width, height);
    [view addSubview:self];
    [self showAnimation];
}
 
- (void)show {
    CGFloat topOffset = -80;
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    CGFloat x = 15;
    CGFloat y = window.frame.size.height + topOffset - self.frame.size.height;
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    self.frame = CGRectMake(x, y, width, height);
    [window addSubview:self];
    [self showAnimation];
}

- (void)hidden {
    [self hiddenAnimation];
}

- (void)showAnimation {
    self.alpha = 0.0;
    [UIView animateWithDuration:0.5
                          delay:0.5
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
        self.alpha = 1.0;
    }
                     completion:nil];
}

- (void)hiddenAnimation {
    if (self.isHiddenAnimationing) {
        return;
    }
    self.isHiddenAnimationing = YES;
    self.alpha = 1.0;
    [UIView animateWithDuration:0.5
                          delay:0.5
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
        self.alpha = 0.0;
    }
                     completion:^(BOOL finished) {
        if (finished) {
            self.isHiddenAnimationing = NO;
            [self removeFromSuperview];
            if (self.followTipHidden) {
                self.followTipHidden();
            }
        }
    }];
}

- (void)followedHidden {
    WS(weakSelf)
    dispatch_async(dispatch_get_main_queue(), ^{
        weakSelf.followBtnImageView.image = [UIImage imageNamed:@"ic_common_collect_small_press"];
        [weakSelf hidden];
       });
}

- (void)dealloc {
    
}
@end
