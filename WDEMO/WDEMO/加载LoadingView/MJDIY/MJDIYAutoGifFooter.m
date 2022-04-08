//
//  MJDIYAutoGifFooter.m
//  WDEMO
//
//  Created by rrtv on 2022/3/28.
//  Copyright © 2022 wwc. All rights reserved.
//

#import "MJDIYAutoGifFooter.h"

@implementation MJDIYAutoGifFooter

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init
{
    self = [super init];
    if (self) {
        //设置正在刷新状态的动画图片
        NSMutableArray * refreshingImages = [NSMutableArray array];
        for (NSUInteger i = 1; i<=3; i++) {
            UIImage * image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_loading_0%zd",i]];
            [refreshingImages addObject:image];
        }
        [self setImages:refreshingImages forState:MJRefreshStateIdle];
        [self setImages:refreshingImages forState:MJRefreshStatePulling];
        [self setImages:refreshingImages forState:MJRefreshStateRefreshing];
        [self setImages:refreshingImages forState:MJRefreshStateWillRefresh];
    }
    return self;
}

- (void)placeSubviews
{
    [super placeSubviews];
    
    if (self.gifView.constraints.count) return;
    
    self.gifView.frame = self.bounds;
    self.gifView.contentMode = UIViewContentModeCenter;
   
}
@end
