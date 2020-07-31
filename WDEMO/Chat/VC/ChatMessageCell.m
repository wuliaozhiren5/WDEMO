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
        //        _content = [[UILabel alloc] init];
        //        _content.numberOfLines = 0;
        //        [self.bubbleView addSubview:_content];
        self.contentView.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
        
        [self.contentView addSubview:self.bubbleView];
        [self.bubbleView addSubview:self.content];
        [self.bubbleView addSubview:self.yyContent];
        
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
    //    self.bubbleView.backgroundColor = ChatBubbleColor;
    //    公告气泡
    self.bubbleView.backgroundColor = NoticeBubbleColor;
    
    self.bubbleView.frame = CGRectMake(data.bubbleOrigin.x, data.bubbleOrigin.y,data.bubbleSize.width,  data.bubbleSize.height);
    self.content.frame = CGRectMake(data.textOrigin.x, data.textOrigin.y,data.textSize.width,  data.textSize.height);
    
}
- (void)fillWithYYData:(ChatMessageYYDataModel *)data {
    
}

-(UILabel *)content{
    if (!_content) {
        _content = [[UILabel alloc]initWithFrame:CGRectZero];
        _content.lineBreakMode = NSLineBreakByCharWrapping;
        _content.numberOfLines = 0;
    }
    return _content;
    
}

- (UIImageView *)bubbleView {
    if (!_bubbleView) {
        _bubbleView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _bubbleView.layer.cornerRadius = 8;
        //        _bubbleView.mm_fill();
        _bubbleView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return _bubbleView;
    
}

- (YYLabel *)yyContent{
    if (!_yyContent) {
        _yyContent = [[YYLabel alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
        _yyContent.lineBreakMode = NSLineBreakByCharWrapping;
        _yyContent.numberOfLines = 0;
    }
    return _yyContent;
}


@end
