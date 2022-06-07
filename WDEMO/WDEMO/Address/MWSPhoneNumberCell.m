//
//  MWSPhoneNumberCell.m
//  MoWanShang
//
//  Created by rrtv on 2022/5/19.
//

#import "MWSPhoneNumberCell.h"

@implementation MWSPhoneNumberCell

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
    
    self.titleLab.text = @"手机号码";
//    self.textField.placeholder = @"手机号码";
    self.textField.keyboardType = UIKeyboardTypeNumberPad;
    
    NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"手机号码"];
    one.lineSpacing = 2.5;
    one.font = [UIFont systemFontOfSize:12];
    one.color = [kCOLOR_FFFFFF colorWithAlphaComponent:0.4];
    self.textField.attributedPlaceholder = one;
    
    self.icon.hidden = YES;
}
 
@end
