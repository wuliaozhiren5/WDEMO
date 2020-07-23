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

@property (nonatomic, strong) YYLabel *contentLabel;
@property (nonatomic, strong) UILabel *label;

@end
@implementation IMMessageCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        self.backgroundColor = [UIColor clearColor];
        
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
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
    //set data
    //    [super fillWithData:data];
    //    self.textData = data;
    //    self.content.attributedText = data.attributedString;
    //    self.content.textColor = data.textColor;
    //  font set in attributedString
    
    
//    self.label.attributedText = data.attributedString;
//    self.label.frame = CGRectMake(0, 0, 100, 55);
 
    
    // 1. Create an attributed string.
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"Some Text, blabla..."];
        
 
    
  [text setTextHighlightRange:NSMakeRange(0, 4)
              color:[UIColor blueColor]
    backgroundColor:[UIColor grayColor]
          tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
      
              NSLog(@"tap text range:...");
          }];
  self.contentLabel.attributedText = text;
    
//    self.contentLabel.attributedText = data.attributedString;
  self.contentLabel.frame = CGRectMake(0, 0, 100, 55);
    
    
}
-(UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc]init];
        [self.contentView addSubview:_label];
    }
    return _label;
    
}
- (YYLabel *)contentLabel{
    
    if (!_contentLabel) {
        _contentLabel = [[YYLabel alloc]init];
        [self.contentView addSubview:_contentLabel];
        
    }
    return _contentLabel;
}



@end
