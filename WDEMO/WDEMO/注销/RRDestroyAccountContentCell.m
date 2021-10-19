//
//  RRDestroyAccountContentCell.m
//  PUClient
//
//  Created by WDEMO on 2020/8/13.
//  Copyright © 2020 RRMJ. All rights reserved.
//
#define CellTopMargin             41//顶部
#define CellDetailTopSpacing      6.5//title 和 detail 之间
#define CellSubtitleTopSpacing    13.5 //detail 和 Subtitle之间
#define CellSubtitleSpacing       12 //Subtitle 和 Subtitle之间
#define CellDetailRowSpacing      6//detail 行间距 6
#define CellTextWidth             [UIScreen mainScreen].bounds.size.width - 21 * 2

#import "RRDestroyAccountContentCell.h"
#import "ACMacros.h"
#import <YYKit/YYKit.h>
#import <Masonry/Masonry.h>
@implementation RRDestroyAccountContentModel
+ (instancetype)initWithTitle:(NSString *)title
                       detail:(NSString *)detail
                     name:(NSString *)name
                         time:(NSString *)time
                        level:(NSString *)level
                         type:(RRDestroyAccountContentType)type {
    RRDestroyAccountContentModel *model = [RRDestroyAccountContentModel alloc];
    model.title = title;
    model.detail = detail;
    model.type = type;
    model.name = name;
    model.time = time;
    model.level = level;
    return model;
    
}

- (NSMutableAttributedString *)detailAtt {
    if (!_detailAtt) {
        NSString *str = self.detail;
        CGFloat fontSize = 15.;
        UIFont *textFont = [UIFont systemFontOfSize:fontSize];
        NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:str];
        text.lineSpacing = CellDetailRowSpacing;
        text.font = textFont;
        //        text.color = [UIColor redColor];
        _detailAtt = text;
    }
    return _detailAtt;
}

- (CGFloat)cellHeight {
    CGFloat height = 0.0;
    CGSize size = CGSizeMake([UIScreen mainScreen].bounds.size.width - 21 * 2, CGFLOAT_MAX);
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:size text:self.detailAtt];
    
    switch (self.type) {
        case RRDestroyAccountContentTypeAccountInfo:
        case RRDestroyAccountContentTypeMemberInfo:
        {
            //26 title高度
            //layout.textBoundingSize.height detail高度
            //18 * 3 3个二等标题高度
            height = layout.textBoundingSize.height + CellTopMargin + CellDetailTopSpacing + CellSubtitleTopSpacing + CellSubtitleSpacing * 2 + 26 + 18 * 3;
        }
            break;
        case RRDestroyAccountContentTypeTips:
        {
            height = layout.textBoundingSize.height + CellTopMargin + CellDetailTopSpacing + 26;
        }
            break;
        default:
            break;
    }
    
    
    return height;
}
@end

@implementation RRDestroyAccountContentCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.titleLab];
        [self.contentView addSubview:self.detailLab];
        
        [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(CellTopMargin);
            make.leading.equalTo(self.contentView.mas_leading).offset(21);
            make.trailing.equalTo(self.contentView.mas_trailing).offset(-21);
            make.height.equalTo(@26);
            
        }];
        [self.detailLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLab.mas_bottom).offset(CellDetailTopSpacing);
            make.leading.equalTo(self.titleLab.mas_leading);
            make.trailing.equalTo(self.titleLab.mas_trailing);
        }];
        
    } else {}
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

- (void)fillWithData:(RRDestroyAccountContentModel *)model {
    self.model = model;
    self.titleLab.text = self.model.title;
    self.detailLab.text = self.model.detail;
}

-(UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc]initWithFrame:CGRectZero];
        _titleLab.frame = CGRectMake(0, 0, 40, 40);
        _titleLab.font = [UIFont systemFontOfSize:21.0];
        _titleLab.numberOfLines = 0;
        _titleLab.textColor = kCOLOR_222222;
        
    }
    return _titleLab;
}

//-(UILabel *)detailLab {
//    if (!_detailLab) {
//        _detailLab = [[UILabel alloc]initWithFrame:CGRectZero];
//        _detailLab.frame = CGRectMake(0, 0, 40, 40);
//        _detailLab.font = [UIFont systemFontOfSize:15.0];
//        _detailLab.numberOfLines = 0;
//    }
//    return _detailLab;
//}

- (YYLabel *)detailLab{
    if (!_detailLab) {
        _detailLab = [YYLabel new];
        _detailLab.lineBreakMode = NSLineBreakByCharWrapping;
        _detailLab.numberOfLines = 0;
        _detailLab.userInteractionEnabled = YES;
        _detailLab.textColor = kCOLOR_919699;
    }
    return _detailLab;
}
@end


@implementation RRDestroyAccountContentInfoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self.contentView addSubview:self.subtitleLab1];
        [self.contentView addSubview:self.subtitleLab2];
        [self.contentView addSubview:self.subtitleLab3];
        [self.contentView addSubview:self.contentLab1];
        [self.contentView addSubview:self.contentLab2];
        [self.contentView addSubview:self.contentLab3];
        
        [self.subtitleLab1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.detailLab.mas_bottom).offset(CellSubtitleTopSpacing);
            make.leading.equalTo(self.detailLab.mas_leading);
            make.height.equalTo(@18);
        }];
        [self.subtitleLab2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.subtitleLab1.mas_bottom).offset(CellSubtitleSpacing);
            make.leading.equalTo(self.detailLab.mas_leading);
            make.height.equalTo(@18);
        }];
        [self.subtitleLab3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.subtitleLab2.mas_bottom).offset(CellSubtitleSpacing);
            make.leading.equalTo(self.detailLab.mas_leading);
            make.height.equalTo(@18);
        }];
        
        [self.contentLab1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.subtitleLab1.mas_top);
            make.leading.equalTo(self.subtitleLab1.mas_trailing).offset(10);
            make.trailing.lessThanOrEqualTo(self.detailLab.mas_trailing).offset(0);
            make.height.equalTo(@18);
        }];
        [self.contentLab2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.subtitleLab2.mas_top);
            make.leading.equalTo(self.subtitleLab2.mas_trailing).offset(10);
            make.trailing.equalTo(self.detailLab.mas_trailing);
            make.height.equalTo(@18);
        }];
        [self.contentLab3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.subtitleLab3.mas_top);
            make.leading.equalTo(self.subtitleLab3.mas_trailing).offset(10);
            make.trailing.equalTo(self.detailLab.mas_trailing);
            make.height.equalTo(@18);
        }];
        
    } else {}
    return self;
}

- (void)fillWithData:(RRDestroyAccountContentModel *)model {
    self.model = model;
    self.titleLab.text = self.model.title; 
    //文本布局计算
    CGSize size = CGSizeMake(self.contentView.frame.size.width - 21 * 2, CGFLOAT_MAX);
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:size text:model.detailAtt];
    self.detailLab.attributedText = model.detailAtt;
    self.detailLab.size = layout.textBoundingSize;
    self.detailLab.textLayout = layout;
    
    [self.detailLab mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLab.mas_bottom).offset(6.5);
        make.leading.equalTo(self.titleLab.mas_leading);
        make.trailing.equalTo(self.titleLab.mas_trailing);
        make.height.equalTo(@(layout.textBoundingSize.height));
    }];
    
    switch (model.type) {
        case RRDestroyAccountContentTypeAccountInfo:
        {
            self.subtitleLab1.text = @"- 账号昵称：";
            self.subtitleLab2.text = @"- 注册时间：";
            self.subtitleLab3.text = @"- 等级：";
            
            self.contentLab1.text = self.model.name;
            self.contentLab2.text = self.model.time;
            self.contentLab3.text = self.model.level;
            
            self.subtitleLab1.hidden = NO;
            self.subtitleLab2.hidden = NO;
            self.subtitleLab3.hidden = NO;
            self.contentLab1.hidden = NO;
            self.contentLab2.hidden = NO;
            self.contentLab3.hidden = NO ;
            
            self.contentLab1.textColor = kCOLOR_333333;
            self.contentLab2.textColor = kCOLOR_333333;
            self.contentLab3.textColor = kCOLOR_333333;
            _contentLab1.font = [UIFont systemFontOfSize:15.0];
            _contentLab2.font = [UIFont systemFontOfSize:15.0];
            _contentLab3.font = [UIFont systemFontOfSize:15.0];
            
            
        }
            break;
        case RRDestroyAccountContentTypeMemberInfo:
        {
            self.subtitleLab1.text = @"- 会员权益：";
            self.subtitleLab2.text = @"- 勋章：";
            self.subtitleLab3.text = @"- 成就值：";
            self.contentLab1.text = self.model.name;
            self.contentLab2.text = self.model.time;
            self.contentLab3.text = self.model.level;
            
            self.subtitleLab1.hidden = NO;
            self.subtitleLab2.hidden = NO;
            self.subtitleLab3.hidden = NO;
            self.contentLab1.hidden = NO;
            self.contentLab2.hidden = NO;
            self.contentLab3.hidden = NO ;
            
            self.contentLab1.textColor = kCOLOR_00BBFF;
            self.contentLab2.textColor = kCOLOR_00BBFF;
            self.contentLab3.textColor = kCOLOR_00BBFF;
            _contentLab1.font = [UIFont boldSystemFontOfSize:15.0];
            _contentLab2.font = [UIFont boldSystemFontOfSize:15.0];
            _contentLab3.font = [UIFont boldSystemFontOfSize:15.0];
            
        }
            break;
            
        default:
        {
            self.subtitleLab1.text = @"";
            self.subtitleLab2.text = @"";
            self.subtitleLab3.text = @"";
            self.contentLab1.text = @"";
            self.contentLab2.text = @"";
            self.contentLab3.text = @"";
            
            self.subtitleLab1.hidden = YES;
            self.subtitleLab2.hidden = YES;
            self.subtitleLab3.hidden = YES;
            self.contentLab1.hidden = YES;
            self.contentLab2.hidden = YES;
            self.contentLab3.hidden = YES ;
        }
            break;
    }
}

-(UILabel *)contentLab1 {
    if (!_contentLab1) {
        _contentLab1 = [[UILabel alloc]initWithFrame:CGRectZero];
        _contentLab1.frame = CGRectMake(0, 0, 40, 40);
        _contentLab1.font = [UIFont systemFontOfSize:15.0];
        _contentLab3.textColor = kCOLOR_333333;
        //        _contentLab1.textAlignment = NSTextAlignmentLeft;
    }
    return _contentLab1;
}
-(UILabel *)contentLab2 {
    if (!_contentLab2) {
        _contentLab2 = [[UILabel alloc]initWithFrame:CGRectZero];
        _contentLab2.frame = CGRectMake(0, 0, 40, 40);
        _contentLab2.font = [UIFont systemFontOfSize:15.0];
        _contentLab3.textColor = kCOLOR_333333;
    }
    return _contentLab2;
}

-(UILabel *)contentLab3 {
    if (!_contentLab3) {
        _contentLab3 = [[UILabel alloc]initWithFrame:CGRectZero];
        _contentLab3.frame = CGRectMake(0, 0, 40, 40);
        _contentLab3.font = [UIFont systemFontOfSize:15.0];
        _contentLab3.textColor = kCOLOR_333333;
    }
    return _contentLab3;
}


-(UILabel *)subtitleLab1 {
    if (!_subtitleLab1) {
        _subtitleLab1 = [[UILabel alloc]initWithFrame:CGRectZero];
        _subtitleLab1.frame = CGRectMake(0, 0, 40, 40);
        _subtitleLab1.font = [UIFont systemFontOfSize:15.0];
        _subtitleLab1.textColor = kCOLOR_333333;
    }
    return _subtitleLab1;
}

-(UILabel *)subtitleLab2 {
    if (!_subtitleLab2) {
        _subtitleLab2 = [[UILabel alloc]initWithFrame:CGRectZero];
        _subtitleLab2.frame = CGRectMake(0, 0, 40, 40);
        _subtitleLab2.font = [UIFont systemFontOfSize:15.0];
        _subtitleLab2.textColor = kCOLOR_333333;
    }
    return _subtitleLab2;
}

-(UILabel *)subtitleLab3 {
    if (!_subtitleLab3) {
        _subtitleLab3 = [[UILabel alloc]initWithFrame:CGRectZero];
        _subtitleLab3.frame = CGRectMake(0, 0, 40, 40);
        _subtitleLab3.font = [UIFont systemFontOfSize:15.0];
        _subtitleLab3.textColor = kCOLOR_333333;
    }
    return _subtitleLab3;
}
@end
