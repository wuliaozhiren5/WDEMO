//
//  RRSeasonSeniorCommentsReplyTextImageCell.m
//  NJVideo
//
//  Created by WDEMO on 2021/8/12.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRSeasonSeniorCommentsReplyTextImageCell.h"

@implementation RRSeasonSeniorCommentsReplyTextImageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.isShowMore = YES;
        [self setupViews];
        self.firstView.hidden = YES;

    } else {
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)setupViews {
    [super setupViews];
}

- (NSMutableAttributedString *)handleTextWithModel:(RRSeniorCommentsModel *)model isShowAll:(BOOL)isShowAll {
    
    //回复小姐姐：漫威10年，最喜欢的超级英雄排名最喜欢的超级英雄排名名
    NSString *replyNicknameStr = model.reply2UserName ?: @"";
    NSString *replyStr = @"回复";
    //冒号
    NSString *colonStr = @"：";
    NSString *content = [model.content copy] ?: @"";
    NSString *textStr = [model.content copy] ?: @"";;
    
    CGFloat fontSize = 14;
    UIFont *textFont = RR_COMMONFONT(fontSize);
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@""];
    text.lineSpacing = 6 - (textFont.lineHeight - textFont.pointSize);
    text.font = textFont;
    text.color = kCOLOR_dynamicProvider_222222_E5E7EB;

//    BOOL isHasReply = NO;
    BOOL isHasReply = (model.reply2UserName.length > 0 && model.reply2UseId.length > 0);
    if (isHasReply) {
        {
            //回复
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:replyStr];
            //              one.lineSpacing = 2.5;
            one.font = textFont;
            one.color = kCOLOR_dynamicProvider_222222_E5E7EB;
            [text appendAttributedString:one];
        }
        {
            //replyNicknameStr
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:replyNicknameStr];
            //              one.lineSpacing = 2.5;
            one.font = textFont;
            one.color = kCOLOR_0091FF;
            //设置点击范围以及点击事件（必须先设置好然后再将富文本设置给YYLabel才可以生效）
            [one setTextHighlightRange:one.rangeOfAll
                                 color:kCOLOR_0091FF
                       backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.1]
                             tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
                //自定义代码，此处根据需要调整
                NSLog(@"replyNicknameStr");
//                [[RRAppLinkManager sharedManager] goUpuserDetail:model.reply2UseId toRoot:NO];

            }];
            [text appendAttributedString:one];
        }
        {
            //冒号
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:colonStr];
            //              one.lineSpacing = 2.5;
            one.font = textFont;
            one.color = kCOLOR_85888F;
            [text appendAttributedString:one];
        }
        {
            //内容
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:textStr];
            //              one.lineSpacing = 2.5;
            one.font = textFont;
            one.color = kCOLOR_dynamicProvider_222222_DADBDC;
            [text appendAttributedString:one];
        }
    } else {
        //内容
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:textStr];
        //              one.lineSpacing = 2.5;
        one.font = textFont;
        one.color = kCOLOR_dynamicProvider_222222_DADBDC;
        [text appendAttributedString:one];
    }
    return text;
}

//+ (CGFloat)cellHeightWithModel:(RRSeniorCommentsModel *)model isShowAll:(BOOL)isShowAll {
//    CGFloat currentHeight = [super cellHeightWithModel:model isShowAll:isShowAll];
//    return currentHeight;
//}

+ (NSMutableAttributedString *)handleTextHeightWithModel:(RRSeniorCommentsModel *)model isShowAll:(BOOL)isShowAll {
    //回复小姐姐：漫威10年，最喜欢的超级英雄排名最喜欢的超级英雄排名名
    NSString *replyNicknameStr = model.reply2UserName ?: @"";
    NSString *replyStr = @"回复";
    //冒号
    NSString *colonStr = @"：";
    NSString *content = [model.content copy] ?: @"";
    NSString *textStr = [model.content copy] ?: @"";;
    
    CGFloat fontSize = 14;
    UIFont *textFont = RR_COMMONFONT(fontSize);
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@""];
    text.lineSpacing = 6 - (textFont.lineHeight - textFont.pointSize);
    text.font = textFont;
    text.color = kCOLOR_dynamicProvider_222222_E5E7EB;

//    BOOL isHasReply = NO;
    BOOL isHasReply = (model.reply2UserName.length > 0 && model.reply2UseId.length > 0);
    if (isHasReply) {
        {
            //回复
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:replyStr];
            //              one.lineSpacing = 2.5;
            one.font = textFont;
            one.color = kCOLOR_dynamicProvider_222222_E5E7EB;
            [text appendAttributedString:one];
        }
        {
            //replyNicknameStr
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:replyNicknameStr];
            //              one.lineSpacing = 2.5;
            one.font = textFont;
            one.color = kCOLOR_0091FF;
            [text appendAttributedString:one];
        }
        {
            //冒号
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:colonStr];
            //              one.lineSpacing = 2.5;
            one.font = textFont;
            one.color = kCOLOR_85888F;
            [text appendAttributedString:one];
        }
        {
            //内容
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:textStr];
            //              one.lineSpacing = 2.5;
            one.font = textFont;
            one.color = kCOLOR_dynamicProvider_222222_DADBDC;
            [text appendAttributedString:one];
        }
    } else {
        //内容
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:textStr];
        //              one.lineSpacing = 2.5;
        one.font = textFont;
        one.color = kCOLOR_dynamicProvider_222222_DADBDC;
        [text appendAttributedString:one];
    }
    return text;
}
@end
