//
//  RRDramaCommentPraiseBtnInputBar.m
//  NJVideo
//
//  Created by rrtv on 2021/9/7.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRDramaCommentPraiseBtnInputBar.h"

@implementation RRDramaCommentPraiseBtnInputBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setCommentModel:(RRSeniorCommentsModel *)commentModel {
    [super setCommentModel:commentModel];
    self.praiseBtn.selected = commentModel.liked;
//    self.praiseBtnLab.text = [NSString transformNinetyMillionCountWithString:commentModel.likeCount];
}

@end
