//
//  MWSSelectRegionCell.m
//  MoWanShang
//
//  Created by rrtv on 2022/5/19.
//

#import "MWSSelectRegionCell.h"

@implementation MWSSelectRegionCell

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
//        self.backgroundColor = kCOLOR_dynamicProvider_F7F8FA_292B31;
        self.contentView.backgroundColor = kCOLOR_0F0F0F;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupViews];
    } else {}
    return self;
}

- (void)setupViews {
    [super setupViews];
    
    self.titleLab.text = @"选择地区";
//    self.textField.placeholder = @"选择地区";
    self.textField.userInteractionEnabled = NO;
    
    NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"选择地区"];
    one.lineSpacing = 2.5;
    one.font = [UIFont systemFontOfSize:12];
    one.color = [kCOLOR_FFFFFF colorWithAlphaComponent:0.4];
    self.textField.attributedPlaceholder = one;
    
    self.icon.hidden = NO;
    self.icon.image = [UIImage imageNamed:@"pic_adress"];

}

@end
