
#import "LXHSlideView.h"

#define WindowWidth                        ([[UIScreen mainScreen] bounds].size.width)
#define WindowHeight                       ([[UIScreen mainScreen] bounds].size.height)
#define TopViewHight 50

#define IndicatorWidth 20
#define IndicatorHeight 3
#define IndicatorCenter self.frame.size.width/((self.vcArray.count + 1) * 2) - 10
#define HexUIColorFromRGB(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]

@interface LXHSlideView()<UIScrollViewDelegate>

@property (nonatomic,strong) UIView *topView;
@property (nonatomic,strong) UIView *slideView;
@property (nonatomic,strong) UIScrollView *topScrollView;
@property (nonatomic,strong) UIScrollView *bottomScrollView;

@property (nonatomic,strong) NSMutableArray *btnArray;

@end

@implementation LXHSlideView

- (instancetype)initWithFrame:(CGRect)frame WithViewControllers:(NSArray *)viewControllers{
    if (self = [super initWithFrame:frame]) {
        self.vcArray = viewControllers;
    }
    return self;
}

- (void)setVcArray:(NSArray *)vcArray{
    _vcArray = vcArray;
    _btnArray = [NSMutableArray array];
    [self confingTopView];
    [self configBottomView];
}

- (void)confingTopView{
    // 按钮宽度
    CGFloat buttonWight = WindowWidth / (_vcArray.count+1);
    // 按钮高度
    CGFloat buttonhight = TopViewHight - 4;
    CGRect topViewFrame = CGRectMake(0, 0, WindowWidth, TopViewHight);
    self.topView = [[UIView alloc]initWithFrame:topViewFrame];
    [self addSubview:self.topView];
    // 提示器
    self.slideView = [[UIView alloc] initWithFrame:CGRectMake(IndicatorCenter, TopViewHight - 13, IndicatorWidth, IndicatorHeight)];
    [_slideView setBackgroundColor:[UIColor orangeColor]];
    [_topView  addSubview:self.slideView];
    // 添加按钮
    for (int i = 0; i < self.vcArray.count ; i ++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(i * buttonWight, 0, buttonWight, buttonhight)];
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, buttonWight, buttonhight)];
        button.tag = i;
        NSString * buttonTitle =  [self.vcArray[i] allKeys][0];
        
        [button setTitle:buttonTitle forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15.0];
        [button setTitleColor:HexUIColorFromRGB(0x333333, 0.6) forState:UIControlStateNormal];
        
        if (i == 0) {
            [button setTitleColor:HexUIColorFromRGB(0x333333, 1.0) forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:17.0];
        }
        
        [button addTarget:self action:@selector(tabButton:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:button];
        
        [_btnArray addObject:button];
        [_topView addSubview:view];
    }
}

- (void)configBottomView{
    CGRect  bottomScrollViewFrame = CGRectMake(0, TopViewHight, WindowWidth, WindowHeight - TopViewHight );
    self.bottomScrollView = [[UIScrollView alloc]initWithFrame:bottomScrollViewFrame];
    
    [self addSubview:_bottomScrollView];
    
    for (int i = 0; i < self.vcArray.count ; i ++) {
        CGRect  VCFrame = CGRectMake(i * WindowWidth, 0, WindowWidth, bottomScrollViewFrame.size.height);
        NSString * key = [self.vcArray[i] allKeys][0];
        UIViewController * vc = _vcArray[i][key] ;
        vc.view.frame = VCFrame;
        [self.bottomScrollView addSubview:vc.view];
    }

    self.bottomScrollView.contentSize = CGSizeMake(self.vcArray.count * WindowWidth, 0);
    self.bottomScrollView.pagingEnabled = YES;
    self.bottomScrollView.showsHorizontalScrollIndicator = NO;
    self.bottomScrollView.showsVerticalScrollIndicator = NO;
    self.bottomScrollView.directionalLockEnabled = YES;
    self.bottomScrollView.bounces = NO;
    self.bottomScrollView.delegate =self;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGRect frame = _slideView.frame;
    frame.origin.x = scrollView.contentOffset.x/(_vcArray.count + 1) + IndicatorCenter;
    _slideView.frame = frame;
    int pageNum = scrollView.contentOffset.x / WindowWidth;
    
    for (UIButton * btn in _btnArray) {
        if (btn.tag == pageNum ) {
            [btn setTitleColor:HexUIColorFromRGB(0x333333, 1.0) forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:17.0];
        }else{
            [btn setTitleColor:HexUIColorFromRGB(0x333333, 0.6) forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:15.0];
        }
    }
}

-(void) tabButton: (id) sender{
    UIButton *button = sender;

    [button setTitleColor:HexUIColorFromRGB(0x333333, 1.0) forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:17.0];
    
    for (UIButton * btn in _btnArray) {
        if (button != btn ) {
            [btn setTitleColor:HexUIColorFromRGB(0x333333, 0.6) forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:15.0];
        }
    }
    [_bottomScrollView setContentOffset:CGPointMake(button.tag * WindowWidth, 0) animated:YES];
}

@end
