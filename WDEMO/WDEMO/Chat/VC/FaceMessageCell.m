//
//  FaceMessageCell.m
//  WDEMO
//
//  Created by rrtv on 2020/7/28.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "FaceMessageCell.h"


@implementation FaceMessageCell

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
    //聊天气泡
    self.bubbleView.backgroundColor = ChatBubbleColor;
    
    self.bubbleView.frame = CGRectMake(data.bubbleOrigin.x, data.bubbleOrigin.y,data.bubbleSize.width,  data.bubbleSize.height);
    self.content.frame = CGRectMake(data.textOrigin.x, data.textOrigin.y,data.textSize.width,  data.textSize.height);
    
}

- (void)fillWithYYData:(ChatMessageYYDataModel *)data {
    
    //    //聊天气泡
    //    self.bubbleView.backgroundColor = ChatBubbleColor;
    //    self.bubbleView.frame = CGRectMake(data.bubbleOrigin.x, data.bubbleOrigin.y, data.bubbleSize.width, data.bubbleSize.height);
    //
    //    self.yyContent.attributedText = data.yyAttributedString;
    //    self.yyContent.origin =  CGPointMake(data.textOrigin.x, data.textOrigin.y);
    //    self.yyContent.size = data.layout.textBoundingSize;
    //    self.yyContent.textLayout = data.layout;
    
    CGSize yySize = CGSizeMake(self.cellWidth, CGFLOAT_MAX);
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:yySize text:data.yyAttributedString];
    //    CGRect rect = layout.textBoundingRect;
    CGSize size = layout.textBoundingSize;
    
    CGPoint textOrigin = CGPointZero;
    CGPoint bubbleOrigin = CGPointZero;
    CGSize  textSize = CGSizeZero;
    CGSize  bubbleSize = CGSizeZero;
    
    bubbleOrigin = CGPointMake(TTextMessageCell_Bubble_LeftMargin, TTextMessageCell_Bubble_TopMargin);
    textOrigin = CGPointMake(TTextMessageCell_BubbleText_Margin, TTextMessageCell_BubbleText_Margin);
    bubbleSize = CGSizeMake(size.width + TTextMessageCell_BubbleText_Margin * 2, size.height + TTextMessageCell_BubbleText_Margin * 2);
    textSize = CGSizeMake(size.width, size.height);
    
    self.yyContent.attributedText = data.yyAttributedString;
    //聊天气泡
    self.bubbleView.backgroundColor = ChatBubbleColor;
    self.bubbleView.frame = CGRectMake(bubbleOrigin.x, bubbleOrigin.y, bubbleSize.width, bubbleSize.height);
    self.yyContent.frame = CGRectMake(textOrigin.x, textOrigin.y, textSize.width, textSize.height);
}

@end
