//
//  RRSeasonSeniorCommentsCell.m
//  PUClient
//
//  Created by rrtv on 2021/3/25.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRSeasonSeniorCommentsCell.h"
#import <CoreText/CoreText.h>

//#import "RRSeasonSeniorCommentsReplyTableView.h"

@interface RRSeasonSeniorCommentsCell ()
////头像
//@property (nonatomic, strong) UIImageView *avatarImageView;
//@property (nonatomic, strong) UIImageView *avatarVipIconImageView;
////昵称
//@property (nonatomic, strong) UILabel *nicknamelab;//昵称
//@property (nonatomic, strong) UIView *nicknameLevelView;//昵称等级
//@property (nonatomic, strong) UILabel *nicknameLevelLab;//昵称等级
//@property (nonatomic, strong) UIImageView *nicknameVipIconImageView;//昵称vip
//
////剧透
//@property (nonatomic, strong) UIView *firstView;//剧透
//@property (nonatomic, strong) UILabel *firstLab;//剧透
//
////内容
////@property (nonatomic, strong) UILabel *contentLab; //内容
//@property (nonatomic, strong) YYLabel *yyContentLab;//内容
//
////单图
//@property (nonatomic, strong) UIImageView *singleImageView;//单图
//
////底部的View
//@property (nonatomic, strong) UIView *bottomView;
//@property (nonatomic, strong) UILabel *dateLab; //日期
//@property (nonatomic, strong) UIButton *praiseBtn;
//@property (nonatomic, strong) UILabel *praiseBtnLab;
////@property (nonatomic, strong) UIImageView *praiseImageView; //imgV
//
////@property (nonatomic, strong) RRSeasonSeniorCommentsReplyTableView *tableView;
//
////@property (nonatomic, assign) BOOL isShowMore;//是否显示更多数据 默认NO
////@property (nonatomic, assign) BOOL isFirst;//是否是剧透
// 
@end

@implementation RRSeasonSeniorCommentsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //隐藏分割线
        //        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.isShowMore = NO;
        [self setupViews];
    } else {
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)setupViews {
    //aavatar
    [self.contentView addSubview:self.avatarImageView];
    [self.contentView addSubview:self.avatarVipIconImageView];
    //nickname
    [self.contentView addSubview:self.nicknamelab];
    [self.contentView addSubview:self.nicknameLevelView];
    [self.nicknameLevelView addSubview:self.nicknameLevelLab];
    [self.contentView addSubview:self.nicknameVipIconImageView];
    //contentLab
    //    [self.contentView addSubview:self.contentLab];
    [self.contentView addSubview:self.yyContentLab];
    //bottomView
    [self.contentView addSubview:self.bottomView];
    [self.bottomView addSubview:self.dateLab];
    [self.bottomView addSubview:self.praiseBtn];
    [self.praiseBtn addSubview:self.praiseBtnLab];
    //    [self.bottomView addSubview:self.praiseImageView];
    //剧透
    [self.contentView addSubview:self.firstView];
    [self.firstView addSubview:self.firstLab];
    //image
    [self.contentView addSubview:self.singleImageView];
    //replyTable
//    [self.contentView addSubview:self.tableView];

    
    [self.nicknamelab setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    [self.nicknameLevelLab setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
    
    //top 20
    [self.avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@36);
        make.top.equalTo(@12);
        make.leading.equalTo(@16);
    }];
    [self.avatarVipIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.avatarImageView);
        make.trailing.equalTo(self.avatarImageView);
        make.width.equalTo(@11);
        make.height.equalTo(@11);
    }];

    //昵称vip
    [self.nicknameVipIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@14);
        make.height.equalTo(@14);
        make.centerY.equalTo(self.nicknamelab);
        make.trailing.lessThanOrEqualTo(self.contentView.mas_trailing).offset(-16);
    }];
    
    //昵称等级view
    [self.nicknameLevelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.nicknameVipIconImageView.mas_leading).offset(-4);
        make.centerY.equalTo(self.nicknamelab);
        make.leading.equalTo(self.nicknameLevelLab.mas_leading).offset(-4);
        make.height.equalTo(@14);
    }];
    
    //昵称等级lab
    [self.nicknameLevelLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.leading.equalTo(@4);
        make.trailing.equalTo(@-4);
        make.centerY.equalTo(self.nicknameLevelView);
        //        make.trailing.equalTo(@-16);
        //        make.top.equalTo(self.avatarImageView.mas_top).offset(-2);
    }];
    
    //昵称
    [self.nicknamelab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@61);
        make.trailing.equalTo(self.nicknameLevelView.mas_leading).offset(-4);
//        make.top.equalTo(self.avatarImageView.mas_top).offset(-2);
        make.top.equalTo(@10);
    }];
    
 
    //    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.top.equalTo(self.nicknamelab.mas_bottom).offset(7);
    //        make.leading.equalTo(@61);
    //        make.trailing.equalTo(@-16);
    //    }];
    
    //    [self.yyContentLab mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.top.equalTo(self.nicknamelab.mas_bottom).offset(7);
    //        make.leading.equalTo(@61);
    //        make.trailing.equalTo(@-16);
    //    }];
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@0);
        make.leading.equalTo(@0);
        make.trailing.equalTo(@0);
        make.height.equalTo(@45);
    }];
    
    [self.dateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.bottom.equalTo(@0);
        make.leading.equalTo(@61);
        //      make.height.equalTo(@45);
    }];
    
    [self.praiseBtnLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.bottom.equalTo(@0);
        make.trailing.equalTo(@-20);
    }];
    
    [self.praiseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.bottom.equalTo(@0);
        make.trailing.equalTo(@-16);
        //        make.height.equalTo(@45);
        //        make.width.equalTo(@100);
        make.leading.equalTo(self.praiseBtnLab);
    }];
    
    //firstView
    [self.firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.top.equalTo(self.contentLab.mas_top).offset(0);
        make.top.equalTo(self.yyContentLab.mas_top).offset(4);
        make.leading.equalTo(@61);
        make.width.equalTo(@26);
        make.height.equalTo(@14);
    }];
    [self.firstLab mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.edges.equalTo(self.firstView);
        make.center.equalTo(self.firstView);
    }];
    
//    [self.singleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        //        make.top.equalTo(self.contentLab.mas_bottom).offset(4);
//        //        make.top.equalTo(self.yyContentLab.mas_top).offset(0);
//        make.bottom.equalTo(self.bottomView.mas_top).offset(0);
//        make.leading.equalTo(@61);
//        make.width.equalTo(@197);
//        //        make.height.equalTo(@197);
//        make.height.equalTo(self.singleImageView.mas_width).multipliedBy(2.0);
//    }];
     
    //填充数据
    [self fillBottomView];

    [self fillAvaterNickname];

    [self fillText];
}

- (void)fillBottomView {
    self.dateLab.text = @"04-12";
    self.praiseBtnLab.text = @"2144";
}

- (void)fillAvaterNickname {
    
    self.avatarImageView.backgroundColor = [UIColor grayColor];
    //昵称
    //    self.nicknamelab.text = @"鲁智深鲁达鲁提辖";
    self.nicknamelab.text = @"水浒传三国演义西游记红楼梦水浒传三国演义西游记红楼梦";
    self.nicknameLevelLab.text = @"lv.99";
    
//    //vip
    BOOL isVip = YES;
    if (isVip) {
        self.avatarVipIconImageView.hidden = NO;
        self.nicknameVipIconImageView.hidden = NO;
        
        //昵称vip
        [self.nicknameVipIconImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@14);
            make.height.equalTo(@14);
            make.centerY.equalTo(self.nicknamelab);
            make.trailing.lessThanOrEqualTo(self.contentView.mas_trailing).offset(-16);
        }];
        
        //昵称等级view
        [self.nicknameLevelView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.trailing.equalTo(self.nicknameVipIconImageView.mas_leading).offset(-4);
            make.centerY.equalTo(self.nicknamelab);
            make.leading.equalTo(self.nicknameLevelLab.mas_leading).offset(-4);
            make.height.equalTo(@14);
        }];
        
        //昵称等级lab
        [self.nicknameLevelLab mas_remakeConstraints:^(MASConstraintMaker *make) {
    //        make.leading.equalTo(@4);
            make.trailing.equalTo(@-4);
            make.centerY.equalTo(self.nicknameLevelView);
            //        make.trailing.equalTo(@-16);
            //        make.top.equalTo(self.avatarImageView.mas_top).offset(-2);
        }];
        
        //昵称
        [self.nicknamelab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(@61);
            make.trailing.equalTo(self.nicknameLevelView.mas_leading).offset(-4);
    //        make.top.equalTo(self.avatarImageView.mas_top).offset(-2);
            make.top.equalTo(@10);
        }];
        
    } else {
        self.avatarVipIconImageView.hidden = YES;
        self.nicknameVipIconImageView.hidden = YES;
        
        //昵称等级view
        [self.nicknameLevelView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.trailing.lessThanOrEqualTo(self.contentView.mas_trailing).offset(-16);
            make.centerY.equalTo(self.nicknamelab);
            make.leading.equalTo(self.nicknameLevelLab.mas_leading).offset(-4);
            make.height.equalTo(@14);
        }];
        
        //昵称等级lab
        [self.nicknameLevelLab mas_remakeConstraints:^(MASConstraintMaker *make) {
    //        make.leading.equalTo(@4);
            make.trailing.equalTo(@-4);
            make.centerY.equalTo(self.nicknameLevelView);
            //        make.trailing.equalTo(@-16);
            //        make.top.equalTo(self.avatarImageView.mas_top).offset(-2);
        }];
        
        //昵称
        [self.nicknamelab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(@61);
            make.trailing.equalTo(self.nicknameLevelView.mas_leading).offset(-4);
    //        make.top.equalTo(self.avatarImageView.mas_top).offset(-2);
            make.top.equalTo(@10);
        }];
    }
}

- (void)fillText {
    //@"剧透 "
    //@"       " 7个空格
    NSString *firstTextStr = @"      ";//@"剧透 ";//@"       "; @"剧透 ";
    NSString *moreTextStr = @"...";
    NSString *showAllTextStr = @"查看全文";
    
    NSString *str = @"中国古典长篇小说四大名著简称四大名著是指水浒传三国演义西游记红楼梦按照成书先后顺序这四部巨著四大古典名著是中国文学史中的经典作品是世界宝贵的文化遗产此四部巨著在中国文学史上的地位是难分高低的都有着极高的文学水平和艺术成就细致的刻画和所蕴含的深刻思想都为历代读者所称道其中的故事场景人物已经深深地影响了中国人的思想观念价值取向可谓中国文学史上的四座伟大丰碑。\n中国古典长篇小说四大名著简称四大名著是指水浒传三国演义西游记红楼梦按照成书先后顺序这四部巨著四大古典名著是中国文学史中的经典作品是世界宝贵的文化遗产此四部巨著在中国文学史上的地位是难分高低的都有着极高的文学水平和艺术成就细致的刻画和所蕴含的深刻思想都为历代读者所称道其中的故事场景人物已经深深地影响了中国人的思想观念价值取向可谓中国文学史上的四座伟大丰碑。\n";
    
    NSString *content = [str copy] ?: @"";
    NSString *textStr = [str copy] ?: @"";
    //剧透
    BOOL isFirst = YES;
    if (isFirst) {
        //现实剧透标签
        self.firstView.hidden = NO;
        textStr = [firstTextStr stringByAppendingString:textStr];
    } else {
        //隐藏剧透标签
        self.firstView.hidden = YES;
    }
    
    //    self.contentLab.text = textStr;
    self.yyContentLab.text = textStr;
    
    //    ...查看全文
    //    ...查看图片
    //恢复View
    NSArray *array = [self getSeparatedLinesFromYYLabel:self.yyContentLab];
    
    CGFloat fontSize = 14;
    UIFont *textFont = RR_COMMONFONT(fontSize);
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@""];
    text.lineSpacing = 6 - (textFont.lineHeight - textFont.pointSize);
    text.font = textFont;
    text.color = kCOLOR_85888F;
    
//    _isShowMore = YES;
    if (array.count > 5 && !_isShowMore) {
        NSString *line5String = array[4];
        //        NSString *showText = [NSString stringWithFormat:@"%@%@%@%@%@...查看全文", array[0], array[1], array[2], array[3], [line5String substringToIndex:line5String.length - 7]];
//        //1-4行
        NSString *showText = [NSString stringWithFormat:@"%@%@%@%@%@%@", array[0], array[1], array[2], array[3], [line5String substringToIndex:line5String.length - moreTextStr.length - showAllTextStr.length], moreTextStr];
        {
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:showText];
            //              one.lineSpacing = 2.5;
            one.font = textFont;
            one.color = kCOLOR_85888F;
            //设置点击范围以及点击事件（必须先设置好然后再将富文本设置给YYLabel才可以生效）
            [one setTextHighlightRange:one.rangeOfAll
                                 color:kCOLOR_85888F
                       backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.1]
                             tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
                //自定义代码，此处根据需要调整
                NSLog(@"点击了文字 + ...");
                
                //复制文字
                UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
                [pasteboard setString:content];
            }];
            [text appendAttributedString:one];
        }
        {
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:showAllTextStr];
            //              one.lineSpacing = 2.5;
            one.font = textFont;
            one.color = kCOLOR_0091FF;
            //设置点击范围以及点击事件（必须先设置好然后再将富文本设置给YYLabel才可以生效）
            [one setTextHighlightRange:one.rangeOfAll
                                 color:kCOLOR_0091FF
                       backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.1]
                             tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
                //自定义代码，此处根据需要调整
                NSLog(@"查看全文");
            }];
            [text appendAttributedString:one];
        }
          
    } else {
        
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:textStr];
        //              one.lineSpacing = 2.5;
        one.font = textFont;
        one.color = kCOLOR_85888F;
        //设置点击范围以及点击事件（必须先设置好然后再将富文本设置给YYLabel才可以生效）
        [one setTextHighlightRange:one.rangeOfAll
                             color:kCOLOR_85888F
                   backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.1]
                         tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
            //自定义代码，此处根据需要调整
            NSLog(@"点击全部文字");
        }];
        [text appendAttributedString:one];
    }
    
    CGSize yySize = CGSizeMake((KWidth - 61 - 16), CGFLOAT_MAX);
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:yySize text:text];
    CGRect rect = layout.textBoundingRect;
    //        CGSize size = layout.textBoundingSize;
    self.yyContentLab.attributedText = text;
    self.yyContentLab.frame = CGRectMake(61, 34, (KWidth - 61 - 16), rect.size.height + 1);
    
    CGFloat currentHeight = 34 + (rect.size.height + 1);
    self.singleImageView.frame = CGRectMake(61, 4 + currentHeight, 200, 200);
    self.singleImageView.image = IMAGENAME(@"ic_comment_v");
    
    
//    //有回复
//    BOOL isHasReply = YES;
//    self.tableView.frame = CGRectMake(61, 34 + rect.size.height + 1,  (KWidth - 61 - 16), 300);
////    self.tableView.scrollEnabled = NO;
    
    
    
//    //回复小姐姐：漫威10年，最喜欢的超级英雄排名最喜欢的超级英雄排名名
//    NSString *replyNicknameStr = @"小姐姐";
//    NSString *replyStr = @"回复";
//    //冒号
//    NSString *colonStr = @"：";
}

- (UIImageView *)singleImageView {
    if (!_singleImageView) {
        _singleImageView = [[UIImageView alloc] init];
        _singleImageView.frame = CGRectMake(0, 0, 197, 197);
        //        _singleImageView.backgroundColor = [UIColor grayColor];
        //        _singleImageView.hidden = YES;
        _singleImageView.layer.cornerRadius = 8;
        _singleImageView.layer.masksToBounds = YES;
        _singleImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _singleImageView;
}

- (UIImageView *)avatarImageView {
    if (!_avatarImageView) {
        _avatarImageView = [[UIImageView alloc]init];
        _avatarImageView.frame = CGRectMake(0, 0, 36, 36);
        //        _avatarImageView.backgroundColor = [UIColor grayColor];
        //        _coverImageView.hidden = YES;
        _avatarImageView.layer.cornerRadius = 18;
        _avatarImageView.layer.masksToBounds = YES;
        _avatarImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _avatarImageView;
}

- (UILabel *)nicknamelab {
    if (!_nicknamelab) {
        _nicknamelab = [[UILabel alloc] init];
        _nicknamelab.frame = CGRectMake(0, 0, 40, 40);
        _nicknamelab.font = RR_BOLDFONT(14);
        _nicknamelab.textColor = kCOLOR_dynamicProvider_222222_E5E7EB;
    }
    return _nicknamelab;
}

//- (UILabel *)contentLab {
//    if (!_contentLab) {
//        _contentLab = [[UILabel alloc] init];
//        _contentLab.frame = CGRectMake(0, 0, KWidth -61 - 16, 40);
//        _contentLab.font = RR_COMMONFONT(12);
//        _contentLab.textColor = kCOLOR_85888F;
//        _contentLab.numberOfLines = 0;
//
//    }
//    return _contentLab;
//}

- (YYLabel *)yyContentLab {
    if (!_yyContentLab) {
        _yyContentLab = [YYLabel new];
        _yyContentLab.frame = CGRectMake(0, 0, KWidth - 61 - 16, 300);
        _yyContentLab.font = RR_COMMONFONT(14);
        _yyContentLab.lineBreakMode = NSLineBreakByCharWrapping;
        _yyContentLab.numberOfLines = 0;
        //        _yyContentLab.userInteractionEnabled = YES;
        
        UILongPressGestureRecognizer* longPressGr = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressToDo:)];
        longPressGr.minimumPressDuration = 1.0;
        [_yyContentLab addGestureRecognizer:longPressGr];
    }
    return _yyContentLab;
}

#pragma mark长按手势
- (void)longPressToDo:(UILongPressGestureRecognizer *)gesture {
     //长按开始
     if (gesture.state == UIGestureRecognizerStateBegan) {
        NSLog(@"--> 长按手势 state :begin ");
    } else {
         //长按结束
        NSLog(@"--> 长按手势 state :end ");
    }
}


- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 45)];
    }
    return _bottomView;
}

- (UILabel *)dateLab {
    if (!_dateLab) {
        _dateLab = [[UILabel alloc] init];
        _dateLab.frame = CGRectMake(0, 0, 40, 40);
        _dateLab.font = RR_COMMONFONT(12);
        _dateLab.textColor = kCOLOR_85888F;
    }
    return _dateLab;
}

- (UIButton *)praiseBtn {
    if (!_praiseBtn) {
        _praiseBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320, 45)];
        [_praiseBtn setImage:[UIImage imageNamed:@"ic_comment_like_n"] forState:UIControlStateNormal];
        [_praiseBtn setImage:[UIImage imageNamed:@"ic_comment_like_h"] forState:UIControlStateSelected];
        _praiseBtn.selected = YES;
        _praiseBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        
    }
    return _praiseBtn;
}

//- (UIImageView *)praiseImageView {
//    if (!_praiseImageView) {
//        _praiseImageView = [[UIImageView alloc]init];
//        _praiseImageView.frame = CGRectMake(0, 0, 36, 36);
//        //        _avatarImageView.backgroundColor = [UIColor grayColor];
//        //        _coverImageView.hidden = YES;
//        //        _praiseImageView.layer.cornerRadius = 18;
//        //        _praiseImageView.layer.masksToBounds = YES;
//        //        _praiseImageView.contentMode = UIViewContentModeScaleAspectFill;
//    }
//    return _praiseImageView;
//}

- (UILabel *)praiseBtnLab {
    if (!_praiseBtnLab) {
        _praiseBtnLab = [[UILabel alloc] init];
        _praiseBtnLab.frame = CGRectMake(0, 0, 40, 40);
        _praiseBtnLab.font = RR_COMMONFONT(12);
        _praiseBtnLab.textColor = kCOLOR_85888F;
    }
    return _praiseBtnLab;
}

- (UIImageView *)avatarVipIconImageView {
    if (!_avatarVipIconImageView) {
        _avatarVipIconImageView = [[UIImageView alloc]init];
        _avatarVipIconImageView.frame = CGRectMake(0, 0, 9, 9);
        //        _avatarImageView.backgroundColor = [UIColor grayColor];
        //        _avatarVipIconImageView.hidden = YES;
        //        _avatarVipIconImageView.layer.cornerRadius = 4.5;
        //        _avatarVipIconImageView.layer.masksToBounds = YES;
        //        _avatarVipIconImageView.layer.borderWidth = 1;
        //        _avatarVipIconImageView.layer.borderColor = kCOLOR_dynamicProvider_FFFFFF_1F2126.CGColor;
        _avatarVipIconImageView.image  = IMAGENAME(@"ic_comment_v");
        _avatarVipIconImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _avatarVipIconImageView;
}

- (UIImageView *)nicknameVipIconImageView {
    if (!_nicknameVipIconImageView) {
        _nicknameVipIconImageView = [[UIImageView alloc]init];
        _nicknameVipIconImageView.frame = CGRectMake(0, 0, 11, 11);
        ////        _nicknameVipIconImageView.backgroundColor = [UIColor grayColor];
        //        //        _nicknameVipIconImageView.hidden = YES;
        //                _nicknameVipIconImageView.layer.cornerRadius = 18;
        //                _nicknameVipIconImageView.layer.masksToBounds = YES;
        _nicknameVipIconImageView.contentMode = UIViewContentModeScaleAspectFill;
        _nicknameVipIconImageView.image  = IMAGENAME(@"ic_comment_vip");
        
    }
    return _nicknameVipIconImageView;
}

- (UIView *)nicknameLevelView {
    if (!_nicknameLevelView) {
        _nicknameLevelView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 14)];
        _nicknameLevelView.layer.cornerRadius = 7;
        _nicknameLevelView.layer.masksToBounds = YES;
        _nicknameLevelView.backgroundColor = kCOLOR_F0F1F2;
    }
    return _nicknameLevelView;
}

- (UILabel *)nicknameLevelLab {
    if (!_nicknameLevelLab) {
        _nicknameLevelLab = [[UILabel alloc] init];
        _nicknameLevelLab.frame = CGRectMake(0, 0, 40, 40);
        _nicknameLevelLab.font = RR_BOLDFONT(9);
        _nicknameLevelLab.textColor = kCOLOR_6D7380;
    }
    return _nicknameLevelLab;
}

- (UIView *)firstView {
    if (!_firstView) {
        _firstView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 26, 14)];
        _firstView.layer.cornerRadius = 3;
        _firstView.layer.masksToBounds = YES;
        _firstView.backgroundColor = [kCOLOR_FF4865 colorWithAlphaComponent:0.1];
    }
    return _firstView;
}

- (UILabel *)firstLab {
    if (!_firstLab) {
        _firstLab = [[UILabel alloc] init];
        _firstLab.frame = CGRectMake(0, 0, 26, 14);
        _firstLab.font = RR_COMMONFONT(10);
        _firstLab.textColor = kCOLOR_FF4865;
        _firstLab.textAlignment = NSTextAlignmentCenter;
        _firstLab.text = @"剧透";
    }
    return _firstLab;
}

//- (RRSeasonSeniorCommentsReplyTableView *)tableView {
//    if (!_tableView) {
//        _tableView = [[RRSeasonSeniorCommentsReplyTableView alloc] initWithFrame:CGRectMake(0, 0, (KWidth - 61 - 16), 100)];
//    }
//    return _tableView;
//}

- (NSArray *)getSeparatedLinesFromYYLabel:(YYLabel *)yyLabel {
    UILabel *label= [[UILabel alloc] init];
    label.text = [yyLabel text];
    label.font = [yyLabel font];
    label.frame = [yyLabel frame];
    return [self getSeparatedLinesFromLabel:label];
}

- (NSArray *)getSeparatedLinesFromLabel:(UILabel *)label {
    NSString *text = [label text];
    UIFont *font = [label font];
    CGRect rect = [label frame];
    CTFontRef myFont = CTFontCreateWithName((__bridge CFStringRef)([font fontName]), [font pointSize], NULL);
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:text];
    [attStr addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)myFont range:NSMakeRange(0, attStr.length)];
    
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)attStr);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0, 0, rect.size.width, 100000));
    
    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, NULL);
    
    NSArray *lines = (__bridge NSArray *)CTFrameGetLines(frame);
    NSMutableArray *linesArray = [[NSMutableArray alloc] init];
    
    for (id line in lines) {
        CTLineRef lineRef = (__bridge CTLineRef)line;
        CFRange lineRange = CTLineGetStringRange(lineRef);
        NSRange range = NSMakeRange(lineRange.location, lineRange.length);
        
        NSString *lineString = [text substringWithRange:range];
        [linesArray addObject:lineString];
    }
    return linesArray;
}
@end
