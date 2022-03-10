//
//  MWSTabBarButton.m
//  MoWanShang
//
//  Created by rrtv on 2022/3/9.
//

#import "MWSTabBarButton.h"

@implementation MWSTabBarButton

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
    [self addSubview:self.tabBarBtnImageView];
    self.tabBarBtnImageView.center = CGPointMake(self.frame.size.width / 2.0, self.frame.size.height / 2.0);
    self.tabBarBtnImageView.backgroundColor = [UIColor blackColor];
}

- (void)setSelected:(BOOL)selected {
//    [super setSelected:selected];
//    if (!selected) {
//        [self setImage:self.normalImage forState:UIControlStateNormal];
//    } else {
//        [self setImage:self.selectedImage forState:UIControlStateNormal];
//    }
}

- (UIImageView *)tabBarBtnImageView {
    if (!_tabBarBtnImageView) {
        _tabBarBtnImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    }
    return _tabBarBtnImageView;
}
@end
