//
//  WTableViewCell.m
//  WDEMO
//
//  Created by longzhu on 2019/9/2.
//  Copyright © 2019年 wwc. All rights reserved.
//

#import "WTableViewCell.h"

@interface WTableViewCell ()

//@property (nonatomic, strong) UILabel *firstLabel;
//
//@property (nonatomic, strong) UILabel *secondLabel;
//
//@property (nonatomic, strong) UIImageView *avatarImageView;

@property (nonatomic, strong) UILabel *leftLabel;

@property (nonatomic, strong) UILabel *rightLabel;

@property (nonatomic, strong) UIImageView *nextImage;

@end

@implementation WTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//        self.selectionStyle = UITableViewCellSelectionStyleNone;
         
        self.avatarImageView.frame = CGRectMake(10, 10, 40, 40);
        self.firstLabel.frame = CGRectMake(60, 10, 200, 20);
        self.secondLabel.frame = CGRectMake(60, 30, 200, 20);
        self.rightLabel.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 100, 0, 80, 60);

        self.nextImage.frame = CGRectMake([UIScreen mainScreen].bounds.size.width -40, 20, 20, 20);

        self.firstLabel.text = @"firstLabel"; 
        self.secondLabel.text = @"secondLabel"; 
        self.rightLabel.text = @"rightLabel";
        
    } else {}
    return self;
}

- (void)fillWithData:(id)data {
    
}

//lazy
-(UIImageView *)avatarImageView {
    
    if (!_avatarImageView) {
        _avatarImageView = [[UIImageView alloc]init];
        _avatarImageView.frame = CGRectMake(0, 0, 40, 40);
        _avatarImageView.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:_avatarImageView];
    }
    return _avatarImageView;
}

-(UIImageView *)nextImage {
    
    if (!_nextImage) {
        _nextImage = [[UIImageView alloc]init];
        _nextImage.frame = CGRectMake(0, 0, 40, 40);
        _nextImage.backgroundColor = [UIColor grayColor];
        _nextImage.hidden = YES;
        [self.contentView addSubview:_nextImage];
    }
    return _nextImage;
}


-(UILabel *)firstLabel
{
    if (!_firstLabel) {
        _firstLabel = [[UILabel alloc] init];
        _firstLabel.frame = CGRectMake(0, 0, 40, 40);
        [self.contentView addSubview:_firstLabel];
        
    }
    return _firstLabel;
    
}

-(UILabel *)secondLabel
{
    if (!_secondLabel) {
        _secondLabel = [[UILabel alloc] init];
        _secondLabel.frame = CGRectMake(0, 0, 40, 40);
        [self.contentView addSubview:_secondLabel];
        
    }
    return _secondLabel;
    
}


-(UILabel *)rightLabel
{
    if (!_rightLabel) {
        _rightLabel = [[UILabel alloc] init];
        _rightLabel.frame = CGRectMake(0, 0, 40, 40);
        _rightLabel.hidden = YES;
        [self.contentView addSubview:_rightLabel];
    }
    return _rightLabel;
    
}

@end
