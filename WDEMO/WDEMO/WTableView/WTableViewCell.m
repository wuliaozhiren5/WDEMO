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

//@property (nonatomic, strong) UILabel *leftLabel;
//
//@property (nonatomic, strong) UILabel *rightLabel;
//
//@property (nonatomic, strong) UIImageView *nextImage;

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
        //cell选中颜色
        //        self.selectionStyle = UITableViewCellSelectionStyleNone;
        //分割线
        //        self.separatorInset = UIEdgeInsetsMake(0, 21, 0, 21);
        
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
    //todo
}

+ (CGFloat)heightForCellWithModel:(id)model {
    return 44;
}

+ (CGFloat)cellHeightWithModel:(id)model {
    return 44;
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

-(UILabel *)firstLabel {
    if (!_firstLabel) {
        _firstLabel = [[UILabel alloc] init];
        _firstLabel.frame = CGRectMake(0, 0, 40, 40);
        [self.contentView addSubview:_firstLabel];
        
    }
    return _firstLabel;
}

-(UILabel *)secondLabel {
    if (!_secondLabel) {
        _secondLabel = [[UILabel alloc] init];
        _secondLabel.frame = CGRectMake(0, 0, 40, 40);
        [self.contentView addSubview:_secondLabel];
        
    }
    return _secondLabel;
}

-(UILabel *)rightLabel {
    if (!_rightLabel) {
        _rightLabel = [[UILabel alloc] init];
        _rightLabel.frame = CGRectMake(0, 0, 40, 40);
        _rightLabel.hidden = YES;
        [self.contentView addSubview:_rightLabel];
    }
    return _rightLabel;
}

-(UIButton *)selectBtn {
    if (!_selectBtn) {
        _selectBtn = [[UIButton alloc] init];
        _selectBtn.frame = CGRectMake(10, 0, 40, 40);
        _selectBtn.hidden = YES;
        [_selectBtn setImage:[UIImage imageNamed:@"ic_common_checkbox_selected"] forState:UIControlStateSelected];
        [_selectBtn setImage:[UIImage imageNamed:@"ic_common_checkbox"] forState:UIControlStateNormal];
        _selectBtn.userInteractionEnabled = NO;
        [self.contentView addSubview:_selectBtn];
    }
    return _selectBtn;
}

//xib
+ (instancetype)classObjWithNib {
    NSArray * array = [[NSBundle mainBundle] loadNibNamed:@"WTableViewCell" owner:self options:nil];
    return array.firstObject;
}

//xib
//一般是自定义类,需要提供一个遍历构造方法,方便使用
+ (instancetype)initWithXib {
    return [[[NSBundle mainBundle] loadNibNamed:@"WTableViewCell" owner:nil options:nil] lastObject];// lastObject 可改为 firstObject，该数组只有一个元素，写哪个都行，看个人习惯。
}

+ (NSString *)cellIndentifier {
    return @"WTableViewCell";
}
@end
