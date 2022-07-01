//
//  MWSTradeAlertView.m
//  MoWanShang
//
//  Created by wwc on 2022/6/27.
//

#import "MWSTradeAlertView.h"
@interface MWSTradeAlertView ()
//半透明
@property(strong,nonatomic)UIControl *control;
//容器
@property(strong,nonatomic)UIView *container;
//标题
@property(strong,nonatomic)UILabel *titleLab;
//内容
@property(strong,nonatomic)UILabel *contentLab;
//确认
@property(strong,nonatomic)UIButton *confirmBtn;
//取消
@property(strong,nonatomic)UIButton *cancelBtn;

@property(copy,nonatomic)NSString *titleStr;
@property(copy,nonatomic)NSString *contentStr;
@property(strong,nonatomic)NSAttributedString *attributedTitelStr;
@property(strong,nonatomic)NSAttributedString *attributedContentStr;

@property(strong,nonatomic)NSString *confirmStr;
@property(strong,nonatomic)NSString *cancelStr;

@property(nonatomic,copy) void (^confirmHandler)(void);
@property(nonatomic,copy) void (^cancelHandler)(void);
 
@end

@implementation MWSTradeAlertView

- (instancetype)initWithFrame:(CGRect)frame
           attributedTitelStr:(NSAttributedString *)attributedTitelStr
         attributedContentStr:(NSAttributedString *)attributedContentStr
                   confirmStr:(NSString *)confirmStr
                    cancelStr:(NSString *)cancelStr
               confirmHandler:(void (^)(void))confirmHandler
                cancelHandler:(void (^)(void))cancelHandler {

    if (attributedTitelStr) {
        _attributedTitelStr = attributedTitelStr;
    }
    if (attributedContentStr) {
        _attributedContentStr = attributedContentStr;
    }
    _confirmStr = confirmStr;
    _cancelStr = cancelStr;
    _confirmHandler = confirmHandler;
    _cancelHandler = cancelHandler;
    
    self = [self initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
                     titelStr:(NSString *)titelStr
                   contentStr:(NSString *)contentStr
                   confirmStr:(NSString *)confirmStr
                    cancelStr:(NSString *)cancelStr
               confirmHandler:(void (^)(void))confirmHandler
                cancelHandler:(void (^)(void))cancelHandler {
    
    if (titelStr) {
        _titleStr = titelStr;
    }
    if (contentStr) {
        _contentStr = contentStr;
    }
    _confirmStr = confirmStr;
    _cancelStr = cancelStr;
    _confirmHandler = confirmHandler;
    _cancelHandler = cancelHandler;
    
    self = [self initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
  
    [self addSubview:self.control];
    [self addSubview:self.container];
    
    [self.container addSubview:self.titleLab];
    [self.container addSubview:self.contentLab];
    [self.container addSubview:self.confirmBtn];
    [self.container addSubview:self.cancelBtn];
 
    CGFloat width = KWidth - 30 * 2;
    CGFloat contentWidth = width - 32 * 2;
    
    //富文本
    if (self.attributedTitelStr) {
        self.titleLab.attributedText = self.attributedTitelStr;
    }
    
    if (self.attributedContentStr) {
        self.contentLab.attributedText = self.attributedContentStr; 
    }
    
    //正常文本
    if (_titleStr) {
        self.titleLab.text = self.titleStr;

    }
    if (_contentStr) {
        self.titleLab.text = self.contentStr;
    }
    
    [self.confirmBtn setTitle:self.confirmStr forState:UIControlStateNormal];
    [self.cancelBtn setTitle:self.cancelStr forState:UIControlStateNormal];
    CGSize size = [self.contentLab sizeThatFits:CGSizeMake(contentWidth, CGFLOAT_MAX)];
    
    //70+100
    CGFloat height = 70 + 100 + size.height;

    self.control.frame = CGRectMake(0, 0, KWidth, KHeight);
    self.container.frame = CGRectMake(0, 0, width, height);
    
    self.container.center = self.control.center;
    
    self.titleLab.frame = CGRectMake(0, 30, width, 28);
    self.contentLab.frame = CGRectMake((width - contentWidth) /2.0, 70, contentWidth, size.height);
    self.confirmBtn.frame = CGRectMake(width / 2.0, height - 30 - 41, 125, 41);
    self.cancelBtn.frame = CGRectMake(width / 2.0 - 110 - 15, height - 30 - 41, 110, 41);
    
    self.confirmBtn.backgroundColor = [UIColor redColor];
    self.cancelBtn.backgroundColor = [UIColor grayColor];
 
 
    self.titleLab.textAlignment = NSTextAlignmentCenter;
    self.contentLab.textAlignment = NSTextAlignmentCenter;

}

-(void)clickCancelBtn {
    
    [self hidden];
    if (_cancelHandler) {
        _cancelHandler();
    }
}

-(void)clickConfirmBtn {
    
    [self hidden];
    if (_confirmHandler) {
        _confirmHandler();
    }
}

-(void)showInView:(UIView *)view {
    self.frame = view.bounds;
    [view addSubview:self];
    [self showAnimation];
}

-(void)show {
    self.frame = [UIApplication sharedApplication].delegate.window.bounds;
    [[UIApplication sharedApplication].delegate.window addSubview:self];
    [self showAnimation];
}

-(void)hidden {
    [self hiddenAnimation];
}

- (void)showAnimation {
    self.alpha = 0.1;
    self.backgroundColor = [UIColor clearColor];
    self.container.transform = CGAffineTransformMakeScale(0.9, 0.9);
    [UIView animateWithDuration:0.5
                          delay:0
         usingSpringWithDamping:0.5
          initialSpringVelocity:20
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
        self.container.transform = CGAffineTransformIdentity;
        self.alpha = 1;
    }
                     completion:nil];
}

- (void)hiddenAnimation {
    [UIView animateWithDuration:0.5
                          delay:0
         usingSpringWithDamping:0.5
          initialSpringVelocity:10
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
        self.backgroundColor = [UIColor clearColor];
        self.container.transform = CGAffineTransformMakeScale(0.9, 0.9);
        self.alpha = 0.0;
    }
                     completion:^(BOOL finished) {
        
        [self removeFromSuperview];
        
    }];
}

//lazy
 -(UIControl *)control {
    if (!_control) {
        _control = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, KWidth, KWidth)];
       [_control addTarget:self action:@selector(hidden) forControlEvents:UIControlEventTouchUpInside];
//        _control.layer.cornerRadius = 6;
//        _control.layer.masksToBounds = YES;
//        _control.backgroundColor = kCOLOR_292929;
////        _container.backgroundColor = kCOLOR_C13030;
    }
    return _control;
    
}
- (UIView *)container {
    if (!_container) {
        _container = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWidth, KWidth)];
        _container.layer.cornerRadius = 6;
        _container.layer.masksToBounds = YES;
        _container.backgroundColor = kCOLOR_292929;
//        _container.backgroundColor = kCOLOR_C13030;
    }
    return _container;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.font = [UIFont boldSystemFontOfSize:20];
        _titleLab.text = @"标题";
        _titleLab.textColor = kCOLOR_FFFFFF;
        _titleLab.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLab;
}
  
- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [[UILabel alloc] init];
        _contentLab.font = [UIFont systemFontOfSize:15];
        _contentLab.text = @"内容";
        _contentLab.textColor = kCOLOR_FFFFFF;
        _contentLab.textAlignment = NSTextAlignmentCenter;
        _contentLab.numberOfLines = 0;
    }
    return _contentLab;
}

- (UIButton *)cancelBtn {
    if (!_cancelBtn) {
        _cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
//        [_cancelBtn setImage:IMAGENAME(@"pic_uo") forState:UIControlStateNormal];
//        [_cancelBtn setImage:IMAGENAME(@"pic_uo") forState:UIControlStateHighlighted];
        _cancelBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [_cancelBtn addTarget:self action:@selector(clickCancelBtn) forControlEvents:UIControlEventTouchUpInside];

    }
    return _cancelBtn;
}

- (UIButton *)confirmBtn {
    if (!_confirmBtn) {
        _confirmBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
        [_confirmBtn setTitle:@"确认发布" forState:UIControlStateNormal];
//        [_confirmBtn setImage:IMAGENAME(@"pic_uo") forState:UIControlStateNormal];
//        [_confirmBtn setImage:IMAGENAME(@"pic_uo") forState:UIControlStateHighlighted];
        _confirmBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [_confirmBtn addTarget:self action:@selector(clickConfirmBtn) forControlEvents:UIControlEventTouchUpInside];

    }
    return _confirmBtn;
}
@end
