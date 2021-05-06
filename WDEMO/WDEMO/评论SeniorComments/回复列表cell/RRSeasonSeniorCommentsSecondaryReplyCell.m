//
//  RRSeasonSeniorCommentsSecondaryReplyCell.m
//  PUClient
//
//  Created by rrtv on 2021/4/12.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRSeasonSeniorCommentsSecondaryReplyCell.h"
#import "YYKit.h"

@implementation RRSeasonSeniorCommentsSecondaryReplyCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //cell选中颜色
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

- (void)fillText {
    self.firstView.hidden = YES;
    //回复小姐姐：漫威10年，最喜欢的超级英雄排名最喜欢的超级英雄排名名
    NSString *replyNicknameStr = @"小姐姐";
    NSString *replyStr = @"回复";
    //冒号
    NSString *colonStr = @"：";
    
    NSString *textStr = @"中国古典长篇小说四大名著，简称四大名著，是指《水浒传》《三国演义》《西游记》《红楼梦》（按照成书先后顺序）这四部巨著。\n四大古典名著是中国文学史中的经典作品，是世界宝贵的文化遗产。此四部巨著在中国文学史上的地位是难分高低的，都有着极高的文学水平和艺术成就，细致的刻画和所蕴含的深刻思想都为历代读者所称道，其中的故事、场景、人物已经深深地影响了中国人的思想观念、价值取向。可谓中国文学史上的四座伟大丰碑。\n中国古典长篇小说四大名著，简称四大名著，是指《水浒传》《三国演义》《西游记》《红楼梦》（按照成书先后顺序）这四部巨著。\n四大古典名著是中国文学史中的经典作品，是世界宝贵的文化遗产。此四部巨著在中国文学史上的地位是难分高低的，都有着极高的文学水平和艺术成就，细致的刻画和所蕴含的深刻思想都为历代读者所称道，其中的故事、场景、人物已经深深地影响了中国人的思想观念、价值取向。可谓中国文学史上的四座伟大丰碑。\n中国古典长篇小说四大名著，简称四大名著，是指《水浒传》《三国演义》《西游记》《红楼梦》（按照成书先后顺序）这四部巨著。\n四大古典名著是中国文学史中的经典作品，是世界宝贵的文化遗产。此四部巨著在中国文学史上的地位是难分高低的，都有着极高的文学水平和艺术成就，细致的刻画和所蕴含的深刻思想都为历代读者所称道，其中的故事、场景、人物已经深深地影响了中国人的思想观念、价值取向。可谓中国文学史上的四座伟大丰碑。\n中国古典长篇小说四大名著，简称四大名著，是指《水浒传》《三国演义》《西游记》《红楼梦》（按照成书先后顺序）这四部巨著。\n";
    
    CGFloat fontSize = 14;
    UIFont *textFont = RR_COMMONFONT(fontSize);
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@""];
    text.lineSpacing = 6 - (textFont.lineHeight - textFont.pointSize);
    text.font = textFont;
    text.color = kCOLOR_85888F;
    
//    BOOL isHasReply = NO;
    BOOL isHasReply = YES;
    if (isHasReply) {
        {
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:replyStr];
            //              one.lineSpacing = 2.5;
            one.font = textFont;
            one.color = kCOLOR_85888F;
            [text appendAttributedString:one];
        }
        {
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
    
    
//    //    self.contentLab.text = textStr;
//    self.yyContentLab.text = textStr;
//
//    //    ...查看全文
//    //    ...查看图片
//    //恢复View
//    NSArray *array = [self getSeparatedLinesFromYYLabel:self.yyContentLab];
//
//    CGFloat fontSize = 14;
//    UIFont *textFont = RR_COMMONFONT(fontSize);
//    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@""];
//    text.lineSpacing = 6 - (textFont.lineHeight - textFont.pointSize);
//    text.font = textFont;
//    text.color = kCOLOR_85888F;
//
////    _isShowMore = YES;
//    if (array.count > 5 && !_isShowMore) {
//        NSString *line5String = array[4];
//        //        NSString *showText = [NSString stringWithFormat:@"%@%@%@%@%@...查看全文", array[0], array[1], array[2], array[3], [line5String substringToIndex:line5String.length - 7]];
////        //1-4行
//        NSString *showText = [NSString stringWithFormat:@"%@%@%@%@%@%@", array[0], array[1], array[2], array[3], [line5String substringToIndex:line5String.length - moreTextStr.length - showAllTextStr.length], moreTextStr];
//        {
//            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:showText];
//            //              one.lineSpacing = 2.5;
//            one.font = textFont;
//            one.color = kCOLOR_85888F;
//            //设置点击范围以及点击事件（必须先设置好然后再将富文本设置给YYLabel才可以生效）
//            [one setTextHighlightRange:one.rangeOfAll
//                                 color:kCOLOR_85888F
//                       backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.1]
//                             tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
//                //自定义代码，此处根据需要调整
//                NSLog(@"点击了文字 + ...");
//            }];
//            [text appendAttributedString:one];
//        }
//        {
//            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:showAllTextStr];
//            //              one.lineSpacing = 2.5;
//            one.font = textFont;
//            one.color = kCOLOR_0091FF;
//            //设置点击范围以及点击事件（必须先设置好然后再将富文本设置给YYLabel才可以生效）
//            [one setTextHighlightRange:one.rangeOfAll
//                                 color:kCOLOR_0091FF
//                       backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.1]
//                             tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
//                //自定义代码，此处根据需要调整
//                NSLog(@"查看全文");
//            }];
//            [text appendAttributedString:one];
//        }
//
//    } else {
//
//        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:textStr];
//        //              one.lineSpacing = 2.5;
//        one.font = textFont;
//        one.color = kCOLOR_85888F;
//        //设置点击范围以及点击事件（必须先设置好然后再将富文本设置给YYLabel才可以生效）
//        [one setTextHighlightRange:one.rangeOfAll
//                             color:kCOLOR_85888F
//                   backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.1]
//                         tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
//            //自定义代码，此处根据需要调整
//            NSLog(@"点击全部文字");
//        }];
//        [text appendAttributedString:one];
//    }
//
//    CGSize yySize = CGSizeMake((KWidth - 61 - 16), CGFLOAT_MAX);
//    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:yySize text:text];
//    CGRect rect = layout.textBoundingRect;
//    //        CGSize size = layout.textBoundingSize;
//    self.yyContentLab.attributedText = text;
//    self.yyContentLab.frame = CGRectMake(61, 34, (KWidth - 61 - 16), rect.size.height + 1);
    
//    //有回复
//    BOOL isHasReply = YES;
//    self.tableView.frame = CGRectMake(61, 34 + rect.size.height + 1,  (KWidth - 61 - 16), 300);
////    self.tableView.scrollEnabled = NO;
  
}



- (void)setModel:(RRSeniorCommentsModel *)model {
    [super setModel:model];
    
    
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
    
    
    CGSize yySize = CGSizeMake((KWidth - 61 - 16), CGFLOAT_MAX);
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:yySize text:text];
    CGRect rect = layout.textBoundingRect;
    //        CGSize size = layout.textBoundingSize;
    self.yyContentLab.attributedText = text;
    self.yyContentLab.frame = CGRectMake(61, 34, (KWidth - 61 - 16), rect.size.height + 1);
    
    CGFloat currentHeight = 34 + rect.size.height + 1;
    CGFloat imageViewHeight = 0;
    BOOL isHasImage = model.images.count > 0 ? YES : NO;
    if (isHasImage) {
        RRSeniorCommentsImageModel *singleImage = [model.images firstObject];
        self.singleImageView.hidden = NO;
//        [self.singleImageView rr_setImageWithURLString:singleImage.url  placeholderImage:KplaceholderImg];
 
        CGFloat width = singleImage.width;
        CGFloat height = singleImage.height;
        CGFloat x = 61;
        CGFloat y = 8 + currentHeight;
        CGFloat max = 197;
        CGFloat showWidth = 0;
        CGFloat showHeight = 0;
        
        if (width > height) {
            showWidth = max * 4 / 3;
            showHeight = max;

        } else if (width < height) {
            showWidth = max;
            showHeight = max * 4 / 3;

        } else {
            showWidth = max;
            showHeight = max;
            
        }
        self.singleImageView.frame = CGRectMake(x, y, showWidth, showHeight);
        imageViewHeight = showHeight;
    } else {
        self.singleImageView.hidden = YES;
        self.singleImageView.frame = CGRectZero;
        imageViewHeight = 0;

    }
    if (imageViewHeight > 0) {
        currentHeight = currentHeight + 8 + imageViewHeight;
    }
}

+ (CGFloat)cellHeightWithModel:(RRSeniorCommentsModel *)model {
    if (!model) {
        return 0;
    }
    
    YYLabel *yyContentLab = [YYLabel new];
    yyContentLab.frame = CGRectMake(0, 0, KWidth - 61 - 16, 300);
    yyContentLab.font = RR_COMMONFONT(14);
    yyContentLab.lineBreakMode = NSLineBreakByCharWrapping;
    yyContentLab.numberOfLines = 0;
    
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
    text.color = kCOLOR_85888F;
    
//    BOOL isHasReply = NO;
    BOOL isHasReply = (model.reply2UserName.length > 0 && model.reply2UseId.length > 0);
    if (isHasReply) {
        {
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:replyStr];
            //              one.lineSpacing = 2.5;
            one.font = textFont;
            one.color = kCOLOR_85888F;
            [text appendAttributedString:one];
        }
        {
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
//            WS(weakSelf)
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:textStr];
            //              one.lineSpacing = 2.5;
            one.font = textFont;
            one.color = kCOLOR_dynamicProvider_222222_DADBDC;
//            //设置点击范围以及点击事件（必须先设置好然后再将富文本设置给YYLabel才可以生效）
//            [one setTextHighlightRange:one.rangeOfAll
//                                 color:kCOLOR_85888F
//                       backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.1]
//                             tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
//                //自定义代码，此处根据需要调整
//                NSLog(@"点击全部文字");
//                [weakSelf clickTextBtn];
//            }];
            [text appendAttributedString:one];
        }
    } else {
//        WS(weakSelf)
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:textStr];
        //              one.lineSpacing = 2.5;
        one.font = textFont;
        one.color = kCOLOR_dynamicProvider_222222_DADBDC;
//        //设置点击范围以及点击事件（必须先设置好然后再将富文本设置给YYLabel才可以生效）
//        [one setTextHighlightRange:one.rangeOfAll
//                             color:kCOLOR_85888F
//                   backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.1]
//                         tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
//            //自定义代码，此处根据需要调整
//            NSLog(@"点击全部文字");
//            [weakSelf clickTextBtn];
//        }];
        [text appendAttributedString:one];
    }
    
    CGSize yySize = CGSizeMake((KWidth - 61 - 16), CGFLOAT_MAX);
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:yySize text:text];
    CGRect rect = layout.textBoundingRect;
    //        CGSize size = layout.textBoundingSize;

    CGFloat currentHeight = rect.size.height + 1;
    CGFloat imageViewHeight = 0;
    BOOL isHasImage = model.images.count > 0 ? YES : NO;
    if (isHasImage) {
        RRSeniorCommentsImageModel *singleImage = [model.images firstObject];
        
        CGFloat width = singleImage.width;
        CGFloat height = singleImage.height;
        CGFloat x = 61;
        CGFloat y = 8 + currentHeight;
        CGFloat max = 197;
        CGFloat showWidth = 0;
        CGFloat showHeight = 0;
        
        if (width > height) {
            showWidth = max * 4 / 3;
            showHeight = max;

        } else if (width < height) {
            showWidth = max;
            showHeight = max * 4 / 3;

        } else {
            showWidth = max;
            showHeight = max;
            
        }
        imageViewHeight = showHeight;
    } else {
        imageViewHeight = 0;
    }
    if (imageViewHeight > 0) {
        currentHeight = currentHeight + 8 + imageViewHeight;
    }
 
    return 34 + 45 + currentHeight;
}

@end
