//
//  MWSZipCodeCell.m
//  MoWanShang
//
//  Created by rrtv on 2022/5/19.
//

#import "MWSZipCodeCell.h"

@implementation MWSZipCodeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setupViews {
    [super setupViews];
    
    self.titleLab.text = @"邮政编码";
//    self.textField.placeholder = @"邮政编码";
    self.textField.keyboardType = UIKeyboardTypeNumberPad;

    NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"邮政编码"];
    one.lineSpacing = 2.5;
    one.font = [UIFont systemFontOfSize:12];
    one.color = [kCOLOR_FFFFFF colorWithAlphaComponent:0.4];
    self.textField.attributedPlaceholder = one;
    
    self.icon.hidden = YES;

}

@end
