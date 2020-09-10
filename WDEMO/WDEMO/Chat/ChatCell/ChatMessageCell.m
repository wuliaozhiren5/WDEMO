//
//  IMMessageCell.m
//  WDEMO
//
//  Created by rrtv on 2020/7/23.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "ChatMessageCell.h"

@interface ChatMessageCell ()

@end

@implementation ChatMessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        self.contentView.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
 
//        [self.contentView addSubview:self.bubbleView];
//        [self.bubbleView addSubview:self.content];
//        [self.bubbleView addSubview:self.yyContent];
        
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
    
//    self.content.attributedText = data.attributedString;
//    //聊天气泡
//    //    self.bubbleView.backgroundColor = ChatBubbleColor;
//    //    公告气泡
//    self.bubbleView.backgroundColor = NoticeBubbleColor;
//
//    self.bubbleView.frame = CGRectMake(data.bubbleOrigin.x, data.bubbleOrigin.y,data.bubbleSize.width,  data.bubbleSize.height);
//    self.content.frame = CGRectMake(data.textOrigin.x, data.textOrigin.y,data.textSize.width,  data.textSize.height);
     
    CGRect rect = [data.attributedString boundingRectWithSize:CGSizeMake(self.cellWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
    CGSize size = rect.size;
      
    CGPoint textOrigin = CGPointZero;
    CGPoint bubbleOrigin = CGPointZero;
    CGSize  textSize = CGSizeZero;
    CGSize  bubbleSize = CGSizeZero;
    
    bubbleOrigin = CGPointMake(TTextMessageCell_Bubble_LeftMargin, TTextMessageCell_Bubble_TopMargin);
    textOrigin = CGPointMake(TTextMessageCell_BubbleText_Margin, TTextMessageCell_BubbleText_Margin);
    bubbleSize = CGSizeMake(size.width + TTextMessageCell_BubbleText_Margin * 2, size.height + TTextMessageCell_BubbleText_Margin * 2);
    textSize = CGSizeMake(size.width, size.height);
    
    self.content.attributedText = data.attributedString;
    //聊天气泡
    self.bubbleView.backgroundColor = ChatBubbleColor;
    self.bubbleView.frame = CGRectMake(bubbleOrigin.x, bubbleOrigin.y, bubbleSize.width, bubbleSize.height);
    self.content.frame = CGRectMake(textOrigin.x, textOrigin.y, textSize.width, textSize.height);
}

- (void)fillWithYYData:(ChatMessageYYDataModel *)data {
}

-(UILabel *)content{
    if (!_content) {
        _content = [[UILabel alloc]initWithFrame:CGRectZero];
        _content.lineBreakMode = NSLineBreakByCharWrapping;
        _content.numberOfLines = 0;
//        _content.userInteractionEnabled = YES; 
        [self.bubbleView addSubview:_content];
     }
    return _content;
    
}

- (UIImageView *)bubbleView {
    if (!_bubbleView) {
        _bubbleView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
        _bubbleView.layer.cornerRadius = 8;
        //        _bubbleView.mm_fill();
//        _bubbleView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _bubbleView.userInteractionEnabled = YES;

        [self.contentView addSubview:_bubbleView];
     }
    return _bubbleView;
    
}

- (YYLabel *)yyContent{
    if (!_yyContent) {
        _yyContent = [YYLabel new];
        _yyContent.lineBreakMode = NSLineBreakByCharWrapping;
        _yyContent.numberOfLines = 0;
        _yyContent.userInteractionEnabled = YES;

        [self.bubbleView addSubview:_yyContent];
    }
    return _yyContent;
}


@end
