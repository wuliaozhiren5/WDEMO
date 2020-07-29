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
        
        _bubbleView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _bubbleView.layer.cornerRadius = 8;
        
        [self.contentView addSubview:_bubbleView];
        //        _bubbleView.mm_fill();
        _bubbleView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        _content = [[UILabel alloc] init];
        _content.lineBreakMode = NSLineBreakByCharWrapping;
        _content.numberOfLines = 0;
        [self.bubbleView addSubview:_content];
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

-(UILabel *)content{
    if (!_content) {
        _content = [[UILabel alloc]init];
    }
    return _content;
    
}


@end
