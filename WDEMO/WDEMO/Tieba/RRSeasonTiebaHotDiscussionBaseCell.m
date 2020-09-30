//
//  RRSeasonTiebaHotDiscussionBaseCell.m
//  PUClient
//
//  Created by rrtv on 2020/9/29.
//  Copyright © 2020 RRMJ. All rights reserved.
//

#define kTiebaImageViewWidth     (KWidth - 21 * 2 - 4.5 * 2)/3
#define kTiebaLongContentwidth   KWidth - 21 * 2
#define kTiebaShortContentwidth  KWidth - 21 * 2 - 13 - kTiebaImageViewWidth

#import "RRSeasonTiebaHotDiscussionBaseCell.h"
@interface RRSeasonTiebaHotDiscussionBaseCell ()
@property (nonatomic, strong) UILabel *titleLabel;//标题
@property (nonatomic, strong) UILabel *contentLabel;//内容
@property (nonatomic, strong) UIImageView *authorAvatarView;//头像
@property (nonatomic, strong) UILabel *authorNameLabel;//昵称
@property (nonatomic, strong) UILabel *discussionCountLabel;//评论数量
@property (nonatomic, strong) UIView *line;//底部横线
@property (nonatomic, copy) NSArray *imageViews;//预览图片：3张
@end

@implementation RRSeasonTiebaHotDiscussionBaseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.contentLabel];
        [self.contentView addSubview:self.authorAvatarView];
        [self.contentView addSubview:self.authorNameLabel];
        [self.contentView addSubview:self.discussionCountLabel];
        [self.contentView addSubview:self.line];
        
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

- (void)fillWithData:(id)data {
}

+ (CGFloat)cellHeightWithModel:(id)model{
    return 44;
}

-(UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        _titleLabel.numberOfLines = 1;
        _titleLabel.font = RR_BOLDFONT(15);
        _titleLabel.textColor = kCOLOR_dynamicProvider_333333_DADBDC;
    }
    return _titleLabel;
}

-(UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        _contentLabel.numberOfLines = 3;
        _contentLabel.font = RR_COMMONFONT(15);
        _contentLabel.textColor = kCOLOR_dynamicProvider_333333_DADBDC;
        _contentLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _contentLabel.textAlignment = NSTextAlignmentJustified;

    }
    return _contentLabel;
}

-(UIImageView *)authorAvatarView {
    if (!_authorAvatarView) {
        _authorAvatarView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 12, 12)];
        _authorAvatarView.layer.cornerRadius = 6;
        _authorAvatarView.layer.masksToBounds = YES;
        _authorAvatarView.backgroundColor = kCOLOR_dynamicProvider_333333_DADBDC;
    }
    return _authorAvatarView;
}

-(UILabel *)authorNameLabel {
    if (!_authorNameLabel) {
        _authorNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        _authorNameLabel.font = RR_COMMONFONT(12);
        _authorNameLabel.textColor = kCOLOR_919699;
    }
    return _authorNameLabel;
}

-(UILabel *)discussionCountLabel {
    if (!_discussionCountLabel) {
        _discussionCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        _discussionCountLabel.font = RR_COMMONFONT(12);
        _discussionCountLabel.textColor = kCOLOR_919699;
    }
    return _discussionCountLabel;
}

- (UIView *)line {
    if (!_line) {
        _line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, kMinBorderWidth)];
        _line.backgroundColor = kCOLOR_dynamicProvider_E6E7E8_333333;
    }
    return _line;
}
@end


@interface RRSeasonTiebaHotDiscussionTextCell ()
@end
@implementation RRSeasonTiebaHotDiscussionTextCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
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

//填充数据
- (void)fillWithData:(id)data {
    NSString *titleStr = @"最喜欢的超级英雄排名漫威";
    //    NSString *contentStr =  @"毒舌电影美丽毒舌电影美丽毒舌电影美丽";
    NSString *contentStr = @"经典角色超人稳居第一，蜘蛛侠、钢铁侠紧随请后，有没有你心目中的英雄呢经典角色超人稳居后有没有你心目中的英雄呢经典角色超人稳居…经典角色超人稳居第一，蜘蛛侠、钢铁侠紧随请后，有没有你心目中的英雄呢经典角色超人稳居后有没有你心目中的英雄呢经典角色超人稳居…";;
    NSString *nameStr = @"毒舌电影美丽毒舌电影美丽毒舌电影美丽";
    NSString *countStr = @"123评论";
    
    self.titleLabel.text = titleStr;
    self.authorNameLabel.text = nameStr;
    self.discussionCountLabel.text = countStr;
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:contentStr];
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc]init];
    paragraph.lineSpacing = 6;
    paragraph.alignment = NSTextAlignmentJustified;
    paragraph.lineBreakMode = NSLineBreakByTruncatingTail;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraph range:NSMakeRange(0, attributedString.length)];
    self.contentLabel.attributedText = attributedString;
    self.contentLabel.numberOfLines = 3;
    CGSize size = [self.contentLabel sizeThatFits:CGSizeMake(kTiebaLongContentwidth, MAXFLOAT)];
    NSLog(@"hot width = %f, hot height = %f",size.width, size.height);
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(21);
        make.leading.mas_equalTo(21);
        make.trailing.mas_equalTo(-21);
        make.height.mas_equalTo(21);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(6);
        //            make.bottom.mas_equalTo(self.authorAvatarView.mas_top).offset(15);
        make.leading.mas_equalTo(21);
        make.trailing.mas_equalTo(-21);
        //        make.height.mas_equalTo(size.height);
    }];
    
    [self.discussionCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(-21);
        make.top.mas_equalTo(self.contentLabel.mas_bottom).offset(12);
    }];
    
    
    [self.authorAvatarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(21);
        make.centerY.mas_equalTo(self.discussionCountLabel.mas_centerY);
        make.size.mas_equalTo(12);
    }];
    
    [self.authorNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.authorAvatarView.mas_trailing).offset(3);
        make.centerY.mas_equalTo(self.authorAvatarView.mas_centerY);
        make.width.mas_lessThanOrEqualTo(84);
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(21);
        make.trailing.mas_equalTo(-21);
        make.height.mas_equalTo(kMinBorderWidth);
        make.bottom.mas_equalTo(0);
    }];
}

//计算高度
+ (CGFloat)cellHeightWithModel:(id)model{
    return 44;
}
@end


@interface RRSeasonTiebaHotDiscussionSinglePictureCell ()
@property (nonatomic, strong) UIImageView *singlePictureView;//预览图片：1张
@end
@implementation RRSeasonTiebaHotDiscussionSinglePictureCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.singlePictureView];
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

//填充数据
- (void)fillWithData:(id)data {
    NSString *titleStr = @"最喜欢的超级英雄排名漫威";
    //    NSString *contentStr =  @"毒舌电影美丽毒舌电影美丽毒舌电影美丽";
    NSString *contentStr = @"经典角色超人稳居第一，蜘蛛侠、钢铁侠紧随请后，有没有你心目中的英雄呢经典角色超人稳居后有没有你心目中的英雄呢经典角色超人稳居…经典角色超人稳居第一，蜘蛛侠、钢铁侠紧随请后，有没有你心目中的英雄呢经典角色超人稳居后有没有你心目中的英雄呢经典角色超人稳居…";;
    NSString *nameStr = @"毒舌电影美丽毒舌电影美丽毒舌电影美丽";
    NSString *countStr = @"123评论";
    
    self.titleLabel.text = titleStr;
    self.authorNameLabel.text = nameStr;
    self.discussionCountLabel.text = countStr;
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:contentStr];
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc]init];
    paragraph.lineSpacing = 6;
    paragraph.alignment = NSTextAlignmentJustified;
    paragraph.lineBreakMode = NSLineBreakByTruncatingTail;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraph range:NSMakeRange(0, attributedString.length)];
    self.contentLabel.attributedText = attributedString;
    self.contentLabel.numberOfLines = 0;
    //    CGSize size = [self.contentLabel sizeThatFits:CGSizeMake(kTiebaShortContentwidth, MAXFLOAT)];
    //    NSLog(@"hot width = %f, hot height = %f",size.width, size.height);
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(21);
        make.leading.mas_equalTo(21);
        make.trailing.mas_equalTo(-21);
        make.height.mas_equalTo(21);
    }];
    
    [self.singlePictureView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo((kTiebaImageViewWidth));
        make.top.mas_equalTo(45);
        make.trailing.mas_equalTo(-21);
    }];
    
    [self.discussionCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(-21);
        make.top.mas_equalTo(self.singlePictureView.mas_bottom).offset(12);
    }];
    
    [self.authorAvatarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(21);
        make.centerY.mas_equalTo(self.discussionCountLabel.mas_centerY);
        make.size.mas_equalTo(12);
    }];
    
    [self.authorNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.authorAvatarView.mas_trailing).offset(3);
        make.centerY.mas_equalTo(self.authorAvatarView.mas_centerY);
        make.width.mas_lessThanOrEqualTo(84);
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(21);
        make.trailing.mas_equalTo(-21);
        make.height.mas_equalTo(kMinBorderWidth);
        make.bottom.mas_equalTo(0);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.singlePictureView);
        make.leading.mas_equalTo(21);
        make.width.mas_equalTo(kTiebaShortContentwidth);
        make.height.mas_lessThanOrEqualTo(kTiebaImageViewWidth);
    }];
}

//计算高度
+ (CGFloat)cellHeightWithModel:(id)model{
    return 44;
}

-(UIImageView *)singlePictureView {
    if (!_singlePictureView) {
        _singlePictureView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        _singlePictureView.layer.cornerRadius = 3;
        _singlePictureView.layer.masksToBounds = YES;
        _singlePictureView.backgroundColor = kCOLOR_dynamicProvider_333333_DADBDC;
    }
    return _singlePictureView;
}
@end


@interface RRSeasonTiebaHotDiscussionThreePictureCell ()
@end
@implementation RRSeasonTiebaHotDiscussionThreePictureCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSMutableArray *mArray = [NSMutableArray array];
        for (int i = 0; i < 3; i ++) {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
            imageView.contentMode = UIViewContentModeScaleAspectFill;
            imageView.layer.cornerRadius = 3;
            imageView.layer.masksToBounds = YES;
            [self.contentView addSubview:imageView];
            [mArray addObject:imageView];
            
            imageView.backgroundColor = [UIColor redColor];
        }
        self.imageViews = mArray;
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

//填充数据
- (void)fillWithData:(id)data {
    NSString *titleStr = @"最喜欢的超级英雄排名漫威";
    //    NSString *contentStr =  @"毒舌电影美丽毒舌电影美丽毒舌电影美丽";
    NSString *contentStr = @"经典角色超人稳居第一，蜘蛛侠、钢铁侠紧随请后，有没有你心目中的英雄呢经典角色超人稳居后有没有你心目中的英雄呢经典角色超人稳居…经典角色超人稳居第一，蜘蛛侠、钢铁侠紧随请后，有没有你心目中的英雄呢经典角色超人稳居后有没有你心目中的英雄呢经典角色超人稳居";;
    NSString *nameStr = @"毒舌电影美丽毒舌电影美丽毒舌电影美丽";
    NSString *countStr = @"123评论";
    
    self.titleLabel.text = titleStr;
    self.authorNameLabel.text = nameStr;
    self.discussionCountLabel.text = countStr;
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:contentStr];
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc]init];
    paragraph.lineSpacing = 6;
    paragraph.alignment = NSTextAlignmentJustified;
    paragraph.lineBreakMode = NSLineBreakByTruncatingTail;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraph range:NSMakeRange(0, attributedString.length)];
    self.contentLabel.attributedText = attributedString;
    self.contentLabel.numberOfLines = 3;
    CGSize size = [self.contentLabel sizeThatFits:CGSizeMake(kTiebaLongContentwidth, MAXFLOAT)];
    NSLog(@"hot width = %f, hot height = %f",size.width, size.height);
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(21);
        make.leading.mas_equalTo(21);
        make.trailing.mas_equalTo(-21);
        make.height.mas_equalTo(21);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(6);
        //            make.bottom.mas_equalTo(self.authorAvatarView.mas_top).offset(15);
        make.leading.mas_equalTo(21);
        make.trailing.mas_equalTo(-21);
        //        make.height.mas_equalTo(size.height);
    }];
    
    //实现masonry水平固定间隔方法
    [self.imageViews mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:4.5 leadSpacing:21 tailSpacing:21];
    //设置array的垂直方向的约束
    [self.imageViews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentLabel.mas_bottom).offset(6);
        make.height.mas_equalTo(kTiebaImageViewWidth);
    }];
    
    [self.discussionCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(-21);
        make.top.mas_equalTo(self.contentLabel.mas_bottom).offset(6 + 12 + kTiebaImageViewWidth);
    }];
    
    [self.authorAvatarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(21);
        make.centerY.mas_equalTo(self.discussionCountLabel.mas_centerY);
        make.size.mas_equalTo(12);
    }];
    
    [self.authorNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.authorAvatarView.mas_trailing).offset(3);
        make.centerY.mas_equalTo(self.authorAvatarView.mas_centerY);
        make.width.mas_lessThanOrEqualTo(84);
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(21);
        make.trailing.mas_equalTo(-21);
        make.height.mas_equalTo(kMinBorderWidth);
        make.bottom.mas_equalTo(0);
    }];
}

//计算高度
+ (CGFloat)cellHeightWithModel:(id)model{
    return 44;
}
@end
