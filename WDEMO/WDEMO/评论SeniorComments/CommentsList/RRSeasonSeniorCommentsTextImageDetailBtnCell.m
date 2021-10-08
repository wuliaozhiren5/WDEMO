//
//  RRSeasonSeniorCommentsTextImageDetailBtnCell.m
//  NJVideo
//
//  Created by rrtv on 2021/8/11.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRSeasonSeniorCommentsTextImageDetailBtnCell.h"

@implementation RRSeasonSeniorCommentsTextImageDetailBtnCell

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
    [self.contentView addSubview:self.detailBtn];
}

- (void)setModel:(RRSeniorCommentsModel *)model {
    [super setModel:model];
    self.detailBtn.frame = CGRectMake(62, self.bottomView.frame.origin.y + 15 + 6, 80, 45);

}

+ (CGFloat)cellHeightWithModel:(RRSeniorCommentsModel *)model isShowAll:(BOOL)isShowAll {
    CGFloat height = [super cellHeightWithModel:model isShowAll:isShowAll];
    return height + 15 + 6;
}

- (void)clickDetailBtn:(UIButton *)btn {
    NSLog(@"查看详情");
    if (self.clickDetail) {
        self.clickDetail(self.model);
    }
}

- (UIButton *)detailBtn {
    if (!_detailBtn) {
        _detailBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 45)];
        [_detailBtn setTitle:@"查看详情" forState:UIControlStateNormal];
        _detailBtn.titleLabel.font = SYSTEMFONT(12);
        [_detailBtn setTitleColor:kCOLOR_1890FF forState:UIControlStateNormal];
        _detailBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [_detailBtn addTarget:self action:@selector(clickDetailBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _detailBtn;
}
@end
