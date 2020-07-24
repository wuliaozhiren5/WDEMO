//
//  IMMessageCell.m
//  WDEMO
//
//  Created by rrtv on 2020/7/23.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "IMMessageCell.h"
#import <YYKit/YYKit.h>

@interface IMMessageCell ()

@property (nonatomic, strong) UILabel *content;
@property (nonatomic, strong) UIImageView *bubbleView;

@end
@implementation IMMessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        _content = [[UILabel alloc] init];
//        _content.numberOfLines = 0;
//        [self.bubbleView addSubview:_content];
        
        
        _bubbleView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:_bubbleView];
//        _bubbleView.mm_fill();
//        _bubbleView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
         _content = [[UILabel alloc] init];
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


- (void)fillWithData:(TUITextMessageCellData *)data;
{
  
    self.content.attributedText = data.attributedString;
    self.content.frame = CGRectMake(0, 0, 100, 55);
  
}
-(UILabel *)content{
    if (!_content) {
        _content = [[UILabel alloc]init];
        [self.contentView addSubview:_content];
    }
    return _content;
    
}
 

@end
