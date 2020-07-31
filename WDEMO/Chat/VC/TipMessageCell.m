//
//  TipMessageCell.m
//  WDEMO
//
//  Created by rrtv on 2020/7/28.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "TipMessageCell.h"

@implementation TipMessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)fillWithData:(ChatMessageDataModel *)data {

    self.content.attributedText = data.attributedString;
    //    公告气泡
    self.bubbleView.backgroundColor = NoticeBubbleColor;
    
    self.bubbleView.frame = CGRectMake(data.bubbleOrigin.x, data.bubbleOrigin.y,data.bubbleSize.width,  data.bubbleSize.height);
    self.content.frame = CGRectMake(data.textOrigin.x, data.textOrigin.y,data.textSize.width,  data.textSize.height);
    
}


- (void)fillWithYYData:(ChatMessageYYDataModel *)data {
     
    //    公告气泡
    self.bubbleView.backgroundColor = NoticeBubbleColor;
    self.bubbleView.frame = CGRectMake(data.bubbleOrigin.x, data.bubbleOrigin.y,data.bubbleSize.width,  data.bubbleSize.height);
 
    self.yyContent.attributedText = data.attributedString;
    self.yyContent.origin =  CGPointMake(data.textOrigin.x, data.textOrigin.y);
    self.yyContent.size = data.layout.textBoundingSize;
    self.yyContent.textLayout = data.layout;
    
}
@end
