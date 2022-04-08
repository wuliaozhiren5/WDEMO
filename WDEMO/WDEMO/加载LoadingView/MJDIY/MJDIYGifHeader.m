//
//  MJDIYGifHeader.m
//  WDEMO
//
//  Created by rrtv on 2022/3/28.
//  Copyright © 2022 wwc. All rights reserved.
//

#import "MJDIYGifHeader.h"

@implementation MJDIYGifHeader

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
        self.lastUpdatedTimeLabel.hidden = YES;
        self.stateLabel.hidden = YES;
        
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

@end
