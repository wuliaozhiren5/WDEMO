//
//  RRTalkCommentDetailCell.m
//  PPVideo
//
//  Created by rrtv on 2021/12/17.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRTalkCommentDetailCell.h"

@implementation RRTalkCommentDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(RRSeniorCommentsModel *)model {
    [super setModel:model];
//    self.dateLab.hidden = YES;
    self.scoreView.hidden = YES;
    
    //当前高度
    CGFloat currentHeight = 0;
    CGFloat imageHeight = 0;
    imageHeight = self.imageScrollView.frame.size.height;
    if (imageHeight > 0) {
        currentHeight = imageHeight;
    }

    self.yyContentLab.frame = CGRectMake(self.yyContentLab.origin.x, currentHeight + 20, self.yyContentLab.frame.size.width, self.yyContentLab.frame.size.height);
    //文字高度
    CGFloat textViewHeight = self.yyContentLab.frame.size.height;
    if (textViewHeight > 0) {
        currentHeight = currentHeight + 20 + textViewHeight;
    }

    RRSeriesItemModel *dramaModel = model.drama;
    if (dramaModel) {
        self.seasonView.frame = CGRectMake(16, currentHeight + 20 , (KWidth - 16 * 2), 70);
    } else {
        self.seasonView.frame = CGRectMake(16, currentHeight + 20 , (KWidth - 16 * 2), 0);
    }
    //卡片高度
    CGFloat seasonViewHeight = self.seasonView.frame.size.height;

    if (seasonViewHeight > 0) {
        currentHeight = currentHeight + 20 + seasonViewHeight;
    }

//    currentHeight = currentHeight + 20;
    
    self.dateLab.frame = CGRectMake(16, currentHeight, KWidth - 16 * 2, 36);
    currentHeight = currentHeight + self.dateLab.frame.size.height;
}
 
//文字top
+ (CGFloat)cellContentLabTopWithModel:(RRSeniorCommentsModel *)model {
    CGFloat currentHeight = [super cellContentLabTopWithModel:model];
    return currentHeight - 12 - 30 ;
}

+ (CGFloat)cellHeightWithModel:(RRSeniorCommentsModel *)model {
    CGFloat currentHeight = [super cellHeightWithModel:model];
 
    //12是 评分的top边距
    //30是 评分和时间的高度
    //36是 新的时间的高度
    //16是 和父视图的差值（UI走查）
    return currentHeight - 12 - 30 + 36 - 16; 
}
@end
