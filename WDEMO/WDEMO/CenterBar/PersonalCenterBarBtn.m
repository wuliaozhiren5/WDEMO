//
//  PersonalCenterBarBtn.m
//  xxx
//
//  Created by xxx on 16/12/7.
//  Copyright © 2016年 developer. All rights reserved.
//

#import "PersonalCenterBarBtn.h"

@implementation PersonalCenterBarBtn

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

//- (instancetype)initWithFrame:(CGRect)frame Title:(NSString *)title
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        //标题
//        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
//        _titleLabel.textAlignment = NSTextAlignmentCenter;
//        _titleLabel.text = title;
//        _titleLabel.font = [UIFont systemFontOfSize:16];
//        //    _countLabel.textColor = ItemNorTintColor;
//        _titleLabel.textColor = [UIColor grayColor];
//        [self addSubview:_titleLabel];
//    }
//    return self;
//}
- (instancetype)initWithFrame:(CGRect)frame
                        Title:(NSString *)title
                    TitleFont:(UIFont *)titleFont{
    

    self = [super initWithFrame:frame];
    if (self) {
        //标题
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = title;
        if (titleFont) {
            _titleLabel.font = titleFont;

        } else {
            _titleLabel.font = [UIFont systemFontOfSize:16];
        }
        //    _countLabel.textColor = ItemNorTintColor;
        _titleLabel.textColor = [UIColor grayColor];
        [self addSubview:_titleLabel];
    }
    return self;

}
@end
