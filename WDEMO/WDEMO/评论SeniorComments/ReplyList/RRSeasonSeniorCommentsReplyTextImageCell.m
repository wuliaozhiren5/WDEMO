//
//  RRSeasonSeniorCommentsReplyTextImageCell.m
//  NJVideo
//
//  Created by rrtv on 2021/8/12.
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

- (void)setModel:(RRSeniorCommentsModel *)model {
    [super setModel:model];
    //填充数据
    CGFloat contentLabTop = [[self class] getContentLabTop];
    CGFloat spacing = [[self class] getSpacing];
    CGFloat bottomViewHeight = [[self class] getBottomViewHeight];
    
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
//    CGRect rect = layout.textBoundingRect;
    CGSize size = layout.textBoundingSize;
    self.yyContentLab.attributedText = text;
    self.yyContentLab.frame = CGRectMake(61, contentLabTop, (KWidth - 61 - 16), size.height);
    
    //当前高度
    CGFloat currentHeight = contentLabTop - spacing;
    //文字高度
    CGFloat textViewHeight = self.yyContentLab.frame.size.height;
    if (textViewHeight > 0) {
        currentHeight = currentHeight + spacing + textViewHeight;
    }
    //    CGFloat currentHeight = contentLabTop + rect.size.height;
    //图片高度
    CGFloat imageViewHeight = 0;
    NSInteger imageCount = model.images.count;
    if (imageCount == 1) {
        //等于1张图
        RRSeniorCommentsImageModel *singleImage = [model.images firstObject];
        CGFloat width = singleImage.width;
        CGFloat height = singleImage.height;
        CGFloat x = 61;
        CGFloat y = spacing + currentHeight;
        CGFloat max = 197;
        CGFloat showWidth = 0;
        CGFloat showHeight = 0;
        
//        if (width > height) {
//            showWidth = max * 4 / 3;
//            showHeight = max;
//
//        } else if (width < height) {
//            showWidth = max;
//            showHeight = max * 4 / 3;
//
//        } else {
//            showWidth = max;
//            showHeight = max;
//
//        }
        
        //5.9UI展示逻辑修改
        showWidth = (KWidth - 61 - 16) - 100;
        showHeight = showWidth;
        
        self.photoCollectionView.hidden = NO;
        self.photoCollectionView.frame = CGRectMake(x, y, showWidth, showHeight);
        self.photoCollectionView.data = model.images;
        imageViewHeight = showHeight;
    } else if (imageCount > 1) {
        //大于1张图
        //最大长度
        CGFloat maxWidth = (KWidth - 61 - 16);
        //最大高度
        CGFloat maxHeight = maxWidth;
        //间距
        CGFloat imageSpacing = 2;
        //单个长度
        CGFloat oneImageWidth = (KWidth - 61 - 16 - imageSpacing * 2) / 3;
        //最大高度
        CGFloat oneImageHeight = oneImageWidth;
        //实际长度
        CGFloat multiImageViewWidth = 0;
        //实际高度
        CGFloat multiImageViewHeight = 0;
  
        CGFloat x = 61;
        CGFloat y = spacing + currentHeight;
        
        switch (imageCount) {
            case 0:
            case 1:
                multiImageViewWidth = 0;
                multiImageViewHeight = 0;
                break;
            case 2:
                multiImageViewWidth = oneImageWidth * imageCount + imageSpacing * (imageCount - 1);
                multiImageViewHeight = oneImageHeight;
                break;
            case 3:
                multiImageViewWidth = oneImageWidth * imageCount + imageSpacing * (imageCount - 1);
                multiImageViewHeight = oneImageHeight;
                break;
            case 4:
                multiImageViewWidth = oneImageWidth * 2 + imageSpacing;
                multiImageViewHeight = oneImageHeight * 2 + imageSpacing;
                break;
            case 5:
            case 6:
                multiImageViewWidth = oneImageWidth * 3 + imageSpacing * 2;
                multiImageViewHeight = oneImageHeight * 2 + imageSpacing;
                break;
            case 7:
            case 8:
            case 9:
                multiImageViewWidth = maxWidth;
                multiImageViewHeight = maxHeight;
                break;
            default:
                multiImageViewWidth = maxWidth;
                multiImageViewHeight = maxHeight;
                break;
        }
//        self.singleImageView.hidden = YES;
//        self.singleImageView.frame = CGRectZero;
        
        self.photoCollectionView.hidden = NO;
        self.photoCollectionView.frame = CGRectMake(x, y, multiImageViewWidth, multiImageViewHeight);
        self.photoCollectionView.data = model.images;
        imageViewHeight = multiImageViewHeight;
    } else {
        //小于1张图
//        self.singleImageView.hidden = YES;
//        self.singleImageView.frame = CGRectZero;
        
        self.photoCollectionView.hidden = YES;
        self.photoCollectionView.frame = CGRectZero;
        imageViewHeight = 0;
    }

    if (imageViewHeight > 0) {
        currentHeight = currentHeight + spacing + imageViewHeight;
    }
    self.bottomView.frame = CGRectMake(0, currentHeight, KWidth, bottomViewHeight);
}

+ (CGFloat)cellHeightWithModel:(RRSeniorCommentsModel *)model {
    if (!model) {
        return 0;
    }
    //填充数据
    CGFloat contentLabTop = [self getContentLabTop];
    CGFloat spacing = [self getSpacing];
    CGFloat bottomViewHeight = [self getBottomViewHeight];
    
    YYLabel *yyContentLab = [YYLabel new];
    yyContentLab.frame = CGRectMake(0, 0, KWidth - 61 - 16, 300);
    yyContentLab.font = RR_COMMONFONT(14);
//    yyContentLab.lineBreakMode = NSLineBreakByCharWrapping;
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
            one.color = kCOLOR_dynamicProvider_222222_DADBDC;
            [text appendAttributedString:one];
        }
    } else {
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:textStr];
        //              one.lineSpacing = 2.5;
        one.font = textFont;
        one.color = kCOLOR_dynamicProvider_222222_DADBDC;
        [text appendAttributedString:one];
    }
    
    CGSize yySize = CGSizeMake((KWidth - 61 - 16), CGFLOAT_MAX);
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:yySize text:text];
//    CGRect rect = layout.textBoundingRect;
    CGSize size = layout.textBoundingSize;
    yyContentLab.attributedText = text;
    yyContentLab.frame = CGRectMake(61, contentLabTop, (KWidth - 61 - 16), size.height);;
   
    //当前高度
    CGFloat currentHeight = contentLabTop - spacing;
    //文字高度
    CGFloat textViewHeight = yyContentLab.frame.size.height;
    if (textViewHeight > 0) {
        currentHeight = currentHeight + spacing + textViewHeight;
    }
    //    CGFloat currentHeight = contentLabTop + rect.size.height;
    //图片高度
    CGFloat imageViewHeight = 0;
    NSInteger imageCount = model.images.count;
    if (imageCount == 1) {
        //等于1张图
        RRSeniorCommentsImageModel *singleImage = [model.images firstObject];
        CGFloat width = singleImage.width;
        CGFloat height = singleImage.height;
        CGFloat x = 61;
        CGFloat y = spacing + currentHeight;
        CGFloat max = 197;
        CGFloat showWidth = 0;
        CGFloat showHeight = 0;
        
//        if (width > height) {
//            showWidth = max * 4 / 3;
//            showHeight = max;
//
//        } else if (width < height) {
//            showWidth = max;
//            showHeight = max * 4 / 3;
//
//        } else {
//            showWidth = max;
//            showHeight = max;
//
//        }
        
        //5.9UI展示逻辑修改
        showWidth = (KWidth - 61 - 16) - 100;
        showHeight = showWidth;
        
        imageViewHeight = showHeight;
    } else if (imageCount > 1) {
        //大于1张图
        //最大长度
        CGFloat maxWidth = (KWidth - 61 - 16);
        //最大高度
        CGFloat maxHeight = maxWidth;
        //间距
        CGFloat imageSpacing = 2;
        //单个长度
        CGFloat oneImageWidth = (KWidth - 61 - 16 - imageSpacing * 2) / 3;
        //最大高度
        CGFloat oneImageHeight = oneImageWidth;
        //实际长度
        CGFloat multiImageViewWidth = 0;
        //实际高度
        CGFloat multiImageViewHeight = 0;
  
        CGFloat x = 61;
        CGFloat y = spacing + currentHeight;
        
        switch (imageCount) {
            case 0:
            case 1:
                multiImageViewWidth = 0;
                multiImageViewHeight = 0;
                break;
            case 2:
                multiImageViewWidth = oneImageWidth * imageCount + imageSpacing * (imageCount - 1);
                multiImageViewHeight = oneImageHeight;
                break;
            case 3:
                multiImageViewWidth = oneImageWidth * imageCount + imageSpacing * (imageCount - 1);
                multiImageViewHeight = oneImageHeight;
                break;
            case 4:
                multiImageViewWidth = oneImageWidth * 2 + imageSpacing;
                multiImageViewHeight = oneImageHeight * 2 + imageSpacing;
                break;
            case 5:
            case 6:
                multiImageViewWidth = oneImageWidth * 3 + imageSpacing * 2;
                multiImageViewHeight = oneImageHeight * 2 + imageSpacing;
                break;
            case 7:
            case 8:
            case 9:
                multiImageViewWidth = maxWidth;
                multiImageViewHeight = maxHeight;
                break;
            default:
                multiImageViewWidth = maxWidth;
                multiImageViewHeight = maxHeight;
                break;
        }
        imageViewHeight = multiImageViewHeight;
    } else {
        //小于1张图
        imageViewHeight = 0;
    }

    if (imageViewHeight > 0) {
        currentHeight = currentHeight + spacing + imageViewHeight;
    }
 
    return bottomViewHeight + currentHeight;
}

@end
