//
//  ListModelCell.m
//  WDEMO
//
//  Created by WDEMO on 2020/8/10.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "ListModelCell.h"

@implementation ListModelCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    } else {}
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)fillWithData:(ListModel *)data {
    self.firstLabel.text = data.title;
    self.secondLabel.text = data.detail;
    self.selectBtn.selected = data.isSelected;
}

+ (CGFloat)cellHeightWithModel:(ListModel *)model {
    return 44;
}

- (void)setIsUserEditState:(BOOL)isUserEditState {
    _isUserEditState = isUserEditState;
    if (isUserEditState) {
        self.selectBtn.hidden = NO;
        self.selectBtn.frame = CGRectMake(10, 10, 40, 40);
        self.avatarImageView.frame = CGRectMake(10 + 50, 10, 40, 40);
        self.firstLabel.frame = CGRectMake(60 + 50, 10, 200, 20);
        self.secondLabel.frame = CGRectMake(60 + 50, 30, 200, 20);
    } else {
        self.selectBtn.hidden = YES;
        self.avatarImageView.frame = CGRectMake(10, 10, 40, 40);
        self.firstLabel.frame = CGRectMake(60, 10, 200, 20);
        self.secondLabel.frame = CGRectMake(60, 30, 200, 20);
        self.rightLabel.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 100, 0, 80, 60);
        self.nextImage.frame = CGRectMake([UIScreen mainScreen].bounds.size.width -40, 20, 20, 20);
    }
}

@end
