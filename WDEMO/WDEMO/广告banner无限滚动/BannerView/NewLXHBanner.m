
#import "NewLXHBanner.h"

#define SC_WIDTH  self.frame.size.width
#define SC_HEIGHT self.frame.size.height
#define HexUIColorFromRGB(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]

@implementation NewLXHBanner

- (instancetype)initWithFrame:(CGRect)frame array:(NSArray*)array{
    self = [super initWithFrame:frame];
    if (self) {
        self.timerInterval= 2;
        self.autoScroll = YES;
        self.bannerArray = array;
        self.pageCount = array.count;
        [self creatScrollView];
    }
    return self;
}

- (void)creatScrollView {
     
    if (!(self.bannerArray.count > 0)) {
        return;
    }
    
    self.bannerScroll = [[UIScrollView alloc]init];
    self.bannerScroll.frame = CGRectMake(0, 0,SC_WIDTH,SC_HEIGHT);
    [self addSubview:self.bannerScroll];
    
    self.bannerScroll.contentSize = CGSizeMake((self.bannerArray.count+2)*SC_WIDTH, 0);
    self.bannerScroll.pagingEnabled = YES;
    self.bannerScroll.showsHorizontalScrollIndicator = NO ;
    self.bannerScroll.delegate = self;
    
    NSMutableArray *tagArr = [NSMutableArray array];
    NSMutableArray *arr = [NSMutableArray array];
    if (self.bannerArray.lastObject) {
        NSInteger tag = self.bannerArray.count - 1;
        [tagArr addObject:@(tag).stringValue];
        [arr addObject:self.bannerArray.lastObject];
    }
    
    for (int i = 0; i < self.bannerArray.count; i++) {
        NSInteger tag = i;
        [tagArr addObject:@(tag).stringValue];
        [arr addObject:self.bannerArray[i]];
     }
    
    if (self.bannerArray.firstObject) {
        NSInteger tag = 0;
        [tagArr addObject:@(tag).stringValue];
        [arr addObject:self.bannerArray.firstObject];
     }
 
    for (int i = 0; i < arr.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i*SC_WIDTH, 0, SC_WIDTH, SC_HEIGHT)];
        imageView.image = [UIImage imageNamed:arr[i]];
        NSString *tagStr = tagArr[i];
        imageView.tag = tagStr.integerValue;
        [self.bannerScroll addSubview:imageView];
        
//        imageView.userInteractionEnabled = YES;
//        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
//        [imageView addGestureRecognizer:tap];
    }
    self.bannerScroll.contentOffset = CGPointMake(SC_WIDTH, 0);
    
    self.bannerPageControl = [[UIPageControl alloc] init];
    self.bannerPageControl.frame = CGRectMake(0, SC_HEIGHT-25, SC_WIDTH, 25);
    self.bannerPageControl.numberOfPages = self.pageCount;
    self.bannerPageControl.currentPage = 0;
    self.bannerPageControl.pageIndicatorTintColor = HexUIColorFromRGB(0xFFFFFF, 0.5);
    self.bannerPageControl.currentPageIndicatorTintColor = HexUIColorFromRGB(0xFFFFFF, 1.0);
    [self addSubview:self.bannerPageControl];
    
    //创建定时器
    [self creatTimer];

}

//#pragma mark - 点击图片
//- (void)tap:(UITapGestureRecognizer *)tap {
// 
//}

- (void)creatTimer {
    if (!self.autoScroll) {
        return;
    }
    self.bannerTimer = [NSTimer scheduledTimerWithTimeInterval:self.timerInterval
                                              target:self
                                            selector:@selector(changeScrollOffset)
                                            userInfo:nil
                                             repeats:YES];
    // 调整timer 的优先级
    NSRunLoop *mainLoop = [NSRunLoop mainRunLoop];

    [mainLoop addTimer:self.bannerTimer forMode:NSRunLoopCommonModes];
}

- (void)changeScrollOffset {
    if (!self.autoScroll) {
        [self stopTimer];
        self.bannerTimer = nil;
        return;
    }
    [self.bannerScroll setContentOffset:CGPointMake((self.bannerPageControl.currentPage + 2) * SC_WIDTH, 0) animated:YES];
}

- (void)stopTimer
{
    [self.bannerTimer invalidate];
    self.bannerTimer = nil;
}

#pragma  mark **************UIScrollViewDelegate*******************
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint point = scrollView.contentOffset;
    BOOL isRight = self.oldScrollOffset > point.x;
    self.oldScrollOffset = point.x;

    // 调整pageControl的当前 位置
    if (point.x > SC_WIDTH * (self.pageCount) + SC_WIDTH * 0.5 && !self.bannerTimer) {
        self.bannerPageControl.currentPage = 0;
    }
    else if (point.x < SC_WIDTH * 0.5 && self.bannerTimer && isRight) {
//    else if (point.x < SC_WIDTH * 0.5 && isRight) {

        self.bannerPageControl.currentPage = self.pageCount - 1;
    }
    else {
        self.bannerPageControl.currentPage = (point.x + SC_WIDTH * 0.5 ) / SC_WIDTH - 1;
    }

    //处理两种情况，1、当偏移量超出scrollView contentSize最大值时 2、当偏移量小于零时
    if (point.x >= SC_WIDTH * (self.pageCount + 1)) {

        [scrollView setContentOffset:CGPointMake(SC_WIDTH, 0) animated:NO];

    } else if (point.x < 0) {

        [scrollView setContentOffset:CGPointMake(point.x + SC_WIDTH * (self.pageCount), 0) animated:NO];
    }
}
/**
 手指开始拖动的时候, 就让计时器停止
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {

    [self stopTimer];

    self.bannerTimer = nil ;
}
/**
 手指离开屏幕的时候, 就让计时器开始工作
 */
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {

    [self creatTimer];
}

@end
