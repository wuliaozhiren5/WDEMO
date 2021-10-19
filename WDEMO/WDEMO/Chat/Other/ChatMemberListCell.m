//
//  ChatMemberListCell.m
//  WDEMO
//
//  Created by WDEMO on 2020/7/27.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "ChatMemberListCell.h"
#import "UIImage+ChatKit.h"

@implementation ChatMemberListCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.1/1.0];
        
        self.contentView.layer.cornerRadius = self.contentView.bounds.size.width/2;
        self.contentView.layer.masksToBounds = YES;
    }
    return self;
}
-(UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:self.contentView.bounds];
        _titleLabel.frame = self.contentView.bounds;
        _titleLabel.font = [UIFont systemFontOfSize:12.0];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        //        _titleLabel.frame = CGRectMake(10, 10, 50, 50);
        [self.contentView addSubview:_titleLabel];
        //        [_tagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //            make.center.equalTo(self.contentView);
        //        }];
    }
    return _titleLabel;
}

-(UIImageView *)avaterImageView {
    if (!_avaterImageView) {
        _avaterImageView = [[UIImageView alloc]initWithFrame:self.contentView.bounds];
        _avaterImageView.frame = CGRectMake(0, 0, 15, 15);
//        _avaterImageView.backgroundColor = [UIColor greenColor];
        _avaterImageView.center = self.contentView.center;
//        _avaterImageView.image= [UIImage chat_imageNamed:@"ic_liveroom_addpeople"];
        _avaterImageView.image= [UIImage chat_imageNamed:@"ic_popbar_ personalhomepage"];
 
        [self.contentView addSubview:_avaterImageView];
    }
    return _avaterImageView;
}
@end
